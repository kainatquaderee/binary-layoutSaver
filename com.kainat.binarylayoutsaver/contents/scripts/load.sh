
configPath=$1
savePath=$2
dataPath=$3
modelData=$4

if [ -d "$savePath/$modelData/icons" ]; then
    rm -rf "$dataPath/icons.bak"
    mv "$dataPath/icons" "$dataPath/icons.bak"
    cp -r "$savePath/$modelData/icons" "$dataPath"    
fi

if [ -d "$savePath/$modelData/color-schemes" ]; then
    rm -rf "$dataPath/color-schemes.bak"
    mv "$dataPath/color-schemes" "$dataPath/color-schemes.bak"
    cp -r "$savePath/$modelData/color-schemes" "$dataPath"    
fi

if [ -d "$savePath/$modelData/plasma" ]; then
    rm -rf "$dataPath/plasma.bak"
    mv "$dataPath/plasma" "$dataPath/plasma.bak"
    cp -r "$savePath/$modelData/plasma" "$dataPath"    
fi

if [ -d "$savePath/$modelData/wallpapers" ]; then
    rm -rf "$dataPath/wallpapers.bak"
    mv "$dataPath/wallpapers" "$dataPath/wallpapers.bak"
    cp -r "$savePath/$modelData/wallpapers" "$dataPath"    
fi

if [ -d "$savePath/$modelData/kfontinst" ]; then
    rm -rf "$dataPath/kfontinst.bak"
    mv "$dataPath/kfontinst" "$dataPath/kfontinst.bak"
    cp -r "$savePath/$modelData/kfontinst" "$dataPath"    
fi

#backups
rm -rf "$configPath/plasma-org.kde.plasma.desktop-appletsrc.bak"
mv "$configPath/plasma-org.kde.plasma.desktop-appletsrc" "$configPath/plasma-org.kde.plasma.desktop-appletsrc.bak"
rm -rf "$configPath/.config/plasmarc.bak"
mv "$configPath/.config/plasmarc" "$configPath/.config/plasmarc.bak"
rm -rf "$configPath/.config/plasmashellrc.bak"
mv "$configPath/.config/plasmashellrc" "$configPath/.config/plasmashellrc.bak"

# plasma config files
cp "$savePath/$modelData/plasma-org.kde.plasma.desktop-appletsrc" "$configPath/plasma-org.kde.plasma.desktop-appletsrc"
cp "$savePath/$modelData/plasmarc" "$configPath/plasmarc"
cp "$savePath/$modelData/plasmashellrc" "$configPath/plasmashellrc"
cp "$savePath/$modelData/kdeglobals" "$configPath/kdeglobals"
                                    
#kwin                                    
cp "$savePath/$modelData/kwinrc" "$configPath/kwinrc"
cp "$savePath/$modelData/kwinrulesrc" "$configPath/kwinrulesrc"
                                    
#latte-dock config files   
rm -rf "$configPath/lattedockrc.bak"
mv "$configPath/lattedockrc" "$configPath/lattedockrc.bak"
rm -rf "$configPath/latte.bak"
mv "$configPath/latte" "$configPath/latte.bak"
rm -rf "$configPath/autostart.bak"
mv "$configPath/autostart" "$configPath/autostart.bak"
rm -rf "$configPath/Kvantum.bak"
mv "$configPath/Kvantum" "$configPath/Kvantum.bak"
cp "$savePath/$modelData/lattedockrc" "$configPath/lattedockrc"
cp -r "$savePath/$modelData/latte" "$configPath"
cp -r "$savePath/$modelData/autostart" "$configPath"
cp -r "$savePath/$modelData/Kvantum" "$configPath"
#kvantum



FILE=$savePath/$modelData/latterun

#dolphin config
cp "$savePath/$modelData/dolphinrc" "$configPath/dolphinrc"
#config session desktop
cp "$savePath/$modelData/ksmserverrc" "$configPath/ksmserverrc"
#config input devices
cp "$savePath/$modelData/kcminputrc" "$configPath/kcminputrc"
#shortcuts
cp "$savePath/$modelData/kglobalshortcutsrc" "$configPath/kglobalshortcutsrc"
#klipper config
cp "$savePath/$modelData/klipperrc" "$configPath/klipperrc"
#konsole config
cp "$savePath/$modelData/konsolerc" "$configPath/konsolerc"
#kscreenlocker config
cp "$savePath/$modelData/kscreenlockerrc" "$configPath/kscreenlockerrc"
#krunner config
cp "$savePath/$modelData/krunnerrc" "$configPath/krunnerrc"
#fonts dpi config
cp "$savePath/$modelData/kcmfonts" "$configPath/kcmfonts"


sync
if [ -f "$FILE" ]; then
    killall latte-dock 
    sleep 1 && nohup latte-dock &
else 
    killall latte-dock
fi


qdbus org.kde.KWin /KWin reconfigure 
konsole -e kquitapp5 plasmashell && kstart5 plasmashell --windowclass plasmashell --window Desktop
kstart5 plasmashell --windowclass plasmashell --window Desktop                                    
                            
