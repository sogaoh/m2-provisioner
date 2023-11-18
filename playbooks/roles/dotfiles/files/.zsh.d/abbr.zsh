## git
abbr -S --quiet g='git'
abbr -S --quiet gcl='git config -l'
abbr -S --quiet gb='git branch'
abbr -S --quiet gst='git status'
abbr -S --quiet gsw='git switch'

## docker
abbr -S --quiet d='docker'
abbr -S --quiet dc='docker compose'
abbr -S --quiet di='docker images'
abbr -S --quiet dp='docker ps'
abbr -S --quiet dv='docker volume ls'
abbr -S --quiet dspv='docker system prune --volumes'  # -fa
abbr -S --quiet dbp='docker builder prune'  # -fa

## terraform
abbr -S --quiet tfi='terraform init'
abbr -S --quiet tff='terraform fmt'
abbr -S --quiet tfp='terraform plan'
abbr -S --quiet tfa='terraform apply'
abbr -S --quiet tfim='terraform import'
abbr -S --quiet tfd='terraform destroy'

# awsume
alias awsume=". awsume"
abbr -S --quiet asuc='awsume -c'
abbr -S --quiet asuo='awsume -o ~/.aws/credentials'
abbr -S --quiet asso='aws sso login --profile'

# exec
abbr -S --quiet esl='exec $SHELL -l'

# cd
abbr -S --quiet m2='cd /Volumes/crucial-p5/m2-provisioner'
abbr -S --quiet key='cd ~/.ssh/.identity'

# ov
abbr -S --quiet ovps='ps -ef | ov --header 1 --column-width --column-rainbow'
abbr -S --quiet ovcsv='ov --column-delimiter "," --column-mode --column-rainbow '
