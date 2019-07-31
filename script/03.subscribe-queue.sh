#!/bin/bash

QUEUEARN=`cat tmp/rekog_queue_arn_output.json | jq -r '.Attributes.QueueArn'`
TOPICARN=`cat tmp/rekog_topic_output.json | jq -r '.TopicArn'`
URL=`cat tmp/rekog_queue_url_output.json | jq -r '.QueueUrl'`

aws sns subscribe --topic-arn $TOPICARN --protocol sqs --notification-endpoint $QUEUEARN > tmp/rekog_subscription_output.json

sed -e "s%\${AWS::Region}%$AWS_REGION%" -e "s%\${AWS::AccountId}%$AWS_ACCOUNT%" config/rekog_sqs_policy_template.json  > tmp/rekog_sqs_policy.json
aws sqs set-queue-attributes --queue-url $URL --attributes file://tmp/rekog_sqs_policy.json