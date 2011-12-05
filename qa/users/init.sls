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
