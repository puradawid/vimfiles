#!/bin/bash
default_bundles=(
  nerdtree
)

full_path=`pwd`

echo "Removing bundles if were created already"
rm -rf $full_path/home/.vim/bundle

echo "Creating directories..."
mkdir -p $full_path/home/.vim/bundle
mkdir -p $full_path/home/.vim/snippets
mkdir -p $full_path/home/.vim/tmp/swap
mkdir -p $full_path/home/.vim/tmp/yankring
mkdir -p $full_path/home/.vim/spell

echo "Setting up default vimrc.local..."
cp $full_path/templates/.vimrc.local.example $full_path/home/.vimrc.local

echo "Initializing submodules..."
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git clean -f

echo "Symlinking default bundles..."
for i in "${default_bundles[@]}"; do
  ln -sv $full_path/home/.vim/bundle_storage/$i $full_path/home/.vim/bundle/$i
done

echo "--------------------------------------------------"
echo "*** Install Complete ***"
echo "--------------------------------------------------"
echo "Run the following command to symlink your castle:"
echo "homesick symlink ${PWD##*/}"
echo "--------------------------------------------------"

