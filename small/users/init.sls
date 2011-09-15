{% for usr in 'moe','larry','currly' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - require:
      - group: {{ usr }}
{% endfor %}
