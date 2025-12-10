#!/usr/bin/env bash
set -e

VENV_DIR="$HOME/.config/nvim/virtual_environments/nvim-python"

echo "Creating Neovim Python virtual environment at:"
echo "  $VENV_DIR"
echo

# Ensure base tools exist
sudo apt install -y python3-venv python3-full

# Create venv if it does not exist
if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
fi

# Activate venv
source "$VENV_DIR/bin/activate"

# Upgrade pip tooling
pip install --upgrade pip wheel setuptools

# Install Neovim + Jupyter dependencies
pip install \
  pynvim \
  jupyter_client \
  ipykernel \
  jedi

# Register kernel (optional but useful)
python -m ipykernel install --user --name nvim-python --display-name "Neovim Python"

deactivate

echo
echo "Neovim Python environment successfully created."
echo "Python path:"
echo "  $VENV_DIR/bin/python3"

