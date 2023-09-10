# Deploy BeyondTrust Bomgar jump client on Mac OS with Intune

## Download
Downlaod & install [Pakckages for MacOS](http://s.sudre.free.fr/Software/Packages/about.html).

Download Bomgar-scc-\<GUID\> DMG for progragmmatic installation from your bomgar appliance.

Download the provided "postinstall.sh" and "Bomgar.mobileconfig" files.

## Create a custom pkg file
Open packages and create a raw project, name the project and add the working directory.

Copy the postinstall.sh and Bomgar-scc-\<GUID\>.dmg files to project directory.

Edit the postinstall.sh with your install key.
```
#!/bin/bash
PROCESS=bomgar
number=$(ps aux | grep -v grep | grep -ci $PROCESS)

if [ $number -eq 0 ]
    then    
        scriptDir=$(dirname $0)
        hdiutil attach -nobrowse -mountpoint /Volumes/bomgar-install $scriptDir/bomgar-scc-\<GUID\>.dmg
        sudo /Volumes/bomgar-install/Double-Click\ To\ Start\ Support\ Session.app/Contents/MacOS/sdcust --silent
        sleep 15
fi
```

On Packages, go to the script tab and import "postinstall.sh" and "bomgar.dmg" from the project folder.
![Screenshot1](images/screen1.png)

Use Command+B or build menu to build the package.

## Deploy the package with Intune
Create a new Intune MacOS app and select PKG
