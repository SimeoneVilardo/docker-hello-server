FROM busybox:1.36
ENV PORT=8000
ADD index.html /www/index.html
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
