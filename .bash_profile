#
#   Change Prompt
#   ------------------------------------------------------------
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}
export PS1="\u@\[\033[32m\]\w\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\] 🤘 \n 🤖 🔥🔥🔥  "
#export PS1="\u@\[\e[35m\]\w\[\e[m\]\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\]\ \n🤘 =>> "

#   Set Paths
#   ------------------------------------------------------------
   
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
alias c='xclip'
alias v='xclip -o'
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

#tRepo takes a respository you cloned and resets the upstream branch to one that you created in your own github
tRepo () {
	repName=${1}
	curl -u "clay-town" https://api.github.com/user/repos -d '{"name":"'$repName'"}'
	git remote set-url origin https://github.com/clay-town/$repName.git
}

