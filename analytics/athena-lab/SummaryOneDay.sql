SELECT SUM(bytes) AS total_bytes 
FROM aws_service_logs.cf_access_optimized
WHERE time BETWEEN TIMESTAMP '2018-11-02' AND TIMESTAMP '2018-11-03'
