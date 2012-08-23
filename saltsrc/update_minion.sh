#!/bin/bash

cd /root/git/salt
git checkout develop
git pull
{% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' %}
python setup.py install --install-layout=deb
{% elif grains['os'] == 'CentOS' and grains['osrelease'] == '5.7'%}
python26 setup.py install
{% elif grains['os'] == 'Arch' %}
python2 setup.py install
{% else %}
python setup.py install
{% endif %}

killall salt-minion
salt-minion -d
