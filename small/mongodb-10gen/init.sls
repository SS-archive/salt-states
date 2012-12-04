mongodb-10gen:
  {% if grains['os'] == 'Ubuntu' %}
  cmd.run:
    - name: sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
    - unless: apt-key list | grep -q 7F0CEB10
    - require:
      - file: /etc/apt/sources.list.d/10gen.list
  file:
    - managed
    - name: /etc/apt/sources.list.d/10gen.list
    - source: salt://mongodb-10gen/10gen.list
    - skip_verify: True
  {% elif grains['os'] == 'RedHat' %}
  file:
    - managed
    - name: /etc/yum.repos.d/10gen.repo
    - source: salt://mongodb-10gen/10gen.repo
    - skip_verify: True
  {% endif %}
  pkg:
    - installed
    - refresh: True