# dotfiles

Organized by app. Each folder is a GNU Stow package.

## Install on a new machine
    sudo apt install git stow
    git clone --recurse-submodules <repo-url> ~/dotfiles
    cd ~/dotfiles
    stow vim        # repeat for each package you want
