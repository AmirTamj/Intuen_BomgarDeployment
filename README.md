# Deploy Bomgar jump client on Mac OS with Intune

## Download
Downlaod & install [Pakckages for MacOS](http://s.sudre.free.fr/Software/Packages/about.html).

Download Bomgar-scc-\<GUID\> DMG for progragmmatic installation from your bomgar appliance.

Download the "postinstall.sh" and "Bomgar.mobileconfig" files.

## Create a custom pkg file
Open packages and create a raw project, name the project and add the working directory.

Go to Scripts folder.

Copy the postinstall.sh to project directory.

Edit the postinstall.sh with your install key.
```
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
```

On Packages script tab, import postinstall.sh and bomgar.dmg as additional resource
![Screenshot1](images/screen1.png)

Command+B to build the package.

Create a new Intune MacOS app and select PKG
