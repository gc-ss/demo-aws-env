#!/usr/bin/env python3
# Terraform bootstrapping
# Creates proper S3 bucket for remote storage and locking tables in DynamoDB

import boto3
import uuid
import argparse

# global clients for AWS
g_s3_client = boto3.client("s3")
g_dynamo_client = boto3.client("dynamodb")

# global argparser
parser = argparse.ArgumentParser(description='Bootstrap Terraform Remote Backends')
parser.add_argument("region")
parser.add_argument("-t", "--tag", help="Tags bootstrapped resources as being managed by Bootstrap", action="store_true")
args = parser.parse_args()

def create_bucket(region):
    response = g_s3_client.create_bucket(
        ACL='private',
        Bucket='bootstrap-{}'.format(uuid.uuid4()),
        CreateBucketConfiguration={
            'LocationConstraint': '{}'.format(region)
        }
    )
    return response

#def tag_bucket(tags):

bucket = create_bucket(args.region)
print(bucket.json())
# pass in tag bucket with parsed bucket name from return response
