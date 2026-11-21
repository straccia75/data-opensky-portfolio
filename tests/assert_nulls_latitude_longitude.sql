{{ config(severity = 'warn') }}

SELECT flight_id, latitude, longitude FROM {{ ref("silver_telemetria")}}
    WHERE latitude IS NULL OR longitude is NULL