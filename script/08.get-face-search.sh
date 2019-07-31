#!/bin/bash
JOBID=`cat tmp/rekog_search_output.json | jq -r '.JobId'`

aws rekognition get-face-search --job-id $JOBID | jq -r '.Persons[].FaceMatches'
