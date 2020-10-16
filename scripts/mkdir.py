#!/usr/bin/python3 
import os 
dirs_path = ['/opt/nexus','/opt/jenkins','/opt/sonarqube/logs','/opt/sonarqube/conf','/opt/sonarqube/','/opt/sonarqube/temp','/opt/sonarqube/data','/opt/sonarqube/extensions', ] 
for x in dirs_path:
    os.makedirs(x,mode=0o777,exist_ok=True) 
    print(x)
# os.mkdir(dir_path) 
print("Directories above were built, Master!") 
