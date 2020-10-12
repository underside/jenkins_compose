help:  ## This is help dialog. Enter "make" to get help
	@echo ''
	@echo '	| compose_install | install docker-compose using apt'
	@echo '-----------------------------------------------------'
	@echo '	| jenkins         | up jenkins container as daemon state'
	@echo '-----------------------------------------------------'
	@echo '	| jenkins_down    | down jenkins container'
	@echo ''

compose_install:
	sudo apt install -y docker-compose
jenkins:
	sudo docker-compose -f compose_files/jenkins.yml up -d
jenkins_down:
	sudo docker-compose -f compose_files/jenkins.yml down

