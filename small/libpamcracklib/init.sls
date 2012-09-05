libpam-cracklib-install:
  pkg.installed:
    - name: libpam-cracklib

libpam-cracklib-config:
  file:
    - managed
    - name: /etc/pam.d/common-password
    - source: salt://libpamcracklib/common-password
    - require:
      - pkg: libpam-cracklib