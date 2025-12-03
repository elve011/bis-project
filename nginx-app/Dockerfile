FROM nginx:alpine

# Supprimer la configuration par défaut
RUN rm /etc/nginx/conf.d/default.conf

# Copier la configuration Nginx personnalisée
COPY default.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers HTML
COPY html/ /usr/share/nginx/html/

EXPOSE 80 443
