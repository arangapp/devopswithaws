
echo -e "\e[33m Install Nginx \e[0m"
yum install nginx -y

echo -e "\e[33m Remove the default content \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33m Download the frontend content \e[0m"

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[33m Extract the frontend content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[33m Create Nginx Reverse Proxy Configuration \e[0m"
## we need to copy config file
##vim /etc/nginx/default.d/roboshop.conf

echo -e "\e[33m restart & Enable Nginx service \e[0m"
systemctl enable nginx
systemctl restart nginx
