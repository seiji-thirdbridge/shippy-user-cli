# shippy-user-cli/Dockerfile
FROM golang:1.9.4 as builder

WORKDIR /go/src/github.com/seiji-thirdbridge/shippy-user-cli

COPY . .

RUN go get
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM alpine:latest

RUN mkdir -p /app
WORKDIR /app

COPY --from=builder /go/src/github.com/seiji-thirdbridge/shippy-user-cli/shippy-user-cli .

ENTRYPOINT ["./shippy-user-cli"]

CMD ["./shippy-user-cli"]
