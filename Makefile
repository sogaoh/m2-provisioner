.PHONY:

help:
	cat Makefile

prezto:
	ansible-playbook playbooks/prezto.yml -i "localhost," --tags=prezto -K
dot:
	ansible-playbook playbooks/dotfiles.yml -i "localhost," --tags=dotfiles -K


gui:
	brew bundle install --file=brewfiles/gui/Brewfile
cli:
	brew bundle install --file=brewfiles/cli/Brewfile
# ext:
# 	brew bundle install --file=brewfiles/extension/Brewfile


ma:
	ansible-playbook playbooks/mackerel-agent.yml -i "localhost," -e @variables.yaml --tags=mackerel -K
