# hacksite
Collection of hacktime project

## To Do

## Hosting
* SSL cert created manually due to time to provision

## Workflows
deploy - add input for version for workflow_dispatch

## Quotes
### To Do
* Add github action to add quote to json and PR


* silly and inspirational quotes
* display one and have button to ask for another
* way to contribute a quote
* tags for quotes ex. sunny
* Auto send GitHub issue request from the site
* Easter egg - https://www.willmaster.com/library/features/how-to-make-an-easter-egg.php


## Map
* something with geolocation



# WIP
* Workflow to add quote to json
* Infra for hosting
  * More variables
* change lb to https then merge to main
* Workflow to merge to main

## commands
storage url
`https://storage.googleapis.com/hacktime-site/index.html`

LB URL
`https://www.googleapis.com/compute/v1/projects/hacktime-site/global/backendBuckets/hacksite-backend-bucket`

copy files - needs to exclude infra dir
`gsutil cp -r ./* gs://hacktime-site/`

### Links:
* https://cloud.google.com/storage/docs/hosting-static-website
* https://medium.com/swlh/setup-a-static-website-cdn-with-terraform-on-gcp-23c6937382c6
