FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html

COPY ./static-html/data/ /usr/share/nginx/html/
COPY ./static-html/markdown/images/ /usr/share/nginx/html/images/
