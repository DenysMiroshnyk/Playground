#!/usr/bin/env bash
set -e

echo "=== ⚙️ Setting up CppPlayground dev environment ==="

cd "$(dirname "$0")/.."

echo ">>> Installing system dependencies (pipx, ninja-build)..."
sudo apt update
sudo apt install -y pipx ninja-build

echo ">>> Ensuring pipx path..."
pipx ensurepath

if pipx list | grep -q conan; then
    echo ">>> Conan already installed, upgrading..."
    pipx upgrade conan
else
    echo ">>> Installing Conan via pipx..."
    pipx install conan
fi

conan profile detect
echo "Configuring project with Release preset..."
cmake --preset release

echo "Building 000_env_check..."
cmake --build --preset release --target test_env

echo "Running 000_env_check..."
cd build/release/experiments/000_env_check
ctest -V -R test_env