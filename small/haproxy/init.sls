haproxy:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: haproxy
  file:
    - managed
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/haproxy.cfg
