include:
  - python

django:
  pkg:
    {% if grains['os'] == RedHat %}
    - name: Django
    {% endif %}
    - installed
  require:
    - pkg: python2
