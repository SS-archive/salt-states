python2:
  pkg:
{% if os != 'Arch' %}
    - name: python
{% endif %}
    - installed
python3:
  pkg:
{% if os == 'Arch' %}
    - name: python
{% endif %}
    - installed
