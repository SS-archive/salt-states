# Install the gems listed in pillar data.

install-gems:
  {% for gems in pillar['rgems'] %}
  module.run:
    - name: gem.install   
    - gems: {{ gems }} 
  {% endfor %}
