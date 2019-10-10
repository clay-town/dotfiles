#   Much of this profile was stolen from natelandeu.com
#
#
#   Change Prompt
#   ------------------------------------------------------------
    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n \n \n| => "
    export PS2="| => "


#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
    export PATH=$PATH:/Users/Orion/Documents/cs271/nand2tetris/tools/
    export PATH=$PATH:/Applications/

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias ll='ls -FGlAhp'
alias pcc='ssh clayton.mccune@syccuxas01.pcc.edu'
alias gURL='https://api.github.com/user/repos'

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
Test here	
}

