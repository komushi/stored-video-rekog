#!/bin/bash
aws s3api create-bucket --bucket video-rekog --create-bucket-configuration LocationConstraint=ap-northeast-1 > tmp/rekog_s3_bucket_output.json
aws s3 cp test.mp4 s3://video-rekog/test.mp4

aws s3 cp pic.png s3://video-rekog/pic.png