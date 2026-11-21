{{ config(severity = 'warn') }} --Configuring a warning so query doesnt stop after test fails


-- Auditing Velocity for Conceptual Test -- Assertion for velocities nor cases out of the ordinary

SELECT flight_id, velocity, on_ground FROM {{ ref("silver_telemetria")}}
    WHERE velocity > 350 AND on_ground = false  -- 10 Results as of now which I will pass to audit later
