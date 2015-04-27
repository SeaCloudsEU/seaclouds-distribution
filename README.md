# SeaClouds

Description

## Deploy SeaClouds
A deployment of SeaClouds can be launched using Apache Brooklyn. We currently support deployments against [Bring Your Own Nodes (BYON)] and to all the IaaS provider supported by [Apache jclouds](http://jclouds.org).

# Local Deployment

## Launching with Vagrant

Make sure you have [Vagrant](https://www.vagrantup.com/) and [Apache Brooklyn](https://brooklyn.incubator.apache.org/download/index.html) installed, then:

```bash
cd $HOME
git clone git@github.com:SeaCloudsEU/seaclouds-distribution.git
cd seaclouds-distribution
./setup
```
Please make sure you have configured BROKLYN_HOME at least in the current terminal.

```bash
vagrant up
```
This spins up a virtual environment, made up of 2 VMs, that is accessible at `192.168.100.10` and `192.168.100.11`.

Start Apache Brooklyn
```bash
nohup $BROOKLYN_HOME/bin/brooklyn launch &
```
This starts up your instance of [Apache Brooklyn](http://brooklyn.io) on your workstation, accesible at http://localhost:8081. 
Please double-check in nohup.out the correct url.

Finally, copy and paste [seaclouds blueprint](seaclouds.yaml) to deploy the SeaClouds platform on the 2 VMs.

You should update the privateKeyFile property in the blueprint to the actual path. If you run setup.sh in the this directory (./setup.sh), the property will be updated for you.
