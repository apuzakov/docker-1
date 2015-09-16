FROM golang:latest
MAINTAINER thomas.steinbach@aikq.de

RUN go get github.com/constabulary/gb/...

VOLUME /src
WORKDIR /src

ENTRYPOINT ["gb"]
CMD ["build"]
