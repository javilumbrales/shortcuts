alias ll='ls -l'

#Convert MAC files endlines to unix LF
alias tounix="tr '\r' '\n'"

#Start and stop the VM from the command-line
alias startvm='nohup VBoxHeadless --startvm "VMNAME" &'
alias stopvm='VBoxManage controlvm "VMNAME" poweroff'

#Symfony2 helpers
alias cachewarm='php app/console cache:warmup'
alias gettokendev="curl -v 'http://SERVER-REST-URL/oauth/v2/token' -d 'grant_type=password&username=USER&password=PASS'  -u PublicClientIds:ClientSecret"


#PHP Storm Enable/Disable command-line debugger
alias clideb='export XDEBUG_CONFIG="idekey=PhpStorm1 remote_autostart=1 remote_enable=1"'
alias unclideb='export XDEBUG_CONFIG="idekey= remote_autostart=0 remote_enable=0"'

#DB Helpers
alias dbdevel='mysql YOUR_COMMON_DATABASE -A'
alias dbqa='mysql -h REMOTEHOST REMOTEDB -A'

#GIT shortcuts
#Show current branch and show status (lazy)
alias gbr='git branch'
alias gits='git status'

#Go to previous branch (same as cd -)
alias gitback='git checkout -'
#Show the files affeted by the provided commit (last commit if nothing provided)
alias gitfiles='git show --pretty="format:" --name-only'
#Ignore permission diffs
alias gitperms='git config core.fileMode false'
#Pull and push to your personal REMOTE always
alias gpull='git pull MYREMOTE'
alias gpush='git push MYREMOTE'

