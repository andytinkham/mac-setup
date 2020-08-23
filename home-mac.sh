#! /bin/zsh

source ./setup.sh

# Install apps
cp Brewfile.home Brewfile
brew bundle
rm Brewfile

#Remaining things
echo "install Bay ROES, Canon IJ Scan Utility, DataColor Spyder Elite, DNA Match Manager, Evidentia, Family Tree Maker 2019, Logi Options, Canon Utilities, Saffire MixControl, Snap Camera"

# Set up the dock
printf "%s\n" "Dock - Remove all default app icons & add desired; set size."
defaults write com.apple.dock persistent-apps -array

dockIcons=(
  /Application/Safari.app
  /Applications/Firefox.app
  /System/Applications/Mail.app
  /System/Application/FaceTime.app
  /System/Applications/Messages.app
  /System/Applications/Music.app
  /Applications/Spotify.app
  /Applications/iTerm.app
  /Applications/Evidentia3.app
  "/Applications/Family Tree Maker 2019.app"
  "/Applications/Reunion 12.app"
  "/Applications/DNA Match Manager.app"
  "/Applications/FTAnalyzer.app"
  /Applications/Slack.app
  /Applications/GoodNotes.app
  /Applications/Things.app
)

for icon in "$dockIcons[@]"
do
  echo "Adding $icon to the dock..."
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$icon</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

defaults write com.apple.dock tilesize -int 40

# Restart the dock
killall Dock

# Configure Personal GitHub
git config user.email "andy@tinkham.org"
git config user.name "Andy Tinkham"
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
