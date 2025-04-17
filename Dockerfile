<<<<<<< HEAD
FROM golang:1.23 as base
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o main .
FROM gcr.io/distroless/base
COPY --from=base /app/main .
EXPOSE 8080
CMD ["./main"]
=======
FROM golang:1.22 AS base

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o srihari .

RUN mkdir -p /app/static
#  Final stage - Distroless image
FROM gcr.io/distroless/base

COPY --from=base /app/srihari .

COPY --from=base /app/static ./static

EXPOSE 8080

CMD [ "./srihari" ]
>>>>>>> 5f32b411822bfa7741cd36b4252b1e38bee89954
