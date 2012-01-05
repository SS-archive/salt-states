# pkg.latest
# service.running
httpd:
  pkg:
    - installed
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu'%}
    - name: apache2
    {% elif grains['os'] == 'Gentoo' or grains['os'] == 'Arch' or grains['os'] == 'FreeBSD' %}
    - name: apache
    {% endif %}
  service:
    - running
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' or grains['os'] == 'Gentoo' %}
    - name: apache2
    {% endif %}
    - require:
      - pkg: httpd

date > /tmp/started_apache:
  cmd:
    - wait
    - watch:
      - service: httpd
