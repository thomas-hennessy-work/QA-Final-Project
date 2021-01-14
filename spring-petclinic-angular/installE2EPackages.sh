echo "npm install"
npm install

echo "sudo npm install -g protractor"
sudo npm install -g protractor

#prevent the google mesage from showing
export NG_CLI_ANALYTICS=off off
echo "sudo npm install -g @angular/cli"
sudo npm install -g @angular/cli -n

echo "npm install --save-dev @angular-devkit/build-angula"
npm install --save-dev @angular-devkit/build-angular

echo "sudo npm install -g typescript@3.4"
sudo npm install -g typescript@3.4
echo "npm link typescript"
npm link typescript

echo "ng config -g cli.warnings.versionMismatch false"
ng config -g cli.warnings.versionMismatch false

echo "ng e2e"
ng e2e