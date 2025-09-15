# cp4idemoace

This repository is to be used for creating an ACE Integration Server on OCP, version 4.10.x, with IBM's Cloudpak for Integration Installed (verison 2020.2.1 or higher).

The artifacts include an Integration Server Custom resource definition and configuration objects which allow the server to connect to the Hybrid iPaaS
Control Plane.

The Bar file contains an ACE fow to expose a callable input which writes a message to q queue manger to simulate integration with a backend. This
keeps the scenario simple but allows OTEL trace from the MQ poutput node to take part in an end to end tarnsaction monitoriing scenario.

The following artefacts are provided.

Configurations:




```
