#!/usr/bin/python3
import os
import subprocess
import sys
dirs_path = ['/opt/nexus','/opt/jenkins','/opt/sonarqube/logs','/opt/sonarqube/conf','/opt/sonarqube/','/opt/sonarqube/temp','/opt/sonarqube/data','/opt/sonarqube/extensions', ] 
for x in dirs_path:
    try:
        subprocess.run(['chown', '-R', '1005', x ])
    except:
        print(f"Failed to add user.")
        sys.exit(1)
print("Directories occupied, Master!")
