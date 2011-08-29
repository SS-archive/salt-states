# Turn on a salt master
include:
  - salt

salt-master:
  service:
    - running
    - require:
      - pkg: salt
      - file: /etc/salt/master

/etc/salt/master:
  file:
    - managed
    - source: salt://salt/master
    - require:
      - pkg: salt
