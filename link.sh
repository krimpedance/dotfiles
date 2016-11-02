#!/bin/sh

function errorHandling() {
  echo 'Error...'
  exit 1;
}


# link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.inputrc ~/.inputrc
echo 'links has been completed!'

# Install NeoBundle
echo 'NeoBundle: installing ...'
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  echo 'clone'
  git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim || errorHandling
fi
echo 'NeoBundle: installed!'

# Bash extension for Git
TLFrameworkURL=`grep "# For Git" ~/.bashrc`
if [ -z "$TLFrameworkURL" ]; then
  echo 'Install bash extension for Git...'
  sudo mkdir -p /usr/local/etc/bash_completion.d/
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh || errorHandling
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash || errorHandling
  sudo mv git-prompt.sh /usr/local/etc/bash_completion.d/.
  sudo mv git-completion.bash /usr/local/etc/bash_completion.d/.

  echo '' >> $HOME/.bashrc
  echo '# For Git' >> $HOME/.bashrc
  echo 'source /usr/local/etc/bash_completion.d/git-completion.bash' >> $HOME/.bashrc
  echo 'source /usr/local/etc/bash_completion.d/git-prompt.sh' >> $HOME/.bashrc
  echo 'GIT_PS1_SHOWDIRTYSTATE=true' >> $HOME/.bashrc
  echo "export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '" >> $HOME/.bashrc
fi

source $HOME/".bashrc"

echo 'Completed!🍺'
