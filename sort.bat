SED -r "/^\s*[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s+|^\s*#|.\s/!s/./0.0.0.0 &/;s/\:[0-9]{2,5}$//;/^\s*$/d" <"E:\Github\hosts\hosts" >"E:\Github\hosts\temp1"
SORT_ -f -u <"E:\Github\hosts\temp1" >"E:\Github\hosts\temp2"
MOVE /Y "E:\Github\hosts\temp2" "E:\Github\hosts\hosts"
DEL /F/Q "E:\Github\hosts\temp*"