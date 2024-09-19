#!/bin/bash

# Clean up files if we have them
rm -rf $HOME/.zshrc
rm -rf $HOME/.p10k.zsh

# Check for Oh My Zsh and install if we don't have it
if ! [ -x "$(command -v ZSH)" ]; then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

clone_or_pull(){
  repo_url=$1
  directory=$2

  if [ ! -d "$directory" ]; then
    git clone "$repo_url" "$directory" || exit 1
  else
    cd "$directory" && git pull "$repo_url" || exit 1
  fi
}


# Install zsh plugins
install_plugins() {
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  type=$1
  name=$2
  repo=$3

  if [ "$type" = "theme" ]; then
    plugin_path=$ZSH_CUSTOM/themes
  elif [ "$type" = "plugin" ]; then
    plugin_path=$ZSH_CUSTOM/plugins
  else
    echo "Invalid type: $type"
    return 1
  fi

  plugin_path=$plugin_path/$name

  clone_or_pull "$repo" "$plugin_path"
}

install_plugins theme powerlevel10k https://github.com/romkatv/powerlevel10k.git
install_plugins plugin ohmyzsh-full-autoupdate https://github.com/Pilaton/OhMyZsh-full-autoupdate.git
install_plugins plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
install_plugins plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git

cd $HOME/.dotfiles || exit 1

DOT_FOLDERS="nvim, kitty, zsh"

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE --ignore=.DS_Store\
        -t $HOME -D $folder
    stow --ignore=.DS_Store -v -t $HOME $folder
done

# Reload shell once installed
echo "[+] Reloading shell..."
exec $SHELL -l
