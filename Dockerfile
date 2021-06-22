FROM amazon/aws-cli:2.2.13

RUN yum install -y \
    git \
    tar \
    python3-pip
RUN amazon-linux-extras install -y docker
RUN pip3 install -U pip
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst
RUN chmod +x envsubst
RUN mv envsubst /usr/local/bin
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN \[ -s "$NVM_DIR/nvm.sh" \] && \. "$NVM_DIR/nvm.sh"
RUN nvm install node
RUN nvm use node
RUN mkdir -p /root/.aws
