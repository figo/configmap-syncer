FROM debian:jessie-slim

RUN apt-get update
RUN apt-get install -y jq curl perl

RUN curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

COPY ./configmap.sh /
RUN chmod 755 /configmap.sh
ENTRYPOINT ["/configmap.sh"]
CMD []
