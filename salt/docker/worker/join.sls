include:
  - docker

join cluster:
  cmd.run:
    {% if grains['rack'] == 'dev' %}
    - name: 'docker swarm join --token SWMTKN-1-24xslyjqp09pa2hccc4qpddh5lddkbdh4o6314dyzxkj58jizs-5absesg4xq9w1dan9kx7e0os2  172.31.45.98:2377'
    {% elif grains['rack'] == 'prod' %}
    - name: 'docker swarm join --token SWMTKN-1-24xslyjqp09pa2hccc4qpddh5lddkbdh4o6314dyzxkj58jizs-5absesg4xq9w1dan9kx7e0os2 172.31.45.98:2378'    
    {% endif %}
    - require:
      - pkg: docker
