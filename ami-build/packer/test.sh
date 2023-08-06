#!/usr/bin/bash
name=$1 #docker-compose folder name
id=$2 #main server id (for replacing id in .env and sending logs via teams)
docker_path=/home/ps/docker-compose


# scripts for setting the server
sudo mkdir -p /home/ps
sudo mkdir -p /home/ps/logs
sudo mkdir -p /home/ps/.aws

sudo mkdir -p $docker_path
sudo mkdir -p $docker_path/$name

curl -O https://ps-install.s3.ap-northeast-2.amazonaws.com/data-bahn-install/data-bahn-watcher
sudo mkdir -p /home/ps/tools/
sudo mkdir -p /home/ps/tools/logs
sudo cp ./data-bahn-watcher /home/ps/tools

sudo mkdir -p /home/ps/job_components
sudo mkdir -p /home/ps/tmp_signal
sudo mkdir -p /home/ps/csv

sudo mkdir -p /home/ps/source
sudo mkdir -p /home/ps/source/lwrepo
sudo mkdir -p /home/ps/source/lwrepo1
sudo mkdir -p /home/ps/source/lwrepo2
sudo mkdir -p /home/ps/source/lwrepo3

sudo mkdir -p /home/ps/logs/main/main1
sudo mkdir -p /home/ps/logs/main/main2
sudo mkdir -p /home/ps/logs/main/main3

sudo mkdir -p /home/ps/logs/messenger/messenger1
sudo mkdir -p /home/ps/logs/messenger/messenger2
sudo mkdir -p /home/ps/logs/messenger/messenger3

sudo mkdir -p /home/ps/logs/video/video1
sudo mkdir -p /home/ps/logs/video/video2
sudo mkdir -p /home/ps/logs/video/video3

sudo chmod 777 /home/ps -R
sudo chmod 777 ./data-bahn-watcher


##scripts for setting ECR
profile=ps
aws_access_key_id=AKIAQVWUZ2DRFT3JQHRL
aws_secret_access_key=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
region=ap-northeast-2

aws configure set aws_access_key_id $aws_access_key_id --profile $profile
aws configure set aws_secret_access_key $aws_secret_access_key --profile $profile
aws configure set region $region --profile $profile
aws configure set output "json" --profile $profile


#run command
echo "[Run below command to start servers]"
echo "cd /home/ps/tools/ && ./data-bahn-watcher --saveLog --reStart --docker_path $docker_path --name $name --id $id"


#add crontab
echo "[Add below command in Crontab]"
echo "*/30 * * * * cd /home/ps/tools/ && ./main --saveLog --reStart --docker_path $docker_path --name $name --id $id"