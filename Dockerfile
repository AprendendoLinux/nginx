FROM alpine
RUN apk update && apk upgrade && apk add \
	\
	nginx && \
	\
	rm /var/cache/apk/* && \
	\
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
	rm -r /var/www/localhost && mkdir /var/www/html

COPY default.conf /etc/nginx/http.d/
WORKDIR /root
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
