{{ config(severity = 'warn') }}

SELECT flight_id, origin_country FROM {{ ref("silver_telemetria")}}
    WHERE origin_country IS NULL