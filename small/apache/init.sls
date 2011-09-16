apache:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: http
    {% endif %}
    - installed
