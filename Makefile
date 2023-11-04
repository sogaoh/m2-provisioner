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

aqi:
	aqua i
aqli:
	aqua i -l
aqu:
	aqua up

awsume:
	@if ! which pipx > /dev/null; then \
		echo "pipx is not installed, skipping..."; \
		exit 1; \
	fi
	pipx install awsume
	pipx ensurepath
	pipx inject awsume awsume-console-plugin 
	pipx install aws-sso-util


ma:
	ansible-playbook playbooks/mackerel-agent.yml -i "localhost," -e @variables.yaml --tags=mackerel -K
