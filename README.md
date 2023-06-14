# finallabcicd

###Script install slave
``` 
sudo yum update –y
sudo yum install git -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user


wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service

``` 