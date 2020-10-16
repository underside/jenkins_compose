help:  ## This is help dialog. Enter "make" to get help
	@echo ''
	@echo '	 stack_up - up stack (Jenkins,sonarqube,nexus)'
	@echo '	 compose_install - install docker-compose using apt'
	@echo '	 create_dirs - create dirs for persistent volumes'
	@echo '	 create_users - create OS users jenkins and sonarqube'
	@echo '	 chown_sonarqube_dirs - chown sonarqube dirs'
	@echo '	 jenkins      - up jenkins container as daemon state'
	@echo '	 jenkins_down - down jenkins container'
	@echo '	 prepare_env  - install docker-compose, create users,chown dirs'
	@echo '	 git_settings  - set git settings'
	@echo ''

stack_up:
	sudo docker-compose -f compose_files/docker-compose.yml up -d
stack_down:
	sudo docker-compose -f compose_files/docker-compose.yml down
jenkins_up:
	sudo docker-compose -f compose_files/jenkins.yml up -d
jenkins_down:
	sudo docker-compose -f compose_files/jenkins.yml down
create_dirs:
	sudo /usr/bin/python3.8 scripts/mkdir.py
create_users:
	sudo /usr/bin/python3.8 scripts/useradd.py
chown_sonarqube_dirs:
	sudo /usr/bin/python3.8 scripts/chown.py
prepare_env: create_dirs create_users chown_sonarqube_dirs compose_install env_settings
packages_install:
	sudo apt install -y docker-compose
	sudo apt install -y git
env_settings:
	git config --global user.name "Yury Ponomarev"
	git config --global user.email "underside@ya.ru"
	git config --global credential.helper store
	sudo sysctl -w vm.max_map_count=262144
