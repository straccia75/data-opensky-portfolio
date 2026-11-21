{{ config(severity = 'warn') }}

SELECT flight_id, longitude FROM {{ ref("silver_telemetria")}} --Longitude west-east is max 180 on each side
    WHERE longitude > 180 OR longitude < -180