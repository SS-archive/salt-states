/srv/salt:
  file:
    - directory
    - user: bin
    - group: wheel
    - mode: 777
    - makedirs: True
