#! /bin/zsh

source ./setup.sh

cp Brewfile.work Brewfile
brew bundle
rm Brewfile

# Initializ docker
docker run hello-world

# Set up the dock
printf "%s\n" "Dock - Remove all default app icons & add desired; set size."
defaults write com.apple.dock persistent-apps -array

dockIcons=(
  /System/Applications/Messages.app
  "/Applications/Microsoft Teams.app"
  /Applications/Firefox.app
  "/Applications/Google Chrome.app"
  /Applications/Slack.app
  /Applications/Typora.app
  "/Applications/Microsoft Outlook.app"
  /Applications/iThoughtsX.app
  "/Applications/GitHub Desktop.app"
  "/Applications/1Password 7.app"
  /Applications/iTerm.app
  /Applications/Spotify.app
  /Applications/Atom.app
  "/Applications/Microsoft OneNote.app"
  /Applications/draw.io.app
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

# Configure work GitHub
git config user.email "andy.tinkham@cyberark.com"
git config user.name "Andy Tinkham"
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
