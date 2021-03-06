@echo off
if %2x==x goto usage
if x%aws_id%==x goto nocred
if x%aws_key%==x goto nocred
s3curl.pl --id=%aws_id% --key=%aws_key% --delete -- https://s3.amazonaws.com/%1/%2
goto end
:nocred
echo environment variables aws_id and aws_key must be set with aws credentials
goto end
:usage
echo %0: remove a file on Amazon's Simple Storage Service
echo  usage: %0 bucketname filename
:end

