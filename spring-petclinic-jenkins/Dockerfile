FROM  jenkins/jenkins

USER root

RUN apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y --no-install-recommends install docker-ce sudo jq wget && \
    apt-get clean && \
    usermod -aG docker jenkins && \
    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name') && \
    sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose && \
    docker-compose --version && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    sudo chmod +x kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip && \
    unzip terraform_0.14.4_linux_amd64.zip && \
    sudo mv terraform /usr/local/bin && \
    rm terraform_0.14.4_linux_amd64.zip

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

RUN jenkins-plugin-cli --plugins blueocean:1.24.3
