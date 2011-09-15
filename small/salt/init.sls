# Ensure that the salt minion is running and on

salt:
  pkg:
    - installed

salt-minion:
  service:
    - running
    - require:
      - pkg: salt
      - file: /etc/salt/minion
  host:
    - present
    - ip: 10.10.10.1

/etc/salt/minion:
  file:
    - managed
    - source: salt://salt/minion
    - user: root
    - group: root
    - mode: 644
echo $(date) > /root/tag:
  cmd:
    - run

