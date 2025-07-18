#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-update curl jq

set -eu -o pipefail

source_file=pkgs/development/python-modules/types-aiobotocore-packages/default.nix

nix-update python312Packages.types-aiobotocore --commit --build

packages=(
  types-aiobotocore-accessanalyzer
  types-aiobotocore-account
  types-aiobotocore-acm
  types-aiobotocore-acm-pca
  # types-aiobotocore-alexaforbusiness  Obsolete, will be removed soon
  types-aiobotocore-amp
  types-aiobotocore-amplify
  types-aiobotocore-amplifybackend
  types-aiobotocore-amplifyuibuilder
  types-aiobotocore-apigateway
  types-aiobotocore-apigatewaymanagementapi
  types-aiobotocore-apigatewayv2
  types-aiobotocore-appconfig
  types-aiobotocore-appconfigdata
  types-aiobotocore-appfabric
  types-aiobotocore-appflow
  types-aiobotocore-appintegrations
  types-aiobotocore-application-autoscaling
  types-aiobotocore-application-insights
  types-aiobotocore-applicationcostprofiler
  types-aiobotocore-appmesh
  types-aiobotocore-apprunner
  types-aiobotocore-appstream
  types-aiobotocore-appsync
  types-aiobotocore-arc-zonal-shift
  types-aiobotocore-athena
  types-aiobotocore-auditmanager
  types-aiobotocore-autoscaling
  types-aiobotocore-autoscaling-plans
  types-aiobotocore-backup
  types-aiobotocore-backup-gateway
  # types-aiobotocore-backupstorage  Obsolete, will be removed soon
  types-aiobotocore-batch
  types-aiobotocore-billingconductor
  types-aiobotocore-braket
  types-aiobotocore-budgets
  types-aiobotocore-ce
  types-aiobotocore-chime
  types-aiobotocore-chime-sdk-identity
  types-aiobotocore-chime-sdk-media-pipelines
  types-aiobotocore-chime-sdk-meetings
  types-aiobotocore-chime-sdk-messaging
  types-aiobotocore-chime-sdk-voice
  types-aiobotocore-cleanrooms
  types-aiobotocore-cloud9
  types-aiobotocore-cloudcontrol
  types-aiobotocore-clouddirectory
  types-aiobotocore-cloudformation
  types-aiobotocore-cloudfront
  types-aiobotocore-cloudhsm
  types-aiobotocore-cloudhsmv2
  types-aiobotocore-cloudsearch
  types-aiobotocore-cloudsearchdomain
  types-aiobotocore-cloudtrail
  types-aiobotocore-cloudtrail-data
  types-aiobotocore-cloudwatch
  types-aiobotocore-codeartifact
  types-aiobotocore-codebuild
  types-aiobotocore-codecatalyst
  types-aiobotocore-codecommit
  types-aiobotocore-codedeploy
  types-aiobotocore-codeguru-reviewer
  types-aiobotocore-codeguru-security
  types-aiobotocore-codeguruprofiler
  types-aiobotocore-codepipeline
  # types-aiobotocore-codestar  Obsolete, will be removed soon
  types-aiobotocore-codestar-connections
  types-aiobotocore-codestar-notifications
  types-aiobotocore-cognito-identity
  types-aiobotocore-cognito-idp
  types-aiobotocore-cognito-sync
  types-aiobotocore-comprehend
  types-aiobotocore-comprehendmedical
  types-aiobotocore-compute-optimizer
  types-aiobotocore-config
  types-aiobotocore-connect
  types-aiobotocore-connect-contact-lens
  types-aiobotocore-connectcampaigns
  types-aiobotocore-connectcases
  types-aiobotocore-connectparticipant
  types-aiobotocore-controltower
  types-aiobotocore-cur
  types-aiobotocore-customer-profiles
  types-aiobotocore-databrew
  types-aiobotocore-dataexchange
  types-aiobotocore-datapipeline
  types-aiobotocore-datasync
  types-aiobotocore-dax
  types-aiobotocore-detective
  types-aiobotocore-devicefarm
  types-aiobotocore-devops-guru
  types-aiobotocore-directconnect
  types-aiobotocore-discovery
  types-aiobotocore-dlm
  types-aiobotocore-dms
  types-aiobotocore-docdb
  types-aiobotocore-docdb-elastic
  types-aiobotocore-drs
  types-aiobotocore-ds
  types-aiobotocore-dynamodb
  types-aiobotocore-dynamodbstreams
  types-aiobotocore-ebs
  types-aiobotocore-ec2
  types-aiobotocore-ec2-instance-connect
  types-aiobotocore-ecr
  types-aiobotocore-ecr-public
  types-aiobotocore-ecs
  types-aiobotocore-efs
  types-aiobotocore-eks
  types-aiobotocore-elastic-inference
  types-aiobotocore-elasticache
  types-aiobotocore-elasticbeanstalk
  types-aiobotocore-elastictranscoder
  types-aiobotocore-elb
  types-aiobotocore-elbv2
  types-aiobotocore-emr
  types-aiobotocore-emr-containers
  types-aiobotocore-emr-serverless
  types-aiobotocore-entityresolution
  types-aiobotocore-es
  types-aiobotocore-events
  types-aiobotocore-evidently
  types-aiobotocore-finspace
  types-aiobotocore-finspace-data
  types-aiobotocore-firehose
  types-aiobotocore-fis
  types-aiobotocore-fms
  types-aiobotocore-forecast
  types-aiobotocore-forecastquery
  types-aiobotocore-frauddetector
  types-aiobotocore-fsx
  types-aiobotocore-gamelift
  # types-aiobotocore-gamesparks  Obsolete, will be removed soon
  types-aiobotocore-glacier
  types-aiobotocore-globalaccelerator
  types-aiobotocore-glue
  types-aiobotocore-grafana
  types-aiobotocore-greengrass
  types-aiobotocore-greengrassv2
  types-aiobotocore-groundstation
  types-aiobotocore-guardduty
  types-aiobotocore-health
  types-aiobotocore-healthlake
  # types-aiobotocore-honeycode  Obsolete, will be removed soon
  types-aiobotocore-iam
  types-aiobotocore-identitystore
  types-aiobotocore-imagebuilder
  types-aiobotocore-importexport
  types-aiobotocore-inspector
  types-aiobotocore-inspector2
  types-aiobotocore-internetmonitor
  types-aiobotocore-iot
  types-aiobotocore-iot-data
  types-aiobotocore-iot-jobs-data
  # types-aiobotocore-iot-roborunner  Obsolete, will be removed soon
  # types-aiobotocore-iot1click-devices
  # types-aiobotocore-iot1click-projects
  types-aiobotocore-iotanalytics
  types-aiobotocore-iotdeviceadvisor
  types-aiobotocore-iotevents
  types-aiobotocore-iotevents-data
  types-aiobotocore-iotfleethub
  types-aiobotocore-iotfleetwise
  types-aiobotocore-iotsecuretunneling
  types-aiobotocore-iotsitewise
  types-aiobotocore-iotthingsgraph
  types-aiobotocore-iottwinmaker
  types-aiobotocore-iotwireless
  types-aiobotocore-ivs
  types-aiobotocore-ivs-realtime
  types-aiobotocore-ivschat
  types-aiobotocore-kafka
  types-aiobotocore-kafkaconnect
  types-aiobotocore-kendra
  types-aiobotocore-kendra-ranking
  types-aiobotocore-keyspaces
  types-aiobotocore-kinesis
  types-aiobotocore-kinesis-video-archived-media
  types-aiobotocore-kinesis-video-media
  types-aiobotocore-kinesis-video-signaling
  types-aiobotocore-kinesis-video-webrtc-storage
  types-aiobotocore-kinesisanalytics
  types-aiobotocore-kinesisanalyticsv2
  types-aiobotocore-kinesisvideo
  types-aiobotocore-kms
  types-aiobotocore-lakeformation
  types-aiobotocore-lambda
  types-aiobotocore-lex-models
  types-aiobotocore-lex-runtime
  types-aiobotocore-lexv2-models
  types-aiobotocore-lexv2-runtime
  types-aiobotocore-license-manager
  types-aiobotocore-license-manager-linux-subscriptions
  types-aiobotocore-license-manager-user-subscriptions
  types-aiobotocore-lightsail
  types-aiobotocore-location
  types-aiobotocore-logs
  types-aiobotocore-lookoutequipment
  types-aiobotocore-lookoutmetrics
  types-aiobotocore-lookoutvision
  types-aiobotocore-m2
  types-aiobotocore-machinelearning
  # types-aiobotocore-macie  Obsolete, will be removed soon
  types-aiobotocore-macie2
  types-aiobotocore-managedblockchain
  types-aiobotocore-managedblockchain-query
  types-aiobotocore-marketplace-catalog
  types-aiobotocore-marketplace-entitlement
  types-aiobotocore-marketplacecommerceanalytics
  types-aiobotocore-mediaconnect
  types-aiobotocore-mediaconvert
  types-aiobotocore-medialive
  types-aiobotocore-mediapackage
  types-aiobotocore-mediapackage-vod
  types-aiobotocore-mediapackagev2
  types-aiobotocore-mediastore
  types-aiobotocore-mediastore-data
  types-aiobotocore-mediatailor
  types-aiobotocore-medical-imaging
  types-aiobotocore-memorydb
  types-aiobotocore-meteringmarketplace
  types-aiobotocore-mgh
  types-aiobotocore-mgn
  types-aiobotocore-migration-hub-refactor-spaces
  types-aiobotocore-migrationhub-config
  types-aiobotocore-migrationhuborchestrator
  types-aiobotocore-migrationhubstrategy
  # types-aiobotocore-mobile  Obsolete, will be removed soon
  types-aiobotocore-mq
  types-aiobotocore-mturk
  types-aiobotocore-mwaa
  types-aiobotocore-neptune
  types-aiobotocore-network-firewall
  types-aiobotocore-networkmanager
  types-aiobotocore-nimble
  types-aiobotocore-oam
  types-aiobotocore-omics
  types-aiobotocore-opensearch
  types-aiobotocore-opensearchserverless
  types-aiobotocore-opsworks
  types-aiobotocore-opsworkscm
  types-aiobotocore-organizations
  types-aiobotocore-osis
  types-aiobotocore-outposts
  types-aiobotocore-panorama
  types-aiobotocore-payment-cryptography
  types-aiobotocore-payment-cryptography-data
  types-aiobotocore-personalize
  types-aiobotocore-personalize-events
  types-aiobotocore-personalize-runtime
  types-aiobotocore-pi
  types-aiobotocore-pinpoint
  types-aiobotocore-pinpoint-email
  types-aiobotocore-pinpoint-sms-voice
  types-aiobotocore-pinpoint-sms-voice-v2
  types-aiobotocore-pipes
  types-aiobotocore-polly
  types-aiobotocore-pricing
  types-aiobotocore-privatenetworks
  types-aiobotocore-proton
  types-aiobotocore-qldb
  types-aiobotocore-qldb-session
  types-aiobotocore-quicksight
  types-aiobotocore-ram
  types-aiobotocore-rbin
  types-aiobotocore-rds
  types-aiobotocore-rds-data
  types-aiobotocore-redshift
  types-aiobotocore-redshift-data
  types-aiobotocore-redshift-serverless
  types-aiobotocore-rekognition
  types-aiobotocore-resiliencehub
  types-aiobotocore-resource-explorer-2
  types-aiobotocore-resource-groups
  types-aiobotocore-resourcegroupstaggingapi
  types-aiobotocore-robomaker
  types-aiobotocore-rolesanywhere
  types-aiobotocore-route53
  types-aiobotocore-route53-recovery-cluster
  types-aiobotocore-route53-recovery-control-config
  types-aiobotocore-route53-recovery-readiness
  types-aiobotocore-route53domains
  types-aiobotocore-route53resolver
  types-aiobotocore-rum
  types-aiobotocore-s3
  types-aiobotocore-s3control
  types-aiobotocore-s3outposts
  types-aiobotocore-sagemaker
  types-aiobotocore-sagemaker-a2i-runtime
  types-aiobotocore-sagemaker-edge
  types-aiobotocore-sagemaker-featurestore-runtime
  types-aiobotocore-sagemaker-geospatial
  types-aiobotocore-sagemaker-metrics
  types-aiobotocore-sagemaker-runtime
  types-aiobotocore-savingsplans
  types-aiobotocore-scheduler
  types-aiobotocore-schemas
  types-aiobotocore-sdb
  types-aiobotocore-secretsmanager
  types-aiobotocore-securityhub
  types-aiobotocore-securitylake
  types-aiobotocore-serverlessrepo
  types-aiobotocore-service-quotas
  types-aiobotocore-servicecatalog
  types-aiobotocore-servicecatalog-appregistry
  types-aiobotocore-servicediscovery
  types-aiobotocore-ses
  types-aiobotocore-sesv2
  types-aiobotocore-shield
  types-aiobotocore-signer
  types-aiobotocore-simspaceweaver
  types-aiobotocore-sms
  types-aiobotocore-sms-voice
  types-aiobotocore-snow-device-management
  types-aiobotocore-snowball
  types-aiobotocore-sns
  types-aiobotocore-sqs
  types-aiobotocore-ssm
  types-aiobotocore-ssm-contacts
  types-aiobotocore-ssm-incidents
  types-aiobotocore-ssm-sap
  types-aiobotocore-sso
  types-aiobotocore-sso-admin
  types-aiobotocore-sso-oidc
  types-aiobotocore-stepfunctions
  types-aiobotocore-storagegateway
  types-aiobotocore-sts
  types-aiobotocore-support
  types-aiobotocore-support-app
  types-aiobotocore-swf
  types-aiobotocore-synthetics
  types-aiobotocore-textract
  types-aiobotocore-timestream-query
  types-aiobotocore-timestream-write
  types-aiobotocore-tnb
  types-aiobotocore-transcribe
  types-aiobotocore-transfer
  types-aiobotocore-translate
  types-aiobotocore-verifiedpermissions
  types-aiobotocore-voice-id
  types-aiobotocore-vpc-lattice
  types-aiobotocore-waf
  types-aiobotocore-waf-regional
  types-aiobotocore-wafv2
  types-aiobotocore-wellarchitected
  types-aiobotocore-wisdom
  types-aiobotocore-workdocs
  # types-aiobotocore-worklink
  types-aiobotocore-workmail
  types-aiobotocore-workmailmessageflow
  types-aiobotocore-workspaces
  types-aiobotocore-workspaces-web
  types-aiobotocore-xray
)

version=$(curl -s https://pypi.org/pypi/types-aiobotocore/json | jq -r '.info.version')
echo "All types-aiobotocore-* packages will be updated to ${version}"

for package in "${packages[@]}"; do
  echo "Updating ${package} ..."

  url="https://pypi.io/packages/source/t/${package}/${package//-/_}-${version}.tar.gz"
  hash=$(nix-prefetch-url --type sha256 $url)
  sri_hash="$(nix --extra-experimental-features nix-command hash convert --hash-algo sha256 --to sri $hash)"
  package_short="${package#types-aiobotocore-}"

  awk -i inplace -v pkg="$package" -v pkg_short="$package_short" -v ver="$version" -v hash="$sri_hash" '
  {
      # If the line contains the package name
      if ($0 ~ "^\\s*" pkg "\\s*=") {
          print $0
          inside_block = 1
      } else if (inside_block && $0 ~ "buildTypesAiobotocorePackage") {
          print "    buildTypesAiobotocorePackage \"" "" pkg_short "\" \"" ver "\""
      } else if (inside_block && $0 ~ "sha256-") {
          print "      \"" hash "\";"
          inside_block = 0
      } else {
          # Preserve blank lines to honor nixfmt
          print $0
      }
  }' ${source_file}

done
