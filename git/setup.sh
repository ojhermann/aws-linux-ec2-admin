if ( ! command -v git &> /dev/null ); then
  sudo dnf update -y
  sudo dnf install git -y
fi

rm -rf ~/.gitconfig
ln -s ~/config/git/.gitconfig ~/.gitconfig
