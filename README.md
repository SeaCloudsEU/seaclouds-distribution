# SeaClouds

Description

## Deploy SeaClouds
A deployment of SeaClouds can be launched using Apache Brooklyn. We currently support deployments against [Bring Your Own Nodes (BYON)] and to all the IaaS provider supported by [Apache jclouds](http://jclouds.org).

# Local Deployment

## Launching with Vagrant

Make sure you have [Vagrant](https://www.vagrantup.com/), [Virtual Box](https://www.virtualbox.org/)

```bash
cd $HOME
git clone git@github.com:SeaCloudsEU/seaclouds-distribution.git
cd seaclouds-distribution
vagrant up
```
This spins up a virtual environment, made up of 2 VMs, that is accessible at `192.168.100.10` and `192.168.100.11`.

## Download and install Brooklyn MODAClouds distribution

```bash
cd $HOME
wget -q -O brooklyn-modaclouds-dist.tar.gz "http://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=eu.seaclouds-project&a=brooklyn-modaclouds&v=LATEST&c=dist&p=tar.gz" --content-disposition
tar xzf brooklyn-modaclouds-dist.tar.gz
cd brooklyn-modaclouds
./start.sh launch
```

This starts up your instance of [Apache Brooklyn](http://brooklyn.io) on your workstation, accesible at http://localhost:8081.
Please double-check in nohup.out the correct url.

Finally, copy and paste [seaclouds blueprint](seaclouds-on-byon.yaml) to deploy the SeaClouds platform on the 2 VMs.

You may need to update the `privateKeyFile` property in the blueprint to the actual path.
By default, it points to `~/seaclouds-distribution/seaclouds_id_rsa`  but YMMV.

For more information, please visit [Apache Brooklyn](https://brooklyn.incubator.apache.org/download/index.html)