#!/bin/bash
URL=`cat tmp/rekog_queue_url_output.json | jq -r '.QueueUrl'`

aws sqs receive-message --queue-url $URL --attribute-names ALL