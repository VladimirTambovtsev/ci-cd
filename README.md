# ci-cd
Contrinous Integration / Deployment with Travis and Elastic Beanstalk

Demo: http://cicd-env.w3zevmvwsp.us-east-2.elasticbeanstalk.com/

# Quick Start

1. Create an account in <a href="https://travis-ci.org">https://travis-ci.org/</a> and turn on your github repo

2. Change credentials in <code>travis.yml</code>:
<pre>
before_install:
  - docker build -t docker_username/ci-cd -f Dockerfile.dev .

script:
  - docker run docker_username/ci-cd npm run test -- --coverage
</pre>

2. Create Elastic Beanstalk instance

3. Change credentials in <code>travis.yml</code> and remove comments:
<pre>
deploy:
  provider: elasticbeanstalk
  region: "us-east-2" # your region here
  app: "ci-cd" # your app title
  env: "CiCd-env" # your app envirnonment (available at `Dashboard`)
  bucket_name: "elasticbeanstalk-us-east-2-181410295797"  # find at s3 service your bucket name (AWS automatically creates it)
  bucket_path: "ci-cd"  # your bucket path (the same as your app title)
</pre>

4. Create new user at <a href="https://console.aws.amazon.com/iam/">IAM</a>. Generate Access key ID and Secret access key

5. Create new variables at your travis repository and paste AWS Access key ID, Secret access key:
<pre>
AWS_ACCESS_KEY: 'Your Access key ID'
AWS_SECRET_KEY: 'Secret access key'
</pre>

6. Make commit to master branch. 

Note: All commits to master will be automatically deployed on AWS. For development make sure to push new branches
