ldap:
  pkg:
    - installed
    - names:
      - openldap-servers
      - openldap-clients
  file:
    - managed
    {% if grains['os'] == 'RedHat' or grains['os'] == 'CentOS' %}
    - name: /etc/openldap/ldap.conf
    {% elif grains['os'] == 'Ubuntu' %}
    - name: /etc/ldap/ldap.conf
    {% elif grains['os'] == 'Debian' %}
    - name: /etc/ldap/ldap.conf
    {% endif %}
    - source: salt://ldap/ldap.conf
    - template: jinja
    - user: root
    - context: {
      ldap_uri: "ldaps://ldap01.domain.com/ ldaps://p-chi-ldap02.domain.com/",
      ldap_base: "dc=domain,dc=com" }
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: openldap-servers
      - pkg: openldap-clients

