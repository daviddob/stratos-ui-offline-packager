ARG base_image=ubuntu
FROM ${base_image}

RUN apt update \
  && apt install -y git curl dirmngr zip unzip gcc \
  apt-transport-https lsb-release ca-certificates \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt install -y nodejs \
  && curl -L https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz -o go.tar.gz \
  && tar -xvf go.tar.gz \
  && mv go /usr/local/

ADD offline-package.sh /

ENV GOROOT="/usr/local/go"
ENV PATH="/usr/local/go/bin:${PATH}"

ENTRYPOINT ["/offline-package.sh"]
