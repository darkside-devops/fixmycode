#!/bin/bash

# Determine the package installer based on the distro of linux
if [ -x "$(command -v apt-get)" ]; then
  package_installer="apt-get -y install"
elif [ -x "$(command -v yum)" ]; then
  package_installer="yum -y install"
elif [ -x "$(command -v dnf)" ]; then
  package_installer="dnf -y install"
else
  echo "DUDE I CANNOT DETECT YOUR DISTRO Please install jq, curl, and git manually. Using your favorite Package Installer"
  exit 1
fi

# Check if jq, curl, and git are installed, and install them if they are not
if ! [ -x "$(command -v jq)" ]; then
  $package_installer jq
fi
if ! [ -x "$(command -v curl)" ]; then
  $package_installer curl
fi
if ! [ -x "$(command -v git)" ]; then
  echo "no way you dont have git? lets install that rq"
  $package_installer git
fi

# Check if the fixmycode script is present in the local directory
if [ ! -f "fixmycode" ]; then
  # Clone the specified repository if the fixmycode script is not found
  curl -O https://raw.githubusercontent.com/OfficialCJDesigns/checkmycode/main/fixmycode
fi
mv fixmycode ~/.local/bin/
chmod +x ~/.local/bin/fixmycode
mkdir /usr/share/fixmycode
cd /usr/share/fixmycode
curl -O https://raw.githubusercontent.com/OfficialCJDesigns/checkmycode/main/.config

# Echo instructions for the user
echo "Installation Complete!"
echo "Please Follow the Instructions Below BEFORE you attempt to run the application"
echo "Please put your OpenAI API key inside of the .config file using nano."
echo "You can get your OpenAI API key from https://beta.openai.com/signup."
