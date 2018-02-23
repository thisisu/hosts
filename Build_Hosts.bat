:: Build Hosts
:: Created by thisisu
@echo off && SET "hostsD=C:\Windows\System32\drivers\etc"
Echo(Build_Hosts.bat loaded!
ECHO.
ECHO.
COPY /Y "%hostsD%\hosts" "%hostsD%\hosts_backup" >NUL 2>&1
COPY /Y "%hostsD%\hosts" "%TEMP%\hosts_fixme_000" >NUL 2>&1
:: Start extracting from primary hosts file
GREP -P "^127\.94\.0\.(?:1|2|3)|^0\.0\.0\.0" <"%TEMP%\hosts_fixme_000" >"%TEMP%\hosts_fixme_001"
GREP -vP "^0\.0\.0\.0 0\.0\.0\.0$" <"%TEMP%\hosts_fixme_001" >"%TEMP%\hosts_fixme_002"
:: Now append my entries to that same hosts file
TYPE "E:\Github\hosts\hosts" >>"%TEMP%\hosts_fixme_002"
:: Remove duplicates and sort it
SORT_ -f -u <"%TEMP%\hosts_fixme_002" >"%TEMP%\hosts_fixme_003"
:: Start creating final hosts file
TYPE "E:\Github\hosts\header">"%TEMP%\hosts_final"
TYPE "%TEMP%\hosts_fixme_003">>"%TEMP%\hosts_final"
color 17
sc config Dnscache start= disabled
sc stop Dnscache
NIRCMD wait 2000
COPY /Y "%TEMP%\hosts_final" "%hostsD%\hosts"
sc config Dnscache start= auto
SC start Dnscache
NIRCMD WAIT 2000
ipconfig /flushdns
pause