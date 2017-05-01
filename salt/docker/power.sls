docker:
  pkgrepo.managed:
    - humanname: ibottaswarm
    - baseurl: http://ibottaswarm.repo/dockerrepo
    - gpgkey: ['gpgkey'] 
  service.running:
    - enable: True
    - require:
      - pkg: docker-engine
