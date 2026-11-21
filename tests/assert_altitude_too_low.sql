{{ config(severity = 'warn') }}

-- There are some airports that might be under the 0 level as for their geography. Tolerance is 250-300
SELECT flight_id, baro_altitude, on_ground FROM {{ ref("silver_telemetria")}} 
    WHERE baro_altitude < -300