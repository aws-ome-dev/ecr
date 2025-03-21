FROM golang:1.23

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
RUN ls
COPY ./*.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /main

CMD ["/main"]
