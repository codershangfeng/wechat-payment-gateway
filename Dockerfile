FROM golang:1.16 as builder

WORKDIR /workspace/

COPY . .
RUN make install-swagger
RUN go mod tidy
RUN go mod verify
RUN make build


FROM scratch

LABEL Name="wechat-payment-gateway"

WORKDIR /root

COPY --from=builder /workspace/bin/wechat-payment-gateway .

ENTRYPOINT [ "./wechat-payment-gateway" ]
