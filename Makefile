help:  ## This is help dialog. Enter "make" to get help
	@echo ''
	@echo '	 stack_up - up stack (Jenkins,sonarqube,nexus)'
	@echo '	 compose_install - install docker-compose using apt'
	@echo '	 create_dirs - create dirs for persistent volumes'
	@echo '	 create_users - create OS users jenkins and sonarqube'
	@echo '	 chown_sonarqube_dirs - chown sonarqube dirs'
	@echo '	 jenkins      - up jenkins container as daemon state'
	@echo '	 jenkins_down - down jenkins container'
	@echo '	 prepare_env_apt  - Debian distrib install docker-compose, create users,chown dirs'
	@echo '	 prepare_env_yum  - Centos install docker-compose, create users,chown dirs'
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
	sudo /usr/bin/python3 scripts/mkdir.py

create_users:
	sudo /usr/bin/python3 scripts/useradd.py

chown_sonarqube_dirs:
	sudo /usr/bin/python3 scripts/chown.py

debian_prepare_env: packages_install_apt create_dirs create_users chown_sonarqube_dirs debian_packages_install env_settings

centos_prepare_env: centos_packages_install create_dirs create_users chown_sonarqube_dirs env_settings

centos_packages_install:
	sudo chmod +x scripts/centos_install_packages.sh
	sudo scripts/centos_install_packages.sh
	sudo firewall-cmd --zone=public --add-masquerade --permanent
	sudo firewall-cmd --reload

debian_packages_install:
	sudo apt install -y docker-compose
	sudo apt install -y git

env_settings:
	git config --global user.name "Yury Ponomarev"
	git config --global user.email "underside@ya.ru"
	git config --global credential.helper store
	sudo sysctl -w vm.max_map_count=262144



