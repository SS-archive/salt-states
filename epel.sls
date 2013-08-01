epel:
    cmd:
        - run
        {% if grains['osrelease'].startswith('5') %}
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
        {% elif grains['osrelease'].startswith('6') %}
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
        {% endif %}
        - unless: test -e /etc/yum.repos.d/epel.repo

