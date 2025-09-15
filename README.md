# cp4idemoace

This repository is to be used for creating an ACE Integration Server on OCP, version 4.x, with IBM's Cloudpak for Integration Installed.

The artifacts include an Integration Runtime Custom resource definition for depliyemnt and configuration objects which allow the server to connect to the Hybrid iPaaS
Control Plane.

The Bar file contains an ACE fow to expose a callable input which writes a message to  queue manger to simulate integration with a backend. This
keeps the scenario simple but allows OTEL trace from the MQ poutput node to take part in an end to end tarnsaction monitoring scenario.

The following artefacts are provided.

Configurations:
key.* - Provides the keystore for the integration runtime for secure connections to a MQ queue manager. 
MQPolicy.zip - an policy overide file to allow modification of the MQ endpoint wtihout changes to the source flow. 
agenta.json - an agent config file for connection to the HiPaaS for remote admin and advertising of the callable flow.
mqsivaultarchive - the vault which contains the configuration for the api key to connect to the monitoring endpoint
server.conf.yaml - contains the 
  - configuration yaml for the keystore location which uses the default location in the container.
  - environment variables for the iPaaS tenant
  - OpenTelemetry manager settings for the integration runtime
dbparms - not used in this demo
vaultarchivekey  - password for the included vault described above

Note that the repo here: https://github.com/peterajessup/mq-deploy-cp4i/ is sued to depoly the queue manager for the ACE runtime in this repo.

Installation: (Assumes a working CP4i installation on Openshift with the ACE operator installed.
1. Create the project 'ace'
2. Create a Dashboard instance to store the bar file (not covered here). 
see here: https://www.ibm.com/docs/en/app-connect/13.0.x?topic=dashboard-managing-bar-files
3. Upload the bar file and note the barUrl name. Note that you need to update the following in the yaml/aceIVTdeploy.yaml _barURL: ["https://<ace_dashboard_name>:3443/v1/directories/xxxx]_



```

 (The demo uses the ACE dashboard for Bar file storage).
