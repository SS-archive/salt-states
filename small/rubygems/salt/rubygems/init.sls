# Install the gems listed in pillar data.

install-gems:
  {% for rgems in pillar['gems'] %}
  module.run:
    - name: gem.install   
    - gems: {{ rgems }} 
  {% endfor %}
