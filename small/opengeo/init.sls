# This hasn't been tested yet with RedHat or CentOS

opengeo-suite-:
  {% if grains['os'] == 'Ubuntu' %}
  cmd.run:
    - name: wget -qO- http://apt.opengeo.org/gpg.key | apt-key add -
  file:
    - append
    - name: /etc/apt/sources.list
    - text: deb http://apt.opengeo.org/ubuntu lucid main
    - skip_verify: True
  {% endif %}
  {% if grains['os_family'] == 'RedHat' %}
  cmd.run:
    - name: wget http://yum.opengeo.org/centos/6/x86_64/OpenGeo.repo
  file:
    - managed
    - name: /etc/yum.repos.d/OpenGeo.repo
    - source: http://http://yum.opengeo.org/centos/6/x86_64/OpenGeo.repo
    - source_hash: 64d30046330f45852de542c59385571c
  {% endif %}
  pkg:
    - name: opengeo-suite
    - installed
    - refresh: True




   
