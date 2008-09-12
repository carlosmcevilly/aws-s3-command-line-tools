@echo off
if %2x==x goto usage
if %3x==x goto noacl
if x%aws_id%==x goto nocred
if x%aws_key%==x goto nocred
if not %3x==public-readx goto usage
s3curl.pl --id=%aws_id% --key=%aws_key% --acl=public-read --put=%2 -- https://s3.amazonaws.com/%1/%2
goto end
:noacl
s3curl.pl --id=%aws_id% --key=%aws_key% --put=%2 -- https://s3.amazonaws.com/%1/%2
goto end
:nocred
echo environment variables aws_id and aws_key must be set with aws credentials
goto end
:usage
echo %0: put a file onto Amazon's Simple Storage Service
echo  usage: %0 bucketname filename [public-read]
:end
