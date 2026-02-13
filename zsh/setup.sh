if ( ! command -v chsh &> /dev/null ); then
  sudo dnf update -y
  sudo dnf install util-linux-user
fi

if ( ! command -v zsh &> /dev/null ); then
  sudo dnf update -y
  sudo dnf install zsh -y
  sudo chsh -s $(which zsh)
fi
