# pkg.latest
# service.running
httpd:
  pkg:
    - absent
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu'%}
    - name: apache2
    {% elif grains['os'] == 'Gentoo' or grains['os'] == 'Arch' or grains['os'] == 'FreeBSD' %}
    - name: apache
    {% endif %}
  service:
    - dead
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' or grains['os'] == 'Gentoo' %}
    - name: apache2
    {% endif %}
    - require:
      - pkg: httpd

