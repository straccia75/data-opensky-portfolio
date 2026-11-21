{{ config(severity = 'warn') }}

SELECT flight_id, latitude FROM {{ ref("silver_telemetria")}} -- latitude max is 90 degrees on each side
    WHERE latitude > 90 OR latitude < -90