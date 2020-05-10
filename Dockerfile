FROM golang:latest as builder
WORKDIR /app
RUN go get -v -u github.com/gorilla/mux
COPY ./testcar-server/ .
RUN CGO_ENABLED=0 go build main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]
