#!/bin/bash

CONFIG_FILE=deploy/build.config.properties
BROKER_ICR_NAMESPACE_URL=`cat ${CONFIG_FILE} | grep BROKER_ICR_NAMESPACE_URL | cut -d'=' -f2`
GC_OBJECT_ID=`cat ${CONFIG_FILE} | grep GC_OBJECT_ID | cut -d'=' -f2`
ICR_IMAGE=`cat ${CONFIG_FILE} | grep ICR_IMAGE | cut -d'=' -f2`
ONBOARDING_ENV=`cat ${CONFIG_FILE} | grep ONBOARDING_ENV | cut -d'=' -f2`
ICR_NAMESPACE_REGION=`cat ${CONFIG_FILE} | grep ICR_NAMESPACE_REGION | cut -d'=' -f2`

EMPTY='""'
echo ""
echo "---------- Checking configuration ----------"
if [ -z $ICR_NAMESPACE_REGION ] || [ $ICR_NAMESPACE_REGION == $EMPTY ] || [ -z $ONBOARDING_ENV ] || [ $ONBOARDING_ENV == $EMPTY ] || [ -z $ICR_IMAGE ] || [ $ICR_IMAGE == $EMPTY ] || [ -z $GC_OBJECT_ID ] || [ $GC_OBJECT_ID == $EMPTY ] || [ -z $BROKER_ICR_NAMESPACE_URL ] || [ $BROKER_ICR_NAMESPACE_URL == $EMPTY ];
then
	echo ""
	echo "*******************************************************************************"
	echo "build config properties not set !" ;
	echo "refer README to set values" ;
	echo "Exiting..." ;
	echo "*******************************************************************************"
	echo ""
	exit 1;
else
	echo "Ok"
fi

echo ""
echo "---------- Checking secrets ----------"
if [ -z $DEPLOYMENT_IAM_API_KEY ] || [ $DEPLOYMENT_IAM_API_KEY == $EMPTY ] || [ -z $ONBOARDING_IAM_API_KEY ] || [ $ONBOARDING_IAM_API_KEY == $EMPTY ];
then
	echo ""
	echo "*******************************************************************************"
	echo "secrets not set !" ;
	echo "refer README to set values" ;
	echo "Exiting..." ;
	echo "*******************************************************************************"
	echo ""
	exit 1;
else
	echo "Ok"
fi
