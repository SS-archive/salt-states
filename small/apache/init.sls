apache:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% endif %}
    - installed
  service:
    - name: httpd
    - running
