doas pkg_add vim
cd
doas curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
chmod +x install.sh
doas install.sh
vim file.rb # you re done!
