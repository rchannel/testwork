base:
  'node_type:swarmmanager':
    - match: grain
    - docker
    - docker.manager.first

  'node_type:swarmworker':
    - match: grain
    - docker
    - docker.worker.join
