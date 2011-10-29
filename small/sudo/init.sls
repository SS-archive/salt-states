sudo:
  pkg:
    - installed
/etc/sudoers:
  file:
    - managed
    - source: salt://sudo/sudoers
    - user: root
    {% if grains['os'] == 'FreeBSD'%}
    - group: wheel
    {% else %}
    - group: root
    {% endif %}
    - mode: 400
    - require:
      - pkg: sudo
