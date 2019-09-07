My [Vim](https://www.vim.org/) configuration.

Quick install without a plugin manager:

	git clone https://github.com/pawel-slowik/dotfiles-vim.git ~/dotfiles/vim
	cd ~/dotfiles/vim
	echo /pack >> .git/info/exclude
	mkdir -p pack/plugins/start
	cd pack/plugins/start
	for github_url in $(<../../../plugins.txt); do git clone "$github_url.git"; done
	ln -si ~/dotfiles/vim ~/.vim
