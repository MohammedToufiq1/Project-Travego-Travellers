
#1 a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END) as Female,
COUNT(CASE WHEN (Gender) = 'm' THEN 1 END) male 
FROM passenger WHERE Distance >=600;

select count(gender),gender from passenger 
where distance>600 
group by gender;

#2 b.	Find the minimum ticket price of a Sleeper Bus
select bus_type,min(price) from price 
where bus_type = 'sleeper';

#3 c.	Select passenger names whose names start with character 'S' 
select * from passenger
where passenger_name like 's%';

#4d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select a.passenger_name,a.boarding_city,a.Destination_City,a.bus_type,b.price from passenger as a
inner join price as b 
on a.distance=b.distance;

#5 e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
SELECT a.Passenger_name, a.Boarding_city, a.Destination_city, a.Bus_type, b.Price FROM passenger a
join price b 
WHERE a.Distance = 1000 and a.Bus_type = 'Sitting';

#6 f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT a.Passenger_name, a.Boarding_city, a.Destination_city, b.Bus_type, b.Price FROM passenger a
join price b
where passenger_name='pallavi' and a.distance = b.distance;
 
 #7g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
 SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;

#8 h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables 
SELECT Passenger_name, Distance *100/ (SELECT SUM(Distance) FROM passenger)as percentage_of_distance FROM passenger ;
