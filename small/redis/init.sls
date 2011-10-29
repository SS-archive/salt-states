redis:
  service:
    - running
    - require:
      - pkg: redis
  pkg:
    - installed
