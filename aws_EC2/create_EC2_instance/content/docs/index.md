# EC2 Instance: ${{ values.InstanceName }}

## Application

[Open the application](http://app-url.invalid)

The application container starts automatically at first boot — allow a minute after creation before opening the link.

## SSH Access

Private key (stored in S3 at apply time):

[Open the .pem in the S3 console](https://s3.console.aws.amazon.com/s3/object/vijay-backstage-tfstate-v2?region=${{ values.Region }}&prefix=ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem)
[Download the .pem key](https://s3.console.aws.amazon.com/s3/object/vijay-backstage-tfstate-v2?region=${{ values.Region }}&prefix=ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem)

Or from a terminal:

    aws s3 cp s3://vijay-backstage-tfstate-v2/ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem ./${{ values.InstanceName }}.pem
    
    chmod 400 ${{ values.InstanceName }}.pem
    ssh -i ${{ values.InstanceName }}.pem ec2-user@__INSTANCE_IP__

Generate a one-hour direct-download link:

    aws s3 presign s3://vijay-backstage-tfstate-v2/ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem --expires-in 86400
