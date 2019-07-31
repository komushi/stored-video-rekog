#!/bin/bash

mkdir -p tmp
aws iam create-role --role-name VideoRekogServiceRole --assume-role-policy-document file://config/rekog_assume_role_policy.json > tmp/rekog_role_output.json
aws iam attach-role-policy --role-name VideoRekogServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonRekognitionServiceRole