<a href="http://www.ffuenf.de" title="ffuenf - code • design • e-commerce"><img src="https://github.com/ffuenf/Ffuenf_Common/blob/master/skin/adminhtml/default/default/ffuenf/ffuenf.png" alt="ffuenf - code • design • e-commerce" /></a>

docker-magetools
================
[![GitHub tag](http://img.shields.io/github/tag/ffuenf/docker-magetools.svg)][tag]
[![Build Status](https://img.shields.io/travis/ffuenf/docker-magetools.svg)][travis]
[![Docker Pulls](https://img.shields.io/docker/pulls/ffuenf/magetools.svg)][pulls]
[![Docker Stars](https://img.shields.io/docker/stars/ffuenf/magetools.svg)][stars]
[![Docker Layers](https://badge.imagelayers.io/ffuenf/magetools.svg)][layers]
[![PayPal Donate](https://img.shields.io/badge/paypal-donate-blue.svg)][paypal_donate]
[tag]: https://github.com/ffuenf/docker-magetools/tags
[travis]: https://travis-ci.org/ffuenf/docker-magetools
[pulls]: https://hub.docker.com/r/ffuenf/magetools/
[stars]: https://hub.docker.com/r/ffuenf/magetools/
[layers]: https://imagelayers.io/?images=ffuenf/magetools:latest
[paypal_donate]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=J2PQS2WLT2Y8W&item_name=docker-magetools%3a%20docker-magetools&item_number=docker-magetools&currency_code=EUR

This provides a copy of 

* [composer](https://getcomposer.org)
* [magerun](https://github.com/netz98/n98-magerun)
* [modman](https://github.com/colinmollenhour/modman)
* [magedownload-cli](https://github.com/steverobbins/magedownload-cli)
* [magedbm](https://github.com/meanbee/magedbm)
* [mageconfigsync](https://github.com/punkstar/mageconfigsync)

to be used in a docker environment.

Usage
-----
Required environment variables for commands in this container include:

* MAGE_ROOT_DIR (magerun, magedbm and mageconfigsync)
* AWS_ACCESS_KEY_ID (magedbm)
* AWS_SECRET_ACCESS_KEY (magedbm)
* AWS_REGION (magedbm)
* AWS_BUCKET (magedbm)
* MAGEDOWNLOAD_ID (magedownload-cli)
* MAGEDOWNLOAD_TOKEN (magedownload-cli)

The container also requires access to your Magento files, and access to the MySQL container.

Docker Compose
--------------
Assuming you have a data container called `data` which contains your files that you mount to `/var/www/html`, and your MySQL container is called `db` then your `docker-compose.yml` might look something like this:

    magetools:
      image: ffuenf/magetools
      environment:
        MAGE_ROOT_DIR: /var/www/html
        MAGEDOWNLOAD_ID: [YOUR-ID]
        MAGEDOWNLOAD_TOKEN: [YOUR-TOKEN]
      links:
          - db
      volumes_from:
        - data

This image can then be used to easily perform any command, for example:

    docker-compose run ffuenf/magetools magerun sys:info
    docker-compose run ffuenf/magetools magedownload-cli file magento-ce-1.9.2.2 /path/to/destination

Development
-----------
1. Fork the repository from GitHub.
2. Clone your fork to your local machine:

        $ git clone git@github.com:USER/docker-magetools.git

3. Create a git branch

        $ git checkout -b my_bug_fix

5. Make your changes/patches/fixes, committing appropriately
7. Push your changes to GitHub
8. Open a Pull Request

License and Author
------------------

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
- Author:: Nick Jones / Meanbee (<nick@nicksays.co.uk>)

The MIT License (MIT)

Copyright (c) 2015 ffuenf

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
