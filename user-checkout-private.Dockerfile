FROM alpine:3.18.4

RUN apk add --no-cache git openssh-client

RUN adduser --system --uid 100 appuser
USER appuser
WORKDIR /home/appuser

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh,uid=100 git clone git@github.com:jackblackevo/circleci-docker-private.git

ENTRYPOINT [ "ls", "-al" ]
