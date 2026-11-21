{{ config(severity = 'warn') }}

SELECT flight_id, baro_altitude FROM {{ ref("silver_telemetria")}}
WHERE baro_altitude > 18500