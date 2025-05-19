# Vertical Pod Autoscaler Flags
This document contains the flags for all VPA components.

To view the most recent _release_ of flags for all VPA components, consult the release tag [flags(1.3.1)](https://github.com/kubernetes/autoscaler/blob/vertical-pod-autoscaler-1.3.1/vertical-pod-autoscaler/docs/flags.md) documentation.

> **Note:** This document is auto-generated from the default branch (master) of the VPA repository.

# What are the parameters to VPA admission-controller?
This document is auto-generated from the flag definitions in the VPA admission-controller code.

| Flag | Default | Description |
|---------|---------|-------------|
| Flag | Default | Description |
|------|---------|-------------|
| `add-dir-header` |  | d-dir-header                         If true, adds the file directory to the header of the log messages |
| `address` | ":8944" | The address to expose Prometheus metrics. (default ":8944") |
| `alsologtostderr` |  | sologtostderr                        log to standard error as well as files (no effect when -logtostderr=true) |
| `client-ca-file` | "/etc/tls-certs/caCert.pem" | ath to CA PEM file. (default "/etc/tls-certs/caCert.pem") |
| `feature-gates` |  | ature-gates mapStringBool            A set of key=value pairs that describe feature gates for alpha/experimental features. Options are:
                                               AllAlpha=true\|false (ALPHA - default=false)
                                               AllBeta=true\|false (BETA - default=false)
                                               InPlaceOrRecreate=true\|false (ALPHA - default=false) |
| `ignored-vpa-object-namespaces` |  | nored-vpa-object-namespaces string   A comma-separated list of namespaces to ignore when searching for VPA objects. Leave empty to avoid ignoring any namespaces. These namespaces will not be cleaned by the garbage collector. |
| `kube-api-burst` | 10 | float                   QPS burst limit when making requests to Kubernetes apiserver (default 10) |
| `kube-api-qps` | 5 | loat                     QPS limit when making requests to Kubernetes apiserver (default 5) |
| `kubeconfig` |  | beconfig string                      Path to a kubeconfig. Only required if out-of-cluster. |
| `log-backtrace-at` | :0 | t traceLocation         when logging hits line file:N, emit a stack trace (default :0) |
| `log-dir` |  | g-dir string                         If non-empty, write log files in this directory (no effect when -logtostderr=true) |
| `log-file` |  | g-file string                        If non-empty, use this log file (no effect when -logtostderr=true) |
| `log-file-max-size` | 1800 | uint                 Defines the maximum size a log file can grow to (no effect when -logtostderr=true). Unit is megabytes. If the value is 0, the maximum file size is unlimited. (default 1800) |
| `logtostderr` | true | log to standard error instead of files (default true) |
| `min-tls-version` |  | ion string                 The minimum TLS version to accept.  Must be set to either tls1_2 (default) or tls1_3. (default "tls1_2") |
| `one-output` |  | e-output                             If true, only write logs to their native severity level (vs also writing to each lower severity level; no effect when -logtostderr=true) |
| `port` | 8000 | The port to listen on. (default 8000) |
| `profiling` |  | ofiling                              Is debug/pprof endpoint enabled |
| `register-by-url` |  | gister-by-url                        If set to true, admission webhook will be registered by URL (webhookAddress:webhookPort) instead of by service name |
| `register-webhook` | true | If set to true, admission webhook object will be created on start up to register with the API server. (default true) |
| `reload-cert` |  | load-cert                            If set to true, reload leaf and CA certificates when changed. |
| `skip-headers` |  | ip-headers                           If true, avoid header prefixes in the log messages |
| `skip-log-headers` |  | ip-log-headers                       If true, avoid headers when opening log files (no effect when -logtostderr=true) |
| `stderrthreshold` |  info | verity               set the log level threshold for writing to standard error (default: info) |
| `tls-cert-file` | "/etc/tls-certs/serverCert.pem" | to server certificate PEM file. (default "/etc/tls-certs/serverCert.pem") |
| `tls-ciphers` |  | s-ciphers string                     A comma-separated or colon-separated list of ciphers to accept.  Only works when min-tls-version is set to tls1_2. |
| `tls-private-key` | "/etc/tls-certs/serverKey.pem" | to server certificate key PEM file. (default "/etc/tls-certs/serverKey.pem") |
| `,` |  4 | set the log level verbosity (default: 4) (default 4) |
| `vmodule` |  | odule moduleSpec                     comma-separated list of pattern=N settings for file-filtered logging |
| `vpa-object-namespace` |  | a-object-namespace string            Specifies the namespace to search for VPA objects. Leave empty to include all namespaces. If provided, the garbage collector will only clean this namespace. |
| `webhook-address` |  | bhook-address string                 Address under which webhook is registered. Used when registerByURL is set to true. |
| `webhook-failure-policy-fail` |  | bhook-failure-policy-fail            If set to true, will configure the admission webhook failurePolicy to "Fail". Use with caution. |
| `webhook-labels` |  | bhook-labels string                  Comma separated list of labels to add to the webhook object. Format: key1:value1,key2:value2 |
| `webhook-port` |  | bhook-port string                    Server Port for Webhook |
| `webhook-service` | "vpa-webhook" | Kubernetes service under which webhook is registered. Used when registerByURL is set to false. (default "vpa-webhook") |
| `webhook-timeout-seconds` | 30 | -seconds int            Timeout in seconds that the API server should wait for this webhook to respond before failing. (default 30) |
Error: Failed to extract flags for admission-controller
# What are the parameters to VPA recommender?
This document is auto-generated from the flag definitions in the VPA recommender code.

| Flag | Default | Description |
|---------|---------|-------------|
| Flag | Default | Description |
|------|---------|-------------|
| `add-dir-header` |  | d-dir-header                                         If true, adds the file directory to the header of the log messages |
| `address` | ":8942" | The address to expose Prometheus metrics. (default ":8942") |
| `alsologtostderr` |  | sologtostderr                                        log to standard error as well as files (no effect when -logtostderr=true) |
| `checkpoints-gc-interval` | 10m0s | erval duration                       How often orphaned checkpoints should be garbage collected (default 10m0s) |
| `checkpoints-timeout` | 1m0s | ut duration                           Timeout for writing checkpoints since the start of the recommender's main loop (default 1m0s) |
| `confidence-interval-cpu` | 24h0m0s | cpu duration                       The time interval used for computing the confidence multiplier for the CPU lower and upper bound. Default: 24h (default 24h0m0s) |
| `confidence-interval-memory` | 24h0m0s | memory duration                    The time interval used for computing the confidence multiplier for the memory lower and upper bound. Default: 24h (default 24h0m0s) |
| `container-name-label` | "name" | l string                            Label name to look for container names (default "name") |
| `container-namespace-label` | "namespace" | l string                       Label name to look for container namespaces (default "namespace") |
| `container-pod-name-label` | "pod_name" | l string                        Label name to look for container pod names (default "pod_name") |
| `container-recommendation-max-allowed-cpu` |  | ntainer-recommendation-max-allowed-cpu quantity      Maximum amount of CPU that will be recommended for a container. VerticalPodAutoscaler-level maximum allowed takes precedence over the global maximum allowed. |
| `container-recommendation-max-allowed-memory` |  | ntainer-recommendation-max-allowed-memory quantity   Maximum amount of memory that will be recommended for a container. VerticalPodAutoscaler-level maximum allowed takes precedence over the global maximum allowed. |
| `cpu-histogram-decay-half-life` | 24h0m0s | half-life duration                 The amount of time it takes a historical CPU usage sample to lose half of its weight. (default 24h0m0s) |
| `cpu-integer-post-processor-enabled` |  | u-integer-post-processor-enabled                     Enable the cpu-integer recommendation post processor. The post processor will round up CPU recommendations to a whole CPU for pods which were opted in by setting an appropriate label on VPA object (experimental) |
| `external-metrics-cpu-metric` |  | ternal-metrics-cpu-metric string                     ALPHA.  Metric to use with external metrics provider for CPU usage. |
| `external-metrics-memory-metric` |  | ternal-metrics-memory-metric string                  ALPHA.  Metric to use with external metrics provider for memory usage. |
| `feature-gates` |  | ature-gates mapStringBool                            A set of key=value pairs that describe feature gates for alpha/experimental features. Options are:
                                                               AllAlpha=true\|false (ALPHA - default=false)
                                                               AllBeta=true\|false (BETA - default=false)
                                                               InPlaceOrRecreate=true\|false (ALPHA - default=false) |
| `history-length` | "8d" | ring                                  How much time back prometheus have to be queried to get historical metrics (default "8d") |
| `history-resolution` | "1h" | n string                              Resolution at which Prometheus is queried for historical metrics (default "1h") |
| `humanize-memory` |  | manize-memory                                        Convert memory values in recommendations to the highest appropriate SI unit with up to 2 decimal places for better readability. |
| `ignored-vpa-object-namespaces` |  | nored-vpa-object-namespaces string                   A comma-separated list of namespaces to ignore when searching for VPA objects. Leave empty to avoid ignoring any namespaces. These namespaces will not be cleaned by the garbage collector. |
| `kube-api-burst` | 10 | float                                   QPS burst limit when making requests to Kubernetes apiserver (default 10) |
| `kube-api-qps` | 5 | loat                                     QPS limit when making requests to Kubernetes apiserver (default 5) |
| `kubeconfig` |  | beconfig string                                      Path to a kubeconfig. Only required if out-of-cluster. |
| `leader-elect` |  | ader-elect                                           Start a leader election client and gain leadership before executing the main loop. Enable this when running replicated components for high availability. |
| `leader-elect-lease-duration` | 15s | se-duration duration                   The duration that non-leader candidates will wait after observing a leadership renewal until attempting to acquire leadership of a led but unrenewed leader slot. This is effectively the maximum duration that a leader can be stopped before it is replaced by another candidate. This is only applicable if leader election is enabled. (default 15s) |
| `leader-elect-renew-deadline` | 10s | ew-deadline duration                   The interval between attempts by the acting master to renew a leadership slot before it stops leading. This must be less than the lease duration. This is only applicable if leader election is enabled. (default 10s) |
| `leader-elect-resource-lock` | "leases" | -lock string                      The type of resource object that is used for locking during leader election. Supported options are 'leases'. (default "leases") |
| `leader-elect-resource-name` | "vpa-recommender-lease" | The name of resource object that is used for locking during leader election. (default "vpa-recommender-lease") |
| `leader-elect-resource-namespace` | "kube-system" | space string                 The namespace of resource object that is used for locking during leader election. (default "kube-system") |
| `leader-elect-retry-period` | 2s | try-period duration                     The duration the clients should wait between attempting acquisition and renewal of a leadership. This is only applicable if leader election is enabled. (default 2s) |
| `log-backtrace-at` | :0 | t traceLocation                         when logging hits line file:N, emit a stack trace (default :0) |
| `log-dir` |  | g-dir string                                         If non-empty, write log files in this directory (no effect when -logtostderr=true) |
| `log-file` |  | g-file string                                        If non-empty, use this log file (no effect when -logtostderr=true) |
| `log-file-max-size` | 1800 | uint                                 Defines the maximum size a log file can grow to (no effect when -logtostderr=true). Unit is megabytes. If the value is 0, the maximum file size is unlimited. (default 1800) |
| `logtostderr` | true | log to standard error instead of files (default true) |
| `memory-aggregation-interval` | 24h0m0s | nterval duration                   The length of a single interval, for which the peak memory usage is computed. Memory usage peaks are aggregated in multiples of this interval. In other words there is one memory usage sample per interval (the maximum usage over that interval) (default 24h0m0s) |
| `memory-aggregation-interval-count` | 8 | tion-interval-count int                  The number of consecutive memory-aggregation-intervals which make up the MemoryAggregationWindowLength which in turn is the period for memory usage aggregation by VPA. In other words, MemoryAggregationWindowLength = memory-aggregation-interval * memory-aggregation-interval-count. (default 8) |
| `memory-histogram-decay-half-life` | 24h0m0s | ay-half-life duration              The amount of time it takes a historical memory usage sample to lose half of its weight. In other words, a fresh usage sample is twice as 'important' as one with age equal to the half life period. (default 24h0m0s) |
| `memory-saver` |  | mory-saver                                           If true, only track pods which have an associated VPA |
| `metric-for-pod-labels` | "up{job=\"kubernetes-pods\"}" | Which metric to look for pod labels in metrics (default "up{job=\"kubernetes-pods\"}") |
| `min-checkpoints` | 10 | int                                    Minimum number of checkpoints to write per recommender's main loop (default 10) |
| `one-output` |  | e-output                                             If true, only write logs to their native severity level (vs also writing to each lower severity level; no effect when -logtostderr=true) |
| `oom-bump-up-ratio` | 1.2 | o float                                The memory bump up ratio when OOM occurred, default is 1.2. (default 1.2) |
| `oom-min-bump-up-bytes` | 1.048576e+08 | at                            The minimal increase of memory when OOM occurred in bytes, default is 100 * 1024 * 1024 (default 1.048576e+08) |
| `password` |  | ssword string                                        The password used in the prometheus server basic auth |
| `pod-label-prefix` | "pod_label_" | Which prefix to look for pod labels in metrics (default "pod_label_") |
| `pod-name-label` | "kubernetes_pod_name" | Label name to look for pod names (default "kubernetes_pod_name") |
| `pod-namespace-label` | "kubernetes_namespace" | Label name to look for pod namespaces (default "kubernetes_namespace") |
| `pod-recommendation-min-cpu-millicores` | 25 | ion-min-cpu-millicores float            Minimum CPU recommendation for a pod (default 25) |
| `pod-recommendation-min-memory-mb` | 250 | on-min-memory-mb float                 Minimum memory recommendation for a pod (default 250) |
| `profiling` |  | ofiling                                              Is debug/pprof endpoint enabled |
| `prometheus-address` | "http://prometheus.monitoring.svc" | Where to reach for Prometheus metrics (default "http://prometheus.monitoring.svc") |
| `prometheus-cadvisor-job-name` | "kubernetes-cadvisor" | g                    Name of the prometheus job name which scrapes the cAdvisor metrics (default "kubernetes-cadvisor") |
| `prometheus-query-timeout` | "5m" | timeout string                        How long to wait before killing long queries (default "5m") |
| `recommendation-lower-bound-cpu-percentile` | 0.5 | ower-bound-cpu-percentile float        CPU usage percentile that will be used for the lower bound on CPU recommendation. (default 0.5) |
| `recommendation-lower-bound-memory-percentile` | 0.5 | ower-bound-memory-percentile float     Memory usage percentile that will be used for the lower bound on memory recommendation. (default 0.5) |
| `recommendation-margin-fraction` | 0.15 | rgin-fraction float                   Fraction of usage added as the safety margin to the recommended request (default 0.15) |
| `recommendation-upper-bound-cpu-percentile` | 0.95 | per-bound-cpu-percentile float        CPU usage percentile that will be used for the upper bound on CPU recommendation. (default 0.95) |
| `recommendation-upper-bound-memory-percentile` | 0.95 | per-bound-memory-percentile float     Memory usage percentile that will be used for the upper bound on memory recommendation. (default 0.95) |
| `recommender-interval` | 1m0s | val duration                          How often metrics should be fetched (default 1m0s) |
| `recommender-name` | "default" | g                                Set the recommender name. Recommender will generate recommendations for VPAs that configure the same recommender name. If the recommender name is left as default it will also generate recommendations that don't explicitly specify recommender. You shouldn't run two recommenders with the same name in a cluster. (default "default") |
| `round-cpu-millicores` | 1 | icores int                               CPU recommendation rounding factor in millicores. The CPU value will always be rounded up to the nearest multiple of this factor. (default 1) |
| `skip-headers` |  | ip-headers                                           If true, avoid header prefixes in the log messages |
| `skip-log-headers` |  | ip-log-headers                                       If true, avoid headers when opening log files (no effect when -logtostderr=true) |
| `stderrthreshold` |  info | verity                               set the log level threshold for writing to standard error (default: info) |
| `storage` |  | ng                                         Specifies storage mode. Supported values: prometheus, checkpoint (default) |
| `target-cpu-percentile` | 0.9 | ntile float                            CPU usage percentile that will be used as a base for CPU target recommendation. Doesn't affect CPU lower bound, CPU upper bound nor memory recommendations. (default 0.9) |
| `target-memory-percentile` | 0.9 | rcentile float                         Memory usage percentile that will be used as a base for memory target recommendation. Doesn't affect memory lower bound nor memory upper bound. (default 0.9) |
| `use-external-metrics` |  | e-external-metrics                                   ALPHA.  Use an external metrics provider instead of metrics_server. |
| `username` |  | ername string                                        The username used in the prometheus server basic auth |
| `,` |  4 | set the log level verbosity (default: 4) (default 4) |
| `vmodule` |  | odule moduleSpec                                     comma-separated list of pattern=N settings for file-filtered logging |
| `vpa-object-namespace` |  | a-object-namespace string                            Specifies the namespace to search for VPA objects. Leave empty to include all namespaces. If provided, the garbage collector will only clean this namespace. |
Error: Failed to extract flags for recommender
# What are the parameters to VPA updater?
This document is auto-generated from the flag definitions in the VPA updater code.

| Flag | Default | Description |
|---------|---------|-------------|
| Flag | Default | Description |
|------|---------|-------------|
| `add-dir-header` |  | d-dir-header                                                  If true, adds the file directory to the header of the log messages |
| `address` | ":8943" | The address to expose Prometheus metrics. (default ":8943") |
| `alsologtostderr` |  | sologtostderr                                                 log to standard error as well as files (no effect when -logtostderr=true) |
| `evict-after-oom-threshold` | 10m0s | reshold duration                              Evict pod that has OOMed in less than evict-after-oom-threshold since start. (default 10m0s) |
| `eviction-rate-burst` | 1 | burst int                                         Burst of pods that can be evicted. (default 1) |
| `eviction-rate-limit` |  | iction-rate-limit float                                       Number of pods that can be evicted per seconds. A rate limit set to 0 or -1 will disable
                                                                        		the rate limiter. (default -1) |
| `eviction-tolerance` | 0.5 | ce float                                        Fraction of replica count that can be evicted for update, if more than one pod can be evicted. (default 0.5) |
| `feature-gates` |  | ature-gates mapStringBool                                     A set of key=value pairs that describe feature gates for alpha/experimental features. Options are:
                                                                        AllAlpha=true\|false (ALPHA - default=false)
                                                                        AllBeta=true\|false (BETA - default=false)
                                                                        InPlaceOrRecreate=true\|false (ALPHA - default=false) |
| `ignored-vpa-object-namespaces` |  | nored-vpa-object-namespaces string                            A comma-separated list of namespaces to ignore when searching for VPA objects. Leave empty to avoid ignoring any namespaces. These namespaces will not be cleaned by the garbage collector. |
| `in-recommendation-bounds-eviction-lifetime-threshold` | 12h0m0s | unds-eviction-lifetime-threshold duration   Pods that live for at least that long can be evicted even if their request is within the [MinRecommended...MaxRecommended] range (default 12h0m0s) |
| `kube-api-burst` | 10 | float                                            QPS burst limit when making requests to Kubernetes apiserver (default 10) |
| `kube-api-qps` | 5 | loat                                              QPS limit when making requests to Kubernetes apiserver (default 5) |
| `kubeconfig` |  | beconfig string                                               Path to a kubeconfig. Only required if out-of-cluster. |
| `leader-elect` |  | ader-elect                                                    Start a leader election client and gain leadership before executing the main loop. Enable this when running replicated components for high availability. |
| `leader-elect-lease-duration` | 15s | se-duration duration                            The duration that non-leader candidates will wait after observing a leadership renewal until attempting to acquire leadership of a led but unrenewed leader slot. This is effectively the maximum duration that a leader can be stopped before it is replaced by another candidate. This is only applicable if leader election is enabled. (default 15s) |
| `leader-elect-renew-deadline` | 10s | ew-deadline duration                            The interval between attempts by the acting master to renew a leadership slot before it stops leading. This must be less than the lease duration. This is only applicable if leader election is enabled. (default 10s) |
| `leader-elect-resource-lock` | "leases" | -lock string                               The type of resource object that is used for locking during leader election. Supported options are 'leases'. (default "leases") |
| `leader-elect-resource-name` | "vpa-updater" | string                               The name of resource object that is used for locking during leader election. (default "vpa-updater") |
| `leader-elect-resource-namespace` | "kube-system" | space string                          The namespace of resource object that is used for locking during leader election. (default "kube-system") |
| `leader-elect-retry-period` | 2s | try-period duration                              The duration the clients should wait between attempting acquisition and renewal of a leadership. This is only applicable if leader election is enabled. (default 2s) |
| `log-backtrace-at` | :0 | t traceLocation                                  when logging hits line file:N, emit a stack trace (default :0) |
| `log-dir` |  | g-dir string                                                  If non-empty, write log files in this directory (no effect when -logtostderr=true) |
| `log-file` |  | g-file string                                                 If non-empty, use this log file (no effect when -logtostderr=true) |
| `log-file-max-size` | 1800 | uint                                          Defines the maximum size a log file can grow to (no effect when -logtostderr=true). Unit is megabytes. If the value is 0, the maximum file size is unlimited. (default 1800) |
| `logtostderr` | true | log to standard error instead of files (default true) |
| `min-replicas` | 2 | nt                                                Minimum number of replicas to perform update (default 2) |
| `one-output` |  | e-output                                                      If true, only write logs to their native severity level (vs also writing to each lower severity level; no effect when -logtostderr=true) |
| `pod-update-threshold` | 0.1 | hold float                                      Ignore updates that have priority lower than the value of this flag (default 0.1) |
| `profiling` |  | ofiling                                                       Is debug/pprof endpoint enabled |
| `skip-headers` |  | ip-headers                                                    If true, avoid header prefixes in the log messages |
| `skip-log-headers` |  | ip-log-headers                                                If true, avoid headers when opening log files (no effect when -logtostderr=true) |
| `stderrthreshold` |  info | verity                                        set the log level threshold for writing to standard error (default: info) |
| `updater-interval` | 1m0s | duration                                       How often updater should run (default 1m0s) |
| `use-admission-controller-status` | true | troller-status                                 If true, updater will only evict pods when admission controller status is valid. (default true) |
| `,` |  4 | set the log level verbosity (default: 4) (default 4) |
| `vmodule` |  | odule moduleSpec                                              comma-separated list of pattern=N settings for file-filtered logging |
| `vpa-object-namespace` |  | a-object-namespace string                                     Specifies the namespace to search for VPA objects. Leave empty to include all namespaces. If provided, the garbage collector will only clean this namespace. |
Error: Failed to extract flags for updater
