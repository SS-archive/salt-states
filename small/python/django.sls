include:
  - python
  - apache

extend:
  apache:
    service:
      - watch:
        - pkg: django


django:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: Django
    {% endif %}
    - installed
    - require:
      - pkg: python2
