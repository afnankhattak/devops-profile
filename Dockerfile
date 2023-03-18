FROM --platform=linux/amd64 nginx:alpine
COPY . /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN chown -R nginx:nginx *


# FROM golang:1.17.0 as build

# WORKDIR /app
# RUN go env -w GO111MODULE=auto 
# RUN go get github.com/thedevsaddam/renderer/...
# COPY main.go .
# RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build main.go


# FROM alpine

# LABEL name="Golang Application" \    
  #     maintainer="Afnan <hmafnan3@gmail.com>" \
    #   summary="A Golang Sample application"  
# WORKDIR /app
# EXPOSE 8080 
# COPY --from=build ./app/main ./
# COPY ./src ./src
# CMD ["./main"]