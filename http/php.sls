include:
  - http

php:
  pkg:
    - installed
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' or grains['os'] == 'Gentoo' %}
    - name: php5
    {% endif %}
    - require_in:
      - service: httpd

