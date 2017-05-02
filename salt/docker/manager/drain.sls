#shamelessly lifted directly from saltstack not need unless multiple nodes
#drain manager:
#  cmd.run:
#    - name: 'docker node update --availability drain {{ grains['id'] }}'
