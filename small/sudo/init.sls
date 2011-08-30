sudo:
  pkg:
    - installed
/etc/sudoers:
  file:
    - managed
    - source: salt://sudo/sudoers
    - user: root
    - group: root
    - mode: 400
    - require:
      - pkg: sudo
