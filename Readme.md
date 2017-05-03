How to Ibotta

Assuming AWS
Spin up ec2 instance

#salt master install
curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -M -N git develop(installs master)
sudo sh bootstrap-salt.sh git develop(installs minion)
Update /etc/salt/minion file with master=localhost
Update /etc/salt/master with:
Add the file root section to match
  file_roots:
    base:
      - /var/ruby/rubywww/salt
    dev:
      - /var/ruby/rubywww/salt/dev
    prod:
      - /var/ruby/rubywww/salt/prod

git clone https://github.com/rchannel/testwork.git /var/ruby/rubywww
Restart salt-master and minion

#salt minion install
curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh git develop
replace /etc/salt/minion files master ip to match ip of salt-master

Accept salt-keys on master (salt-key -A)

set node_type on manager and workers:
  SaltMaster/Swarmmanager:
    Run salt-call grains.setval node_type swarmmanager
    salt-call grains.setval rack dev (for worker for this example)
  Target server/swarmworker:
    salt-call grains.setval node_type swarmworker
    salt-call grains.setval rack dev



Run state.highstate on master first then grab the swarm info below.

#Docker swarm setup for only two machines:
Manager:
     set swarm token and address in docker.worker.join.sls
        (example:--token SWMTKN-1-24xslyjqp09pa2hccc4qpddh5lddkbdh4o6314dyzxkj58jizs-5absesg4xq9w1dan9kx7e0os2 \
         172.31.45.98:2377)
Then state.highstate workers

#Setup a swarm
  docker service create --name ibottalot --publish 4567:4567 --with-registry-auth rchannel/www
Show active services:
  docker service ps ibottalot  
Remove a swarm
  docker service rm ibottalot

#Build docker image
salt-call state.apply docker.buildit
  This would be automated with git hooks or jenkins.
  
#Real environment would have automation from a git server with pull/push hooks.
#Build a salt module for swarm creation management.
