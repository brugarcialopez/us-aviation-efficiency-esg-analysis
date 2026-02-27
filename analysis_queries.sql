-- =================================================================================
-- PROJECT: U.S. Aviation Operational Efficiency & ESG Analysis (2015)
-- DATABASE: flight_traffic_mockcase
-- DESCRIPTION: Data transformation from raw tables (airlines, airports, flights) 
--              to calculate operational KPIs and carbon footprint.
-- =================================================================================

-----------------------------------------------------------------------------------
-- STEP 1: Data Cleaning and Integration
-- Joining raw tables to create a comprehensive dataset for analysis.
-----------------------------------------------------------------------------------

SELECT 
    f.AIRLINE as airline_code,
    al.AIRLINE as airline_name,
    f.ORIGIN_AIRPORT as airport_iata_code,
    ap.AIRPORT as airport_name,
    ap.CITY,
    ap.STATE,
    
    -- Operational Metric: Total volume of operations
    COUNT(*) as total_flights_2015,
    
    -- Efficiency Metric: Average Taxi-Out time (minutes)
    ROUND(AVG(f.TAXI_OUT), 2) as avg_taxiout,
    
    -- ESG Metric: Estimated CO2 Emissions (Kg)
    -- Using a standard factor based on ground time and fuel burn
    ROUND(SUM(f.TAXI_OUT * 2.5), 2) as total_kg_co2,
    
    -- Financial Metric: Estimated Average Cost of Delay (USD)
    -- Calculated based on departure delay minutes
    ROUND(SUM(f.DEPARTURE_DELAY * 75.0), 2) as total_delay_cost

FROM 
    `mock-case-2.flight_traffic_mockcase.flights` as f
INNER JOIN 
    `mock-case-2.flight_traffic_mockcase.airlines` as al 
    ON f.AIRLINE = al.IATA_CODE
INNER JOIN 
    `mock-case-2.flight_traffic_mockcase.airports` as ap 
    ON f.ORIGIN_AIRPORT = ap.IATA_CODE

WHERE 
    f.CANCELLED = 0 
    AND f.DIVERTED = 0
    AND f.TAXI_OUT IS NOT NULL -- Ensuring data quality for efficiency metrics

GROUP BY 
    1, 2, 3, 4, 5, 6

HAVING 
    total_flights_2015 > 50 -- Filtering out low-traffic routes for statistical relevance

ORDER BY 
    avg_taxiout DESC;

-----------------------------------------------------------------------------------
-- STEP 2: Validation Query (Optional)
-- Quick check for Airline-level ESG concentration (Treemap data)
-----------------------------------------------------------------------------------

SELECT 
    al.AIRLINE as airline_name,
    SUM(f.TAXI_OUT * 2.5) as total_co2_kg,
    SUM(f.DEPARTURE_DELAY * 75.0) as financial_impact_usd
FROM 
    `mock-case-2.flight_traffic_mockcase.flights` as f
JOIN 
    `mock-case-2.flight_traffic_mockcase.airlines` as al ON f.AIRLINE = al.IATA_CODE
WHERE 
    f.CANCELLED = 0
GROUP BY 
    1
ORDER BY 
    total_co2_kg DESC;
