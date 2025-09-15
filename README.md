# cp4idemoace

This repository is to be used for creating an ACE Integration Server on OCP, version 4.x, with IBM's Cloudpak for Integration Installed.

The artifacts include an Integration Runtime Custom resource definition for deployment and configuration objects which allow the server to connect to the Hybrid iPaaS
Control Plane.

The Bar file contains an ACE fow to expose a callable input which writes a message to  queue manger to simulate integration with a backend. This
keeps the scenario simple but allows OTEL trace from the MQ output node to take part in an end to end transaction monitoring scenario.

The following artefacts are provided.

Configurations:
key.* - Provides the keystore for the integration runtime for secure connections to a MQ queue manager - the Queue manager repo highlighted below will work with this keystore for secure connections.
MQPolicy.zip - an policy overide file to allow modification of the MQ endpoint wtihout changes to the source flow. You will need to modify this to point to the queue manager host as a minimum when you use the Queue manger repo below
agenta.json - an agent config file for connection to the HiPaaS for remote admin and advertising of the callable flow. This will change based on your own switch location in the iPaaS tenant.
mqsivaultarchive - the vault which contains the configuration for the api key to connect to the monitoring endpoint. You will need to modify this based on your tenant api key. 
server.conf.yaml - contains the 
  - configuration yaml for the keystore location which uses the default location in the container. 
  - environment variables for the iPaaS tenant - You will need to set these to your own tenant value.
  - OpenTelemetry manager settings for the integration runtime - You will need to determine the appropiate settings for the tenant.
dbparms - not used in this demo
vaultarchivekey  - password for the included vault described above - The vault configuration will determine this. See https://www.ibm.com/docs/en/app-connect/13.0.x?topic=runtimes-vault-archive-type

Note that the repo here: https://github.com/peterajessup/mq-deploy-cp4i/ is used to depoly the queue manager for the ACE runtime. You can use this as-is or use the configuration to create your own.

Installation: (Assumes a working CP4i installation on Openshift with the ACE operator installed. The demo uses the ACE dashboard for Bar file storage.
1. Create the project 'ace'
2. Create a Dashboard instance to store the bar file (not covered here). 
see here: https://www.ibm.com/docs/en/app-connect/13.0.x?topic=dashboard-managing-bar-files
3. Upload the bar file and note the barUrl name. Note that you need to update the following in the yaml/aceIVTdeploy.yaml _barURL: ["https://<ace_dashboard_name>:3443/v1/directories/xxxx]_
4. Clone the repo.
5. run the installtion scipt scripts/deploy.sh
6. Add the runtime to your tenant (optional)
7. You should see a callable flow called 'MK1' available to be used in ACE and Webmethods runtimes.
8. Sending any message to this callable flow will result in a message in the queue called 'IVT.Q' on the configured queue manager.
9. Full tracing down to the MQ Output Node on the callable flow should be seen.



```


