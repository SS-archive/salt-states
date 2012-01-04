/bin/cheeseandbiscuits:
  file:
    - symlink
    - target: /bin/sh

/etc/testfile:
  file:
    - managed
    - source: salt://files/testfile
    - user: root
    - group: bin
    - mode: 723
    - template: jinja

/cheese/spam/bacon:
  file:
    - directory
    - user: root
    - group: bin
    - makedirs: True

sedfile:
  file:
    - sed
    - name: /etc/testfile
    - before: cheese
    - after: spam
    - order: last


