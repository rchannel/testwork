#shamelessly lifted directly from saltstack
drain manager:
  cmd.run:
    - name: 'docker node update --availability drain {{ grains['id'] }}'
