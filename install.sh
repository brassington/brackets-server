# Refer to CONTRIBUTING.md for more detail on build steps:
# https://github.com/rabchev/brackets-server/blob/master/CONTRIBUTING.md

# Grab submodules
git submodule update --recursive --init

# Target specific commit version by checking out from brackets-src submodule
cd brackets-src/
git checkout ea908cae55233d34f04b4f2cab5faf62ffa4fb42
git reset HEAD --hard
cd ../

# Replace CodeMirror2 directly from repo
# sudo rm -rf ./brackets-src/src/thirdparty/CodeMirror2
# git clone https://github.com/codemirror/CodeMirror ./brackets-src/src/thirdparty/CodeMirror2 --recursive

# Fix blocking build issue TODO: Why does Brackets commit: 5742874a7449525488535679b2b2fef009bdfed9 cause LiveDev blocking issue?
wget -O ./brackets-src/src/LiveDevelopment/LiveDevelopment.js https://raw.githubusercontent.com/adobe/brackets/9b92198f962d273231ac6b399fd7649cb9a5a37b/src/LiveDevelopment/LiveDevelopment.js

# Install NPM dependencies
sudo npm install

# Fix blocking build issue (Does not work on OSX, sed issue?) TODO: Why is this line a problem?
sed -i 's%#grid > .core > .span(@gridColumns);%//#grid > .core > .span(@gridColumns);%' ./brackets-src/src/styles/bootstrap/navbar.less

# Run Grunt build, to install grunt: npm install -g grunt-cli
sudo grunt build

# Clone down copies of custom/default installed extensions
cd embedded-ext/
git clone https://github.com/jabbrass/brackets-working-file-tabs.git
cd ../

# Use this command to start the server from the build directory
# node bin/run -d
#
# or use this command set of commands to remove you current global brackets-server installation
# npm uninstall -g brackets
# npm install -g
