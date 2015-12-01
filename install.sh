#!/bin/bash

########################################
# install n98-magerun modules globally #
########################################
function installMagerunModules() {
    mkdir -p /usr/local/share/n98-magerun/modules/
    git clone https://github.com/kalenjordan/magerun-addons                 /usr/local/share/n98-magerun/modules/kalenjordan-magerun-addons
    git clone https://github.com/cmuench/cmuench-magerun-addons             /usr/local/share/n98-magerun/modules/cmuench-magerun-addons
    git clone https://github.com/cmuench/magerun-module-cache-benchmark     /usr/local/share/n98-magerun/modules/magerun-module-cache-benchmark
    git clone https://github.com/Zookal/HarrisStreet-ImpEx                  /usr/local/share/n98-magerun/modules/zookal-harrisstreet-impex
    git clone https://github.com/creatuity/magerun-creatuity                /usr/local/share/n98-magerun/modules/magerun-creatuity
    git clone https://github.com/LimeSoda/LimeSoda_EnvironmentConfiguration /usr/local/share/n98-magerun/modules/limesoda-environmentconfiguration
    git clone https://github.com/peterjaap/magerun-addons                   /usr/local/share/n98-magerun/modules/magerun-addons
    git clone https://github.com/degdigital/magerun-commands                /usr/local/share/n98-magerun/modules/magerun-commands
    git clone https://github.com/aoepeople/mpmd                             /usr/local/share/n98-magerun/modules/aoepeople-mpmd
    git clone https://github.com/yireo/magerun-addons                       /usr/local/share/n98-magerun/modules/yireo-magerun-addons
    git clone https://github.com/aleron75/Webgriffe_Golive                  /usr/local/share/n98-magerun/modules/aleron75-webgriffe-golive
    git clone https://github.com/meanbee/download-remote-media              /usr/local/share/n98-magerun/modules/meanbee-download-remote-media
    git clone https://github.com/daim2k5/magerun-addons                     /usr/local/share/n98-magerun/modules/daim2k5-magerun-addons
    git clone https://github.com/magento-hackathon/EAVCleaner               /usr/local/share/n98-magerun/modules/magento-hackathon-eavcleaner
    git clone https://github.com/steverobbins/magescan                      /usr/local/share/n98-magerun/modules/steverobbins-magescan
    git clone https://github.com/steverobbins/Magerun-DBClean               /usr/local/share/n98-magerun/modules/steverobbins-magerun-dbclean
    git clone https://github.com/fruitcakestudio/magerun-modman             /usr/local/share/n98-magerun/modules/fruitcakestudio-magerun-modman
    git clone https://github.com/jhoelzl/magerun-addons                     /usr/local/share/n98-magerun/modules/jhoelzl-magerun-addons
    git clone https://github.com/philwinkle/unhack-core                     /usr/local/share/n98-magerun/modules/philwinkle-unhack-core
    git clone https://github.com/mothership-gmbh/magerun_mothership         /usr/local/share/n98-magerun/modules/mothership-gmbh-magerun-mothership
    git clone https://github.com/KamilBalwierz/sxmlsv                       /usr/local/share/n98-magerun/modules/kamilbalwierz-sxmlsv
    git clone https://github.com/marcoandreini/magerun-dataprofile          /usr/local/share/n98-magerun/modules/marcoandreini-magerun-dataprofile
    git clone https://github.com/steverobbins/magedownload-cli              /usr/local/share/n98-magerun/modules/steverobbins-magedownload-cli
    cd /usr/local/share/n98-magerun/modules/steverobbins-magedownload-cli
    composer install
}

echo "preparing the n98-magerun configuration"
substitute-env-vars.sh /etc /etc/n98-magerun.yaml.tmpl

echo "preparing the magedownload-cli configuration"
substitute-env-vars.sh /etc /etc/magedownload-cli.yaml

composer global install

echo "installing n98-magerun modules"
installMagerunModules

exit 0