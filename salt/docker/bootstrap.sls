{% if grains['node_type'] == 'swarmmanager' %}

{% if loop.first %}
{% set manager_sls = 'docker.manager.first' %}
{% else %}
{% set manager_sls = 'docker.manager.join' %}
{% endif %}

bootstrap swarm manager {{ manager }}:
  salt.state:
    - sls: {{ manager_sls }}
    - tgt: {{ manager }}

update mine for {{ manager }}:
  salt.function:
    - name: mine.update
    - tgt: '*'
    - require:
      - salt: bootstrap swarm manager {{ manager }}

{% endfor %}

{% if grains['node_type'] == 'swarmworker' %}

bootstrap swarm worker {{ worker }}:
  salt.state:
    - sls: docker.worker.join
    - tgt: {{ worker }}

{% endfor %}
