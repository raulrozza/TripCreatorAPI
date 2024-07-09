FROM golang:1.22.4-alpine

WORKDIR /trip-creator

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /trip-creator/cmd/trip-creator

RUN go build -o /trip-creator/bin/trip-creator .

EXPOSE 8080
ENTRYPOINT [ "/trip-creator/bin/trip-creator" ]


