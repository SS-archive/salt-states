{% for usr in 'moe','larry','currly' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - gid: {{ salt['file.group_to_gid'](usr) }}
    - require:
      - group: {{ usr }}
{% endfor %}
