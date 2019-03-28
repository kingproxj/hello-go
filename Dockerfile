# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/knative/docs/helloworld

# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN go install github.com/knative/docs/helloworld
RUN echo "34.193.147.40 registry-1.docker.io" >> /etc/hosts

# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/helloworld

# Document that the service listens on port 8080.
EXPOSE 8080
