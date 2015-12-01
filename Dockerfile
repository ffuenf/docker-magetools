FROM php:5.6-cli

MAINTAINER Achim Rosenhagen <a.rosenhagen@ffuenf.de>

RUN apt-get update -qy \
    && apt-get install -qy mysql-client git

RUN curl -SL https://getcomposer.org/composer.phar -o /composer & \
    curl -SL https://s3-eu-west-1.amazonaws.com/magedbm-releases/magedbm.phar -o /magedbm & \
    curl -SL http://files.magerun.net/n98-magerun-latest.phar -o /magerun & \
    curl -SL https://raw.githubusercontent.com/punkstar/mageconfigsync/master/mageconfigsync -o /mageconfigsync & \
    curl -SL https://raw.githubusercontent.com/colinmollenhour/modman/master/modman -o /modman & \
    curl -SL http://magedownload.steverobbins.com/download/latest/magedownload.phar -o magedownload-cli & \
    wait

RUN chmod +x /composer
RUN chmod +x /magedbm
RUN chmod +x /magerun
RUN chmod +x /mageconfigsync
RUN chmod +x /modman
RUN chmod +x /magedownload-cli

# Copy wrappers commands
COPY composer /usr/local/bin/
COPY composer.json /root/.composer/composer.json
COPY magerun /usr/local/bin/
COPY magedbm /usr/local/bin/
COPY mageconfigsync /usr/local/bin/
COPY modman /usr/local/bin/
COPY magedownload-cli /usr/local/bin/

RUN chmod +x /usr/local/bin/composer
RUN chmod +x /usr/local/bin/magerun
RUN chmod +x /usr/local/bin/magedbm
RUN chmod +x /usr/local/bin/mageconfigsync
RUN chmod +x /usr/local/bin/modman
RUN chmod +x /usr/local/bin/magedownload-cli

# Add a custom magerun configuration
COPY n98-magerun.yaml.tmpl /etc/n98-magerun.yaml.tmpl

# Add a custom magedownload-cli configuration
COPY magedownload-cli.yaml.tmpl /etc/magedownload-cli.yaml.tmpl

# Add transformation/utility script
COPY substitute-env-vars.sh /bin/substitute-env-vars.sh
RUN chmod +x /bin/substitute-env-vars.sh

# Add the Installer
COPY install.sh /bin/install.sh
RUN chmod +x /bin/install.sh
RUN /bin/install.sh
