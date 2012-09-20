apache:
  pkg:
    {% if grains['os_family'] == 'RedHat' %}
    - name: httpd
    {% endif %}
    {% if grains['os'] == 'Ubuntu' %}
    - name: apache2
    {% endif %}
    - installed
  service:
    {% if grains['os_family'] == 'RedHat' %}
    - name: httpd
    {% endif %}
    {% if grains['os'] == 'Ubuntu' %}
    - name: apache2
    {% endif %}
    - running

php5-pkgs:
  pkg:
    {% if grains['os'] == 'Ubuntu' %}
    - names:
      - php5
      - php5-pgsql
      - php5-curl
      - php5-cli
      - php5-cgi
      - php5-dev
      - php-pear
    {% endif %}
    - installed

postgresql:
  pkg:
    {% if grains['os'] == 'Ubuntu' %}
    - names:
      - postgresql-8.3
      - postgresql-client-8.3
      - postgresql-client-8.3
      - postgresql-contrib-8.3
      - postgresql-common
    {% endif %}
    - installed
java-jdk:
  pkg:
    {% if grains['os'] == 'Ubuntu' %}
    - name: openjdk-7-jre
    {% endif %}
    {% if grains['os_family'] == 'RedHat' %}
    - name: java-1.7.0-openjdk
    {% endif %}
    - installed

opengeo-suite:
  pkg:
    {% if grains['os'] == 'Ubuntu' %}
    - name: opengeo-suite
    {% endif %}
    - installed


   