FROM golang:latest
MAINTAINER thomas.steinbach@aikq.de

RUN adduser --disabled-password --gecos '' user1000 && \
    go get github.com/constabulary/gb/...

USER user1000

VOLUME /src
WORKDIR /src

ENTRYPOINT ["gb"]
CMD ["build"]
