{% for usr in 'moe','larry','currly' %}
{{ usr }}:
  user:
    - present
{% endfor %}

{% for grp in 'foo','bar','baz' %}
{{ grp }}:
  group:
    - present
{% endfor %}

jdoe:
  user.present:
    - fullname: John Doe
    - shell: /bin/bash
    - home: /home/jdoe
    - uid: 1001
    - gid: 1001
    - groups:
      - wheel
      - storage
      - games
