sudo chown -R $USER /usr/lib/node_modules
sudo chown -R $USER ../../QA-Final-Project

npm install

sudo npm install -g protractor

#prevent the google mesage from showing
export NG_CLI_ANALYTICS=ci
sudo npm install -g @angular/cli -n

npm install --save-dev @angular-devkit/build-angular

sudo npm install -g typescript@3.4
npm link typescript

ng config -g cli.warnings.versionMismatch false

ng e2e