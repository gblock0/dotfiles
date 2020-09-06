#!/usr/bin/env sh

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

echo "only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Auto"

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Disable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool False

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

echo "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "
