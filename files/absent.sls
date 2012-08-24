/etc/testfile:
  file:
    - absent
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


