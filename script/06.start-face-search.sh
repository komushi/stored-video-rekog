#!/bin/bash
TOPICARN=`cat tmp/rekog_topic_output.json | jq -r '.TopicArn'`
ROLEARN=`cat tmp/rekog_role_output.json | jq -r '.Role.Arn'`

aws rekognition start-face-search --video "S3Object={Bucket=video-rekog,Name=test.mp4}" --collection-id video-rekog-demo --notification-channel "SNSTopicArn=$TOPICARN,RoleArn=$ROLEARN" > tmp/rekog_search_output.json
