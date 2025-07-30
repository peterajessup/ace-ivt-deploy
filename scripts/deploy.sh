oc project ace

oc delete Configuration key.kdb
oc delete Configuration keyparms
oc delete Configuration httpsconf
oc delete Configuration mqpolicy
oc delete Configuration key.rdb
oc delete Configuration key.sth
oc delete Configuration otelarchive
oc delete Configuration otelarchivekey



set -e

bash -x createConfig.sh serverconf httpsconf config/server.conf.yaml
bash -x createConfig.sh keystore key.kdb config/key.kdb
bash -x createConfig.sh keystore key.rdb config/key.rdb
bash -x createConfig.sh keystore key.sth config/key.sth
bash -x createConfig.sh setdbparms keyparms config/setdbparms.txt
bash -x createConfig.sh vaultarchive otelarchive config/myisvaultarchive.zip
bash -x createConfig.sh vaultarchivekey otelarchivekey config/vaultarchivekey
bash -x createConfig.sh policyproject mqpolicy config/MQPolicy.zip

oc apply -f yaml/aceIVTDeploy.yaml
