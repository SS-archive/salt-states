# Turn on a salt master
include:
  - salt

salt-master:
  service:
    - running
    - watch:
      - pkg: salt
      - file: /etc/salt/master

/etc/salt/master:
  file:
    - managed
    - source: salt://salt/master
    - require:
      - pkg: salt
