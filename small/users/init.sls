{% for usr in 'moe','larry','currly' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - group: {{ usr }}
    - require:
      - group: {{ usr }}
{% endfor %}
