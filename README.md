# dotfiles
Create a local file for all dotfiles. Then the root directory is made up of folders named after the name of the application you have files for. While you could technically name them anything, this is the most common thing to do, since it makes sense.

~/dotfiles/ <- ROOT
~/dotfiles/neovim
~/dotfiles/tmux
~/dotfiles/zsh
~/dotfiles/k9s
~/dotfiles/karabiner
~/dotfiles/alacritty
After that, the structure of each folder is structured as if you were in your home directory. For example:

alacritty houses the config at ~/.config/alacritty/alacritty.yml, so you would make the folder... ~/.dotfiles/alacritty/.config/alacritty/alacritty.yml.

neovim houses the config at ~/.config/nvim/lua/init.lua, so you would make the folder... ~/.dotfiles/neovim/.config/nvim/lua/init.lua.

After all apps are how you want them, you can cd to the root of your ~/dotfiles repo and run stow -vt ~ */, which means *take all the directories at ./ and set symlinks for them in ~. You should have symlinks for all your setups now.

-v is verbose, -t is target directory (~), and the ending argument is what directories to use for symlinks.

To setup just one, you can do stow -vt ~ ~/dotfiles/[app]. To delete one, just do stow -D ~/dotfiles/[app].

Examples:
$ stow -D zshrc neovimlua
## deleted, no comments...

stow -vt ~ zshrc neovimlua
LINK: .config/zsh => ../.dotfile/zshrc/.config/zsh
LINK: .zshrc => .dotfile/zshrc/.zshrc
LINK: .custom-alias => .dotfile/zshrc/.custom-alias
LINK: .config/nvim => ../.dotfile/neovimlua/.config/nvim
## linked two apps.
The best part about this, is you can have many dotfiles for a single project in one area. If you want to test out someones dotfiles, just do..

stow -D neovim
git clone (repo with dots)
stow -vt ~ otherpersonsdots
I use stow to link alacritty, htop, k9s, karabiner, neovim, tmux, tmate, and zshrc in one go. Works out fantastic. Just don't forget to upload your dots to github and treat it like your own personalized development environment that you backup frequently. Great for starting new jobs, too. Just download stow, clone down the repos, and run stow.

Pairing stow with a Brewfile on mac has made setup a breeze, but Brewfile is a small, different topic.

Edit: If you ask, "what about the things I don't want backed up?

Add a line to your zsh to look for something like a .work or .secret file to source if it exists. You can back that up on some other place, but it doesn't have to be with your dots. I use this to look for a lot of files to source:

[ -f ~/.work ] && source ~/.work
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
...
