#!/bin/bash

URL=`cat tmp/rekog_queue_url_output.json | jq -r '.QueueUrl'`
TOPICARN=`cat tmp/rekog_topic_output.json | jq -r '.TopicArn'`
SUBARN=`cat tmp/rekog_subscription_output.json | jq -r '.SubscriptionArn'`

aws iam detach-role-policy --role-name VideoRekogServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonRekognitionServiceRole
aws iam delete-role --role-name VideoRekogServiceRole

aws sns unsubscribe --subscription-arn $SUBARN
aws sqs delete-queue --queue-url $URL
aws sns delete-topic --topic-arn $TOPICARN

aws rekognition delete-collection --collection-id video-rekog-demo

aws s3 rm s3://video-rekog/pic.png
aws s3 rm s3://video-rekog/test.mp4
aws s3api delete-bucket --bucket video-rekog