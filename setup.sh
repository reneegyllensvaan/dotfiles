ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/Xresources ~/.Xresources
ln -sf $PWD/tmux.conf ~/.tmux.conf
mkdir ~/.vim
ln -sf $PWD/bundle ~/.vim/bundle
ln -sf $PWD/zshrc ~/.zshrc
mkdir ~/.zfunctions
fpath=( "$HOME/.zfunctions" $fpath )
ln -sf "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -sf "$PWD/async.zsh" "$HOME/.zfunctions/async"


