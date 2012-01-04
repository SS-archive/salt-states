{% for usr in 'moe','larry','currly' %}
{{ usr }}:
  user:
    - absent
{% endfor %}

{% for grp in 'foo','bar','baz' %}
{{ grp }}:
  group:
    - absent
{% endfor %}
