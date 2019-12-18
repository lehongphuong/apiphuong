@echo off
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time% 

git add *
git commit -m "PhuongLH5: commit all file at %mydate% : %mytime%" 
git push origin master 