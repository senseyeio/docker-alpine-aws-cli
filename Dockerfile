FROM alpine:3.10

LABEL maintainer="Joe Bell<joe.bell.1329@gmail.com>"

RUN apk update && \
   apk add --no-cache --virtual .build-deps bash git curl openssh make nodejs yarn groff less python py-pip && \
   pip install awscli && \
   apk --purge -v del py-pip && \
   rm /var/cache/apk/* 

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

CMD ["/bin/bash"]
