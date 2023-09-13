#!/bin/bash

install_apache_on_ubuntu() {

        echo "Instaling Apache on Ubuntu..."
        sudo apt update
        sudo apt ugrade
        sudo apt install -y apache2
        echo "Apache installed successfully."
}

install_apache_on_RHEL() {

        echo "Instaling Apache on RHEL..."
        sudo yum update
        sudo yum install -y httpd
        echo "Apache instaled successfully."
}

detect_os_and_install_apache() {
        if [ -f /etc/os-release ];
        then
                . /etc/os-release

                if [[ $ID == "Ubuntu" || $ID_LIKE == *"debian"* ]];
                then
                        install_apache_on_ubuntu
                elif [[ $ID == "rhel" || $ID_LIKE == *"centos"* ]];
                then
                        instal_apache_on_RHEL
                else
                        echo "Error! Unsupported OS."
                        exit 1
                fi
        else
                echo "Error! Unable to detect OS release information."
                exit 1
        fi
}

echo "Starting Apache installations..."
detect_os_and_install_apache
