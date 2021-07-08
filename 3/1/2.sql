ALTER TABLE persons
ADD Phone nvarchar(13)
CONSTRAINT PhonePrefix CHECK(Phone LIKE '001%');

UPDATE persons
SET Phone = '0012415634567'
WHERE P_Id = 1;

UPDATE persons
SET Phone = '0018842962813'
WHERE P_Id = 2;

UPDATE persons
SET Phone = '0014447725674'
WHERE P_Id = 3;

UPDATE persons
SET Phone = '0018539642367'
WHERE P_Id = 4;
