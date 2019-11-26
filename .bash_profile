#
#   Change Prompt
#   ------------------------------------------------------------
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}
export PS1="\u@\[\033[32m\]\w\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\] 🤘🤖\n🔥  "
#export PS1="\u@\[\e[35m\]\w\[\e[m\]\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\]\ \n🤘 =>> "

#   Set Paths
#   ------------------------------------------------------------
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
alias ll='ls -FGlAhp'
alias pcc='ssh clayton.mccune@syccuxas01.pcc.edu'
alias gURL='https://api.github.com/user/repos'
alias vp='vim ~/.bash_profile'
alias sce='source ~/.bash_profile'
alias please='sudo'
alias cpwd="pwd | xclip && echo 'pwd copied to clipboard'"
alias x='xclip'
alias v='xclip -o'
alias bp='.bash_profile'
alias p='cd /home/justin/Documents/projects'
alias goog='googler --count 3 --exact'
alias ap='atom ~/.bash_profile'
alias c='clear'
alias ga='git add .'
alias gr='git remote -v'
alias hist='cat /dev/null>~/.bash_history'
alias goodnight='logout'
alias gob='go run cmd/tradewars/main.go cmd/tradewars/handlers.go'

#this function is used to create a new git Repo (locally and at github)
# $repName name of the repository (there is no default name)
# $header: header for your readme file
# $body: body for your readme file
nRepo () {
	repName=${1}
	header=${2:-"Starting Ritual"}
	body=${3:-"Project start ritual for speed, power and profit"}
	mkdir $repName
	cd $repName
	touch main.py
	touch .gitignore
	echo '## '$header' ##' >> README.md
	echo '' >> README.md
	echo '' >> README.md
	echo ''$body'' >> README.md
	git init
	git add .
	curl -u "clay-town" https://api.github.com/user/repos -d '{"name":"'$repName'"}'
	git remote add origin git@github.com:clay-town/$repName.git
	git commit -m'initial commit'
	git push --set-upstream origin master
}

#builds a repo on githu
bRepo () {
	repName=${1}
	curl -u "clay-town" https://api.github.com/user/repos -d '{"name":"'$repName'"}'
  git remote add origin https://github.com/clay-town/$repName.git
  git remote set-url https://github.com/clay-town/$repName.git
  git add .
  git commit -m'initial commit'
  git push --set-upstream origin master
}

# https://www.digitalocean.com/community/tutorials/how-to-install-go-and-set-up-a-local-programming-environment-on-ubuntu-18-04
# cd ~
# curl -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
# sha256sum go1.12.1.linux-amd64.tar.gz
# sudo tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local
# sudo chown -R root:root /usr/local/go
#
# mkdir -p $HOME/go/{bin,src}
#
#
# nano ~/.profile
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
# . ~/.profile
# echo $PATH
# go version
