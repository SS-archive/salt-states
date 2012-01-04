/bin/cheeseandbiscuits:
  file:
    - absent
    - target: /bin/sh

/etc/testfile:
  file:
    - absent
    - source: salt://files/testfile
    - user: root
    - group: bin
    - mode: 723
    - template: jinja

/cheese/spam/bacon:
  file:
    - absent
    - user: root
    - group: bin
    - makedirs: True

sedfile:
  file:
    - sed
    - name: /etc/testfile
    - before: spam
    - after: cheese
    - order: last


