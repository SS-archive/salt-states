# file.recurse
/saltsrc:
  file:
    - recurse
    - source: salt://saltsrc/salt

/root/update_minion.sh:
  file:
    - managed
    - mode: 755
    - template: jinja
    - source: salt://saltsrc/update_minion.sh
