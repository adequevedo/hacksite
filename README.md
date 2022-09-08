# hacksite
Collection of hacktime project

## To Do
* format quote page
* figure out hosting
* terraform
* github actions
* error page
* static site bucket vs cloud run costs comparison

## Hosting
* Cloud run vs bucket storage
* SSL cert created manually due to time to provision



## Quotes
### To Do
* Add github action to add quote to json and PR


* silly and inpirational quotes
* display one and have button to ask for another
* way to contribute a quote
* tags for quotes ex. sunny
* Auto send github issue request from the site
* Easter egg - https://www.willmaster.com/library/features/how-to-make-an-easter-egg.php


## Map
* something with geolocation


### Links:
* https://cloud.google.com/storage/docs/hosting-static-website
* https://medium.com/swlh/setup-a-static-website-cdn-with-terraform-on-gcp-23c6937382c6



# WIP
* Workflow to add quote to json
* Infra for hosting
  * More variables
* change lb to https 

## commands
storage url
`https://storage.googleapis.com/hacktime-site/index.html`

LB URL
`https://www.googleapis.com/compute/v1/projects/hacktime-site/global/backendBuckets/hacksite-backend-bucket`

copy files - needs to exclude state
`gsutil cp -r ./* gs://hacktime-site/`
