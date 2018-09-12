# Create a global gitignore for macOS
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >> ~/.gitignore_global 
git config --global core.excludesfile ~/.gitignore_global

# Send screenshots to a directory that isn't the desktop
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

# Show all hidden files (like dotfiles)
defaults write com.apple.finder AppleShowAllFiles YES; killall Finder;

# DANGERZONE: Disable Gatekeeper permanently to allow opening apps from unidentified developers 
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO

# Disable smart quotes to save yourself from pesky syntax errors when copy pasting from Notes/TextEdit
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false