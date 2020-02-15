# Back up important config files to aid in setting up a new Mac

# Script setup
cd
DEST="/Users/ryanoshea/Library/Mobile Documents/com~apple~CloudDocs/Mac Backup/Toast MacBook Pro"

# Shell
CUR_DEST="$DEST/Shell"
rsync -av .zshrc "$CUR_DEST/"
rsync -av .oh-my-zsh/custom "$CUR_DEST/.oh-my-zsh"
rsync -av .zsh_history "$CUR_DEST/"
rsync -av .dotfiles "$CUR_DEST/" # Toast config

# Git
CUR_DEST="$DEST/Git"
rsync -av .gitconfig "$CUR_DEST/"
rsync -av .gitignore_global "$CUR_DEST/"

# SSH
CUR_DEST="$DEST/SSH"
rsync -av .ssh "$CUR_DEST"

# VS Code
CUR_DEST="$DEST/VSCode"
rsync -av "Library/Application Support/Code/User/settings.json" "$CUR_DEST/"

# iTerm2
CUR_DEST="$DEST/iTerm2"
rsync -av "Library/Preferences/com.googlecode.iterm2.plist" "$CUR_DEST/"

# IntelliJ IDEA
CUR_DEST="$DEST/IntelliJ"
rsync -av "Library/Preferences/IntelliJIdea2019.3" "$CUR_DEST/"
rsync -av "Library/Application Support/IntelliJIdea2019.3" "$CUR_DEST/"

# BetterTouchTool
CUR_DEST="$DEST/BetterTouchTool"
mkdir "$CUR_DEST"
mkdir "$CUR_DEST/Automated Backups/"
rsync -av "Library/Application Support/BetterTouchTool/Backups/" "$CUR_DEST/Automated Backups/"

# Details of installed applications
rm "$DEST/installed-applications.txt"
system_profiler SPApplicationsDataType > "$DEST/installed-applications.txt"
