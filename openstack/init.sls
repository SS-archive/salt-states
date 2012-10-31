include:
    - epel
    - selinux

permissive:
    selinux.mode:
        - require:
            - pkg: libsemanage
            - pkg: setools-console

openstack-pkgs:
    pkg.installed:
        - names:
            - openstack-nova
            - openstack-glance
            - openstack-keystone
            - openstack-quantum
            - openstack-swift
            - openstack-swift-account
            - openstack-swift-container
            - openstack-swift-object
            - openstack-swift-plugin-swift3
            - openstack-swift-proxy
            - openstack-dashboard
            - openstack-utils
            - memcached
            - qpid-cpp-server
            - mysql-server
            - avahi
            - avahi-libs
            # if RHEL 6.3
            - dnsmasq-utils
            # elif <= RHEL 6.2:
            # cmd.run: penstack-config --set /etc/nova/nova.conf DEFAULT force_dhcp_release False

nova-support:
    service:
        - running
        - enable: True
        - names:
            - qpidd
            - libvirtd
            - messagebus

nova-db-init:
    cmd:
        - run
        - name: openstack-db --init --service nova
        - unless: echo '' | mysql nova
        - require:
            - pkg.installed: openstack-nova

glance-db-init:
    cmd:
        - run
        - name: openstack-db --init --service nova
        - unless: echo '' | mysql glance
        - require:
            - pkg.installed: openstack-glance

glance-services:
    service:
        - running
        - enable: True
        - names:
            - openstack-glance-api
            - openstack-glance-registry
        - require:
            - cmd.run: glance-db-init

nova-services:
    service:
        - running
        - enable: True
        - names:
            - openstack-nova-api
            - openstack-nova-objectstore
            - openstack-nova-compute
            - openstack-nova-network
            - openstack-nova-volume
            - openstack-nova-scheduler
            - openstack-nova-cert
        - require:
            - cmd.run: nova-db-init
            - cmd.run: keystone-db-init
            - service.running: openstack-glance-api

glance-services:
    service:
        - running
        - enable: True
        - names:
            - openstack-glance-api
            - openstack-glance-registry
        - require:
            - pkg.installed: openstack-glance

keystone-db-init:
    cmd:
        - run
        - name: openstack-db --init --service keystone
        - unless: echo '' | mysql keystone
        - require:
            - pkg.installed: openstack-keystone

openstack-keystone:
    service:
        - running
        - enable: True
        - require:
            - pkg.installed: openstack-keystone
        - watch:
            - cmd.run: keystone-db-init

/etc/nova:
    file:
        - recurse
        - source: salt://openstack/nova
        - require:
            - pkg.installed: openstack-nova
        - watch_in:
            - service: nova-services

/etc/keystone:
    file:
        - recurse
        - source: salt://openstack/keystone
        - require:
            - pkg.installed: openstack-keystone
        - watch_in:
            - service: openstack-keystone

/etc/glance:
    file:
        - recurse
        - source: salt://openstack/glance
        - require:
            - pkg.installed: openstack-glance
        - watch_in:
            - service: glance-services

httpd:
    service:
        - running
        - enable: True
        - require:
            - pkg.installed: openstack-dashboard
