SED -R "s/\:443$//;s/\/$//;s/^([a-z1-9-\.]+)/0\.0\.0\.0 \1/;/^\s*$/d" <"E:\Github\hosts\hosts" >"E:\Github\hosts\temp1"
SORT_ -f -u <"E:\Github\hosts\temp1" >"E:\Github\hosts\temp2"
MOVE /Y "E:\Github\hosts\temp2" "E:\Github\hosts\hosts"
DEL /F/Q "E:\Github\hosts\temp*"