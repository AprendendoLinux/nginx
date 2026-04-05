FROM alpine

RUN apk update && apk upgrade && apk add \
	\
	nginx \
	nginx-mod-http-fancyindex && \
	\
	rm /var/cache/apk/* && \
	\
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
	rm -r /var/www/localhost && mkdir -p /usr/share/nginx/theme

# Agora copiamos o tema para um diretório seguro, imune ao mapeamento de volume
COPY theme/ /usr/share/nginx/theme/

COPY default.conf /etc/nginx/http.d/
WORKDIR /root
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]