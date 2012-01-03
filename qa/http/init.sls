# pkg.latest
# service.running
httpd:
  pkg:
    - installed
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu'%}
    - name: apache2
    {% endif %}
  service:
    - running
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu'%}
    - name: apache2
    {% endif %}
    - require:
      - pkg: httpd

