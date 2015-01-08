sudo npm install
git submodule update --init
sudo rm-rf ./brackets-src/src/thirdparty/CodeMirror2
git clone https://github.com/codemirror/CodeMirror ./brackets-src/src/thirdparty/CodeMirror2 --recursive
sed -i '' 's%#grid > .core > .span(@gridColumns);%//#grid > .core > .span(@gridColumns);%' ./brackets-src/src/styles/bootstrap/navbar.less 
sudo grunt build
 
