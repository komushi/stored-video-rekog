#!/bin/bash

aws sqs create-queue --queue-name RekogStatusQueue > tmp/rekog_queue_url_output.json
URL=`cat tmp/rekog_queue_url_output.json | jq -r '.QueueUrl'`

aws sqs get-queue-attributes --queue-url $URL --attribute-names QueueArn > tmp/rekog_queue_arn_output.json
aws sns create-topic --name AmazonRekognitionVideoStatusTopic > tmp/rekog_topic_output.json