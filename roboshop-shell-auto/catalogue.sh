
echo -e "\e[33m Module list \e[0m"
yum module disable nodejs -y &>>/tmp/roboshop.log &>>/tmp/roboshop.log
yum module enable nodejs:18 -y &>>/tmp/roboshop.log &>>/tmp/roboshop.log

echo -e "\e[33m  install NodeJs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log &>>/tmp/roboshop.log

echo -e "\e[33m  add app user \e[0m"
rm -rf useradd &>>/tmp/roboshop.log
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m  create directory \e[0m"
create directory &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m Download application code \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log

echo -e "\e[33m download the dependencies \e[0m"
cd /app &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log

echo -e "\e[33m copy the catalog service and update \e[0m"
cp /home/centos/devopswithaws/roboshop-shell-auto/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[33m Setup the MongoDB repo file \e[0m"
cp /home/centos/devopswithaws/roboshop-shell-auto/mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m Load the service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[33m Start the service \e[0m"
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

