# EC2 Instance: ${{ values.InstanceName }}

## Application

[Open the application](http://app-url.invalid)

**Running:** `${{ values.DockerImage }}`

The application container starts automatically at first boot — allow a minute after creation before opening the link.

## For developers

This repository is your playground — changes here affect only this instance.

- `src/` — the application source. Edit it and push to `main` (via a pull request): the **Build and Deploy** workflow rebuilds the image as `vijaygodson/demo-website:${{ values.InstanceName }}`, pushes it to Docker Hub, and restarts the container on this instance with the new build.
- `Dockerfile` — how `src/` is packaged.
- `config/` — the Terraform for this instance (platform-managed). Changes here re-run the Terraform workflow.

At creation, this instance boots on the release image you picked. The first build runs on your first push that touches `src/`; from then on, the instance serves your build.

## SSH Access

[Download the .pem key](https://s3.console.aws.amazon.com/s3/object/vijay-backstage-tfstate-v2?region=${{ values.Region }}&prefix=ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem)

Private key (stored in S3 at apply time):

[Open the .pem in the S3 console](https://s3.console.aws.amazon.com/s3/object/vijay-backstage-tfstate-v2?region=${{ values.Region }}&prefix=ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem)


Or from a terminal:

    aws s3 cp s3://vijay-backstage-tfstate-v2/ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem ./${{ values.InstanceName }}.pem
    chmod 400 ${{ values.InstanceName }}.pem
    ssh -i ${{ values.InstanceName }}.pem ec2-user@__INSTANCE_IP__

Generate a one-hour direct-download link:

    aws s3 presign s3://vijay-backstage-tfstate-v2/ec2-instances/${{ values.InstanceName }}/${{ values.InstanceName }}.pem --expires-in 86400
