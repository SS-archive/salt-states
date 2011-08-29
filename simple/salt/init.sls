# Ensure that the 

salt:
  pkg:
    - installed

salt-minion:
  service:
    - running
    - require:
      - pkg: salt

/etc/salt/minion:
  file:
    - managed
    - source: salt://salt/minion
    - user: root
    - group: root
    - mode: 644

