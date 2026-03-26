setup-servers:
	ansible-playbook -i inventory.ini ./playbooks/setup.yml --become --ask-vault-pass

install:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml --become  --ask-vault-pass --tags "deploy"

setup-monitoring:
	ansible-playbook -i inventory.ini playbook.yml --become  --ask-vault-pass --tags "monitoring"

encrypt-vars:
	ansible-vault encrypt group_vars/webservers/vault.yml

decrypt-vars:
	ansible-vault decrypt group_vars/webservers/vault.yml
