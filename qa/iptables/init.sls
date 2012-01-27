iptables:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: iptables
      - file: iptables
  file:
    - managed
    - source: salt://iptables/iptables
    {% if grains['os'] == 'CentOS' or grains['os'] == 'Fedora' %}
    - name: /etc/sysconfig/iptables
    {% elif grains['os'] == 'Arch' %}
    - name: /etc/conf.d/iptables
    {% endif %}
