#!/bin/bash

QUEUEARN=`cat tmp/rekog_queue_arn_output.json | jq -r '.Attributes.QueueArn'`
TOPICARN=`cat tmp/rekog_topic_output.json | jq -r '.TopicArn'`
URL=`cat tmp/rekog_queue_url_output.json | jq -r '.QueueUrl'`

aws sns subscribe --topic-arn $TOPICARN --protocol sqs --notification-endpoint $QUEUEARN > tmp/rekog_subscription_output.json

aws sqs add-permission --queue-url $URL --label SendMessagesFromRekogQueue --aws-account-ids $AWS_ACCOUNT --actions SendMessage