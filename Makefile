help:  ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
	    IFS=$$'#' ; \
	    help_split=($$help_line) ; \
	    help_command=`echo $${help_split[0]} | sed -e 's/^ //' -e 's/ $$//'` ; \
	    help_info=`echo $${help_split[2]} | sed -e 's/^ //' -e 's/ $$//'` ; \
	    printf "%-30s %s\n" $$help_command $$help_info ; \
	done

compose_install:
	sudo apt install docker-compose 
jenkins: ##Run jenkins
	sudo docker-compose -f compose_files/jenkins.yml up -d
jenkins_down: ##Down jenkins
	sudo docker-compose -f compose_files/jenkins.yml down

