import boto3
from dotenv import dotenv_values

secrets = dotenv_values('.env')

ec2client = boto3.client('ec2', aws_access_key_id=secrets['AWS_ACCESS_KEY'], aws_secret_access_key=secrets['AWS_SECRET_ACCESS_KEY'], region_name='eu-west-2')

response = ec2client.describe_instances()

print(response)
