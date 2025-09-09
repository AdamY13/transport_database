SELECT RouteName, MAX(NoOfStops) AS NoOfStops
FROM ROUTE r
GROUP BY r.RouteName
ORDER BY NoOfStops DESC
LIMIT 1;

CREATE VIEW ElectricBuses
AS SELECT *
   FROM BUS
   WHERE FuelType = 'Electric';
   
SELECT RouteName
FROM ROUTE, ElectricBuses
WHERE RouteID = R_ID;


SELECT DISTINCT h1.SName
FROM HAS h1, HAS h2
WHERE h1.SName = h2.SName AND h1.RID != h2.RID;

SELECT FuelType, SUM(SeatCapacity)
FROM BUS
GROUP BY FuelType;

SELECT StopName
FROM BUS_STOP
WHERE StopName NOT IN ( SELECT SName
                        FROM HAS );