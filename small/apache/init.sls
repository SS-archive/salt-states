apache:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% else if grains['os'] == 'Ubuntu' %}
    - name: apache2
    {% endif %}
    - installed
  service:
    - name: httpd
    - running
