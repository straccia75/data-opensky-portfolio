{{ config(
    materialized='table',
    partition_by={
      "field": "ingestion_date",
      "data_type": "date"
    }
) }}

WITH raw_data AS (
    -- dbt injection of raw data table
    SELECT * FROM {{ source('opensky', 'bronze_telemetria') }}
)


SELECT
    ingestion_date,
    ingested_at,

    JSON_VALUE(json_payload, '$[0]') AS flight_id, -- OpenSky API docs indicate that icao24 is a flight identifier but not a good name for my silver layer on the pipeline.
    TRIM(JSON_VALUE(json_payload, '$[1]')) AS call_sign,
    JSON_VALUE(json_payload, '$[2]') AS origin_country,
    CAST(JSON_VALUE(json_payload, '$[5]') AS FLOAT64) AS longitude,
    CAST(JSON_VALUE(json_payload, '$[6]') AS FLOAT64) AS latitude,
    CAST(JSON_VALUE(json_payload, '$[7]') AS FLOAT64) AS baro_altitude,
    CAST(JSON_VALUE(json_payload, '$[8]') AS BOOL) AS on_ground,
    CAST(JSON_VALUE(json_payload, '$[9]') AS FLOAT64) AS velocity,
    CAST(JSON_VALUE(json_payload, '$[10]') AS FLOAT64) AS true_track

FROM raw_data
--Quality Filter: If flight_id is NULL then it will be discarted
WHERE JSON_VALUE(json_payload, '$[0]') IS NOT NULL