# .dotfiles configuration

## Prerequisities

You need to download FiraCode Nerd Font available from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)

## Instructions

1. Clone this repository
    ```shell
    git clone https://github.com/andersluong/.dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
    ```

2. Install GNU Stow
    ```shell
    # On Linux
    sudo pacman -S stow
    ```

    ```shell
    # On MacOS
    brew install stow
    ```

3. Run script
    ```shell
    ./install.sh
    ```

    Note: If you don't have oh-my-zsh installed earlier, this will install it first, then you have to run the script again.
