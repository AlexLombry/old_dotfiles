cd ~/.vim/bundle/command-t/ruby/command-t/
rbenv local system
ruby extconf.rb
make clean # remember to clean old ruby file before recompile
make
