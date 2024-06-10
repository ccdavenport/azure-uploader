#!/bin/bash
# Command line tool to upload files to Azure storage blob

# Downloads the latest AZCopy tar file from Microsoft and extracts it to an executable
wget -O azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux && tar -xf azcopy_v10.tar.gz --strip-components=1

# Checks to see if azcopy is already installed using this script
sudo rm /usr/bin/azcopy

# Moves the executable to the /usr/bin/ directory so it can be executed from anywhere
sudo cp ./azcopy /usr/bin

# Asks the user for their SAS Blob service URL on Azure
read -p "Enter your SAS Blob Service URL: " SASURL

# Asks the user for the file or directory they wish to upload
read -p "Enter the file or directory you would like to upload to your storage container: " USERFILE

sudo azcopy copy "$USERFILE" "$SASURL"

echo "File uploaded!"