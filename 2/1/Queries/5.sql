SELECT Boat_color
FROM Reserve JOIN Boat
ON Reserve.Boat_name = Boat.Boat_name
WHERE Weekday LIKE 's%';