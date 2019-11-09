@echo off
GREP -P "^\d{1,}" <"E:\Github\hosts\IPs.txt" >"%TEMP%\IPs_001.txt"
GREP -P "^#" <"E:\Github\hosts\IPs.txt" >"%TEMP%\IPs_headerbrowlock.txt"
SORT_ -f -u <"%TEMP%\IPs_001.txt" >"%TEMP%\IPs_002.txt"
TYPE "%TEMP%\IPs_headerbrowlock.txt">"E:\Github\hosts\IPs.txt"
TYPE "%TEMP%\IPs_002.txt">>"E:\Github\hosts\IPs.txt"
DEL /F/Q "%TEMP%\IPs_*"