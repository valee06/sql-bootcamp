DROP TABLE IF EXISTS path_cost;

CREATE TABLE path_cost (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INTEGER NOT NULL
);


INSERT INTO path_cost (point1, point2, cost) VALUES
    ('a', 'b', 10), ('b', 'a', 10),
    ('a', 'c', 15), ('c', 'a', 15),
    ('a', 'd', 20), ('d', 'a', 20),
    ('b', 'c', 35), ('c', 'b', 35),
    ('b', 'd', 25), ('d', 'b', 25),
    ('c', 'd', 30), ('d', 'c', 30);

WITH RECURSIVE tsp AS (
    SELECT 
        point1::VARCHAR AS path,
        point1,
        point2,
        cost,
        cost AS total_cost,
        1 AS depth
    FROM path_cost
    WHERE point1 = 'a'

    UNION ALL
    
    SELECT 
        tsp.path || ',' || pc.point1,
        pc.point1,
        pc.point2,
        pc.cost,
        tsp.total_cost + pc.cost AS total_cost,
        tsp.depth + 1
    FROM tsp
    JOIN path_cost pc ON tsp.point2 = pc.point1
    WHERE tsp.depth < 4
      AND pc.point2 != 'a'  
      AND tsp.path NOT LIKE '%' || pc.point1 || '%'
),
completed_trips AS (
    SELECT DISTINCT
        total_cost - tsp.cost + pc.cost AS total_cost,
        tsp.path || ',' || pc.point2 AS tour
    FROM tsp
    JOIN path_cost pc ON tsp.point1 = pc.point1
    WHERE tsp.depth = 4
      AND pc.point2 = 'a'
)

SELECT 
    total_cost,
    '{' || tour || '}' AS tour
FROM completed_trips
WHERE total_cost = (SELECT MIN(total_cost) FROM completed_trips)
ORDER BY total_cost, tour;