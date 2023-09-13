#!/bin/bash

install_LAMP_on_ubuntu() {

        echo "Instaling LAMP stack on Ubuntu..."
        sudo apt update
        sudo apt ugrade
        sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql
        sudo systemctl enable apache2
        sudo systemctl enable mysql
        sudo systemctl start apache2
        sudo systemctl start mysql
        echo "LAMP stack installed successfully."
}

install_LAMP_on_rhel() {

        echo "Instaling LAMP on RHEL..."
        sudo yum update
        sudo yum install -y httpd mariadb-server php php-mysqlnd
        sudo systemctl enable httpd
        sudo systemctl enable mariadb
        sudo systemctl start httpd
        sudo systemctl start mariadb
        echo "LAMP stack instaled successfully."
}

detect_os_and_install_lamp() {
        if [ -f /etc/os-release ];
        then
                . /etc/os-release

                if [[ $ID == "Ubuntu" || $ID_LIKE == *"debian"* ]];
                then
                        install_LAMP_on_ubuntu
                elif [[ $ID == "rhel" || $ID_LIKE == *"centos"* ]];
                then
                        instal_LAMP_on_rhel
                else
                        echo "Error! Unsupported OS."
                        exit 1
                fi
        else
