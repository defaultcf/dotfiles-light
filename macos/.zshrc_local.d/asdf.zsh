if type brew &>/dev/null; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh

  export RUST_WITHOUT=rust-docs,rust-other-component
fi
