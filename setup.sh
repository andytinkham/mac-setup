#! /usr/bin/env bash

# Inspired by:
# github.com/bkuhlmann/mac_os-config
# github.com/pathikrit/mac-setup-script

# Applu default settings
printf "%S\n" "System - disable boot sound effects"
sudo nvram SystemAudioVolume=" "

printf "%s\n" "System - Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

printf "%s\n" "System - Disable 'Are you sure you want to open this application?' dialog."
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "%s\n" "System - Require password immediately after sleep or screen saver begins."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "%s\n" "System - Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

printf "%s\n" "System - Avoid creating .DS_Store files on network and USB volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

printf "%s\n" "System - Automatically restart if system freezes."
systemsetup -setrestartfreeze on

printf "%s\n" "Keyboard - Automatically illuminate built-in MacBook keyboard in low light."
defaults write com.apple.BezelServices kDim -bool true

printf "%s\n" "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes."
defaults write com.apple.BezelServices kDimTime -int 300

printf "%s\n" "Keyboard - Enable keyboard access for all controls."
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

printf "%s\n" "Trackpad - Use CONTROL (^) with scroll to zoom."
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

printf "%s\n" "Trackpad - Follow keyboard focus while zoomed in."
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

printf "%s\n" "iCloud - Save to disk by default."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "%s\n" "Finder - Show the $HOME/Library folder."
chflags nohidden $HOME/Library

printf "%s\n" "Finder - Show the /Volumes folder."
sudo chflags nohidden /Volumes

printf "%s\n" "Finder - Show hidden files."
defaults write com.apple.finder AppleShowAllFiles -bool true

printf "%s\n" "Finder - Show filename extensions."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "%s\n" "Finder - Disable the warning when changing a file extension."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "%s\n" "Finder - Show path bar."
defaults write com.apple.finder ShowPathbar -bool true

printf "%s\n" "Finder - Show status bar."
defaults write com.apple.finder ShowStatusBar -bool true

printf "%s\n" "Finder - Use list view in all Finder windows."
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

printf "%s\n" "Finder - Allow text selection in Quick Look."
defaults write com.apple.finder QLEnableTextSelection -bool true

printf "%s\n" "Safari - Set home page to 'about:blank' for faster loading."
defaults write com.apple.Safari HomePage -string "about:blank"

printf "%s\n" "Safari - Use Contains instead of Starts With in search banners."
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

printf "%s\n" "Safari - Enable the Develop menu and the Web Inspector."
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

printf "%s\n" "Safari - Disable sending search queries to Apple.."
defaults write com.apple.Safari UniversalSearchEnabled -bool false

printf "%s\n" "Chrome - Prevent native print dialog, use system dialog instead."
defaults write com.google.Chrome DisablePrintPreview -boolean true

printf "%s\n" "Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'."
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

printf "%s\n" "Printer - Expand print panel by default."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "%s\n" "Printer - Automatically quit printer app once the print jobs complete."
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Command Line Tools for Xcode
sudo xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install atom

# install Atom packages
apm install busy-signal
apm install ide-json
apm install intentions
apm install linter
apm install linter-js-yaml
apm install linter-markdown
apm install linter-rubocop
apm install linter-ruby
apm install linter-shellcheck
apm install linter-ui-default
apm install markdown-preview-plus
apm install markdown-toc
apm install pretty-json
apm install ruby-test
apm install slickwrap
apm install xml-formatter

# Copy over dotfiles
cp -r git-hooks ~
cp .gitconfig ~
cp .gitignore ~
cp .zshrc ~
