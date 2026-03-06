# ---------- Builder Stage ----------
FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .


# ---------- Runtime Stage ----------
FROM alpine:latest

RUN apk add --no-cache ca-certificates

WORKDIR /root/

# Copy binary
COPY --from=builder /app/app .
COPY --from=builder /app/static ./static
COPY --from=builder /app/k8s ./k8s

EXPOSE 9000

CMD ["./app"]