FROM gitpod/workspace-full:latest
RUN curl -fsSL https://get.pulumi.com | sh -s  && \
    sudo -H /usr/bin/pip3 install pulumi_kubernetes fastapi pulumi && \
    pip3 install pulumi_kubernetes flask pulumi pulumi_azure prefect streamlit && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    npm install -g typescript
RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
RUN brew install dopplerhq/cli/doppler
ENV PATH="${PATH}:/home/gitpod/.pulumi/bin"
