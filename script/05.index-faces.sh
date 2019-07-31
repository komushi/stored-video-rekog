#!/bin/bash
aws rekognition create-collection --collection-id video-rekog-demo
aws rekognition index-faces --collection-id video-rekog-demo --image "S3Object={Bucket=video-rekog,Name=pic.png}"