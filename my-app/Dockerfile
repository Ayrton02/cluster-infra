FROM golang:1.17-alpine AS build
WORKDIR /my-app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /my-app/main ./
CMD ["./main"] 