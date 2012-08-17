{% if grains['os'] == 'Ubuntu' %}

php5:
  pkg:
    - installed

php5-mysql:
  pkg:
    - installed

php5-curl:
  pkg:
    - installed

php5-cli:
  pkg:
    - installed

php5-cgi:
  pkg:
    - installed

php5-dev:
  pkg:
    - installed

php-pear:
  pkg:
    - installed

apache2:
  pkg:
    - installed

pear-drush:
  cmd.run:
    - name: pear channel-discover pear.drush.org & pear install drush/drush

mariadb-server-5.5:
  cmd.run:
    - name: sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
    - unless: apt-key list | grep -q 0xcbcb082a1bb943db
  file:
    - append
    - name: /etc/apt/sources.list
    - text: deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu precise main
    - skip_verify: True
  cmd.run:
    - name: sudo apt-get update
  pkg:
    - installed

git:
  pkg:
    - installed

{% endif %}