CREATE VIEW q2_view AS
SELECT Boat.Boat_name, Sailor_name, Boat_color
FROM Boat INNER JOIN Reserve 
ON Boat.Boat_name = Reserve.Boat_name;