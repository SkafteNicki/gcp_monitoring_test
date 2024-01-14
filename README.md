# gcp_monitoring_test

Repository contains a simple app that can be used to test GCP monitoring.
Steps to run the code:

1. Insp

1. Try locally
    
    ```bash
    make build_run_local
    ```
    
    navigate to http://localhost:8080/ to see the output.
    Also navigate to http://localhost:8080/metrics to see the metrics.

2. Try on GCP

    ```bash
    make build
    ```
    
    which will build both the app without and with monitoring.

4. Run

    ```bash
    make change_policy
    ```

    to change the policy of the app to allow all traffic.

5. Run

    ```bash
    make get_url
    ```

    to get the URL of the two apps.

6. Try invoking the app a few times and see the metrics in the monitoring dashboard.
