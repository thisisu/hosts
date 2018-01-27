:: Build Hosts
:: Created by Thisisu
@echo off && SET "hostsD=C:\Windows\System32\drivers\etc"
Echo(Build_Hosts.bat loaded!
ECHO.
ECHO.
COPY /Y "%hostsD%\hosts" "%hostsD%\hosts_backup" >NUL 2>&1
COPY /Y "%hostsD%\hosts" "%TEMP%\hosts_fixme_000" >NUL 2>&1
:: Start dumping
GREP -P "^127\.94\.0\.(?:1|2|3)|^0\.0\.0\.0" <"%TEMP%\hosts_fixme_000" >"%TEMP%\hosts_fixme_001"
GREP -vP "^0\.0\.0\.0 0\.0\.0\.0$" <"%TEMP%\hosts_fixme_001" >"%TEMP%\hosts_fixme_002"
SORT_ -f -u <"%TEMP%\hosts_fixme_002" >"%TEMP%\hosts_fixme_003"
TYPE "E:\Github\hosts\header">"%TEMP%\hosts_final"
TYPE "%TEMP%\hosts_fixme_003">>"%TEMP%\hosts_final"
COPY /Y "%TEMP%\hosts_final" "%hostsD%\hosts"
IF NOT ERRORLEVEL 1 (
  color 17 ) ELSE (
                    COLOR 47
                    ECHO(We encountered an error
                    PAUSE
                    )
ipconfig /flushdns