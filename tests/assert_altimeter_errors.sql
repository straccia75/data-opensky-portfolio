{{ config(severity = 'warn') }}

SELECT flight_id, baro_altitude, on_ground FROM {{ ref("silver_telemetria")}}
WHERE baro_altitude > 200 AND on_ground = true