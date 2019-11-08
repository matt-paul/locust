This repo is largely based on https://cloud.google.com/solutions/distributed-load-testing-using-gke, with terraform handling the infrastructure.


### Sample-app
The following describes launching the companion ‘sample app’ that was load tested with Locust

Deploy the sample app to App Engine
gcloud app deploy sample-webapp/app.yaml \
  --project=locust-load-testing-123

View logs
gcloud app logs tail -s default

View app in browser
gcloud app browse

https://locust-load-testing-123.appspot.com/


### Locust Cluster

`terraform plan`
`terraform apply`
