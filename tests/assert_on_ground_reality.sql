{{ config(severity = 'warn') }}
-- AT MOMENT OF TESTING ONLY 4 RESULTS FROM 16,500 RECORDS - Meaning this test is precise
SELECT flight_id, velocity, on_ground FROM {{ ref("silver_telemetria")}}
    WHERE velocity > 100 AND on_ground = true