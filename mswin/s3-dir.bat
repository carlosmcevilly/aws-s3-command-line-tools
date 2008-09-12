@echo off
if %1x==x goto usage
if x%aws_id%==x goto nocred
if x%aws_key%==x goto nocred
s3curl.pl --id=%aws_id% --key=%aws_key% -- https://s3.amazonaws.com/%1
goto end
:nocred
echo environment variables aws_id and aws_key must be set with aws credentials
goto end
:usage
echo %0: list the files on Amazon's Simple Storage Service
echo   usage: %0 bucketname
:end
