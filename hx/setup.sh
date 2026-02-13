if ( ! command -v gcc &> /dev/null ); then
  sudo dnf install gcc -y
fi

if ( ! command -v g++ &> /dev/null ); then
  sudo dnf install g++ -y
fi

if ( ! command -v hx &> /dev/null ); then
  git clone https://github.com/helix-editor/helix ~/helix
  cargo install --path ~/helix/helix-term --locked
  mkdir -p ~/.config/helix/
  ln -Tsf $PWD/runtime ~/.config/helix/runtime
fi

