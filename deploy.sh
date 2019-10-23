#!/bin/bash

#sam build
sam package --output-template \
    packaged.yaml --s3-bucket samtestaishu
sam  deploy --template-file packaged.yaml \
    --region us-east-1 --capabilities \
    CAPABILITY_IAM --stack-name samR