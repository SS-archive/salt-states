# file.recurse
/saltsrc:
  file:
    - recurse
    - source: salt://saltsrc/salt

addon:
  file:
    - recurse
    - source: salt://saltsrc/addon
    - name: /saltsrc

/root/update_minion.sh:
  file:
    - managed
    - mode: 755
    - template: jinja
    - source: salt://saltsrc/update_minion.sh

/root/salt-0.9.5:
  file:
    - managed
    - source: http://pypi.python.org/packages/source/s/salt/salt-0.9.5.tar.gz
    - source_hash: salt://saltsrc/salt-hash

/root/salt-0.9.5.line_hash:
  file:
    - managed
    - source: http://pypi.python.org/packages/source/s/salt/salt-0.9.5.tar.gz
    - source_hash: md5=e138491e9d5b97023cea823fe17bac22

/root/py_render:
  file:
    - managed
    - source: salt://saltsrc/py_render.py
    - template: py
