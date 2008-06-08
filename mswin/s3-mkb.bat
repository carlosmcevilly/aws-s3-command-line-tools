@echo off
if %1x==x goto usage
if %2x==x goto noacl
if x%aws_id%==x goto nocred
if x%aws_key%==x goto nocred
if not %2x==public-readx goto usage
if not exist s3-empty.tmp type s3-empty.tmp > s3-empty.tmp
s3curl.pl --id=%aws_id% --key=%aws_key% --acl=public-read --put=s3-empty.tmp -- http://s3.amazonaws.com/%1
goto end
:noacl
s3curl.pl --id=%aws_id% --key=%aws_key% --put=s3-empty.tmp -- http://s3.amazonaws.com/%1
goto end
:nocred
echo environment variables aws_id and aws_key must be set with aws credentials
goto end
:usage
echo %0: make a bucket on Amazon's Simple Storage Service
echo  usage: %0 bucketname [public-read]
:end
if exist s3-empty.tmp del s3-empty.tmp
