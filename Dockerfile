FROM alpine
RUN apk --no-cache add dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY startup.sh /startup.sh

RUN ["chmod", "+x", "/startup.sh"]

CMD ["/startup.sh"]
