{{ config(severity = 'warn') }}

SELECT flight_id, velocity FROM {{ ref("silver_telemetria")}}
    WHERE velocity < 0