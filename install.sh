#!/bin/bash
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
