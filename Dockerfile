FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main .
FROM busybox:1.36
ENV PORT=8000
WORKDIR /app/
COPY --from=builder /app/main .
CMD ["./main"]
