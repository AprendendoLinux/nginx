# Nginx for Alpine Linux

<h3>Preparando o ambiente para usar a imagem: </h3>

~~~bash
docker volume create nginx
~~~

~~~bash
docker run -d --name='nginx' \
     --hostname='nginx' \
     -p 80:80 \
     -v nginx:/var/www/html \
--restart=always aprendendolinux/nginx:latest
~~~

Use também o [docker-compose.yml](https://github.com/AprendendoLinux/nginx/blob/main/docker-compose.yml).
