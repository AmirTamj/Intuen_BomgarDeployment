#!/bin/bash
PROCESS=bomgar
number=$(ps aux | grep -v grep | grep -ci $PROCESS)

if [ $number -eq 0 ]
    then    
        scriptDir=$(dirname $0)
        hdiutil attach -nobrowse -mountpoint /Volumes/bomgar-install $scriptDir/bomgar-scc-InstallKey.dmg
        sudo /Volumes/bomgar-install/Double-Click\ To\ Start\ Support\ Session.app/Contents/MacOS/sdcust --silent
        sleep 15
fi
