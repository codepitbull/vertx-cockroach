# Fun with distirbuted systems
This project started out as a little test for Vert.x + PostgreSQL-Driver + CockroachDB, turnes out I actually wanted to 
blow up some distributed systems and that's what you will find in here: Some hastily thrown together code/skripts to
simulate serious trouble.

# WIP
This project is still WIP, due to a heavy flu and pesky work getting in the way of fun.
If you want something well crafted go to [Jepsen](https://github.com/jepsen-io/jepsen).

If you want to follow my aspirations to get better in destroying, then lean back, grab some popcorn and follow the commit 
history. 

# Setup
To get started you will need [Vagrant](https://www.vagrantup.com/) and [Ansible](https://www.ansible.com/) on your machine.
Run `/bootstrap` inside the *vagrant* directory in this project. This will take  a while as it downloads 
[CockroachDB](https://www.cockroachlabs.com/) and spawns a three node cluster.

After everything is set up you can go to [http://192.168.6.7:8080/#/](http://192.168.6.7:8080/#/) to see the Cockroach 
admin console.  