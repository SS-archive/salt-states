include:
  - salt.master

salt-syndic:
  service:
    - running
    - require:
      - service: salt-master
    - watch:
      - pkg: salt
      - file: /etc/salt/master
    
