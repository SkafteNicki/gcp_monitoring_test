.PHONY: *

PROJECT_ID=dtumlops-335110
SA_NAME=monitoring-sa
REGION=europe-west1

build_run_local:
	docker build . -t simple_monitor_app:latest
	docker run -p 8080:8080 -e PORT=8080 simple_monitor_app:latest

diff:
	diff service.yaml service-monitoring.yaml
	diff cloudbuild.yaml cloudbuild-monitoring.yaml

enable_services:
	gcloud services enable run.googleapis.com
	gcloud services enable artifactregistry.googleapis.com
	gcloud services enable secretmanager.googleapis.com
	gcloud services enable monitoring.googleapis.com
	gcloud services enable logging.googleapis.com
	gcloud services enable cloudbuild.googleapis.com
	gcloud services enable iam.googleapis.com

build:
	gcloud builds submit --config cloudbuild.yaml
	gcloud builds submit --config cloudbuild-monitoring.yaml

change_policy:
	gcloud run services set-iam-policy my-service policy.yaml
	gcloud run services set-iam-policy my-service-with-monitoring policy.yaml

get_url:
	gcloud run services describe my-service --region=europe-west1 --format="value(status.url)"
	gcloud run services describe my-service-with-monitoring --region=europe-west1 --format="value(status.url)"