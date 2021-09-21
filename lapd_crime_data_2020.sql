--SELECT AREA_NAME, COUNT(DR_NO) total_crime_reports
--FROM dbo.Crime_Data_from_2020_to_Present
--GROUP BY AREA_NAME
--ORDER BY total_crime_reports DESC;

-- Count of each crime, grouped by description (greatest to least)
-- Top 5 77th Street Div: Stolen Vehicle, Assault w/ deadly weapon, Battery, Domestic Violence, Robbery
--SELECT [Crm_Cd_Desc],  COUNT([Crm_Cd_Desc]) total_per_crime
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE AREA_NAME = '77th Street'
--GROUP BY [Crm_Cd_Desc]
--ORDER BY total_per_crime DESC

-- Top 5 Crime in Pacfic Div: Stolen Veh, Burg, Petty Theft, Vehicle Burg, Battery
--SELECT [Crm_Cd_Desc],  COUNT([Crm_Cd_Desc]) total_per_crime
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE AREA_NAME = 'Pacific'
--GROUP BY [Crm_Cd_Desc]
--ORDER BY total_per_crime DESC

-- Homicides by division; 77th Street (93), Southeast (80), Newton (60), Hollenbeck (55), Central (40)
-- West LA, Devonshire < 10
--SELECT AREA_NAME, COUNT([Crm_Cd_Desc]) total_homicides
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE'
--GROUP By AREA_NAME
--ORDER BY total_homicides DESC

-- LAPD Homicides Jan. 2020 to Sept 2021: 627
--SELECT COUNT([Crm_Cd_Desc]) total_homicides_lapd
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE'

-- LAPD Homicides Sept 2020 to Sep 2021: 357
--SELECT COUNT([Crm_Cd_Desc]) total_homicides_lapd
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE' AND [Date_Rptd] BETWEEN '2020-01-09' AND  '2021-01-09'

-- LAPD Homicides Jan 2020 to Jan  2021: 347
--SELECT COUNT([Crm_Cd_Desc]) total_homicides_lapd
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE' AND [Date_Rptd] BETWEEN '2020-01-01' AND  '2021-01-01'

-- LAPD Homicides 2021 to Sept 15: 281
--SELECT COUNT([Crm_Cd_Desc]) total_homicides_lapd
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE' AND [Date_Rptd] LIKE '2021-%'

-- Date range: Jan. 01, 2020 through Sept 13, 2021
--SELECT DISTINCT([Date_Rptd])
--FROM dbo.Crime_Data_from_2020_to_Present
--ORDER BY [Date_Rptd] ASC

-- LAPD, all crimes in each division, sorted from greatest to least
-- TOP 6 (20,000 or more): Stolen Vehicle, Battery, Vandalism, Veh. Burg, Burglary, Assault w DW
--SELECT [Crm_Cd_Desc], COUNT([Crm_Cd_Desc]) crime_desc
--FROM dbo.Crime_Data_from_2020_to_Present
--GROUP BY [Crm_Cd_Desc]
--ORDER BY crime_desc DESC

-- 29yo (17), 36yo (15), 31, 35, 27, 24yo (12), 26, 30yo (10)
--SELECT Vict_Age, COUNT(Vict_Age) total_by_age,
--	SUM(CASE WHEN Vict_Sex = 'M' THEN 1 else 0 END ) AS males_by_age,
--	SUM(CASE WHEN Vict_Sex = 'F' THEN 1 else 0 END ) AS females_by_age,
--	SUM(CASE WHEN Vict_Sex = 'X' THEN 1 WHEN Vict_Sex IS NULL THEN 1 ELSE NULL END) AS gender_not_recorded
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE' AND [Date_Rptd] LIKE '2021-%'
--GROUP BY Vict_Age
--ORDER BY total_by_age DESC

-- One 54yo killed and one 34yo killed, age and sex not given; instead marked with 'X'
--SELECT *
--FROM dbo.Crime_Data_from_2020_to_Present
--WHERE [Crm_Cd_Desc] = 'CRIMINAL HOMICIDE' AND [Date_Rptd] LIKE '2021-%' AND Vict_Age = '54'

--Descent Code: 
--A - Other Asian (7,169)
--B - Black (48,166)
--C - Chinese 
--D - Cambodian 
--F - Filipino 
--G - Guamanian 
--H - Hispanic/Latin/Mexican (103,037)
--I - American Indian/Alaskan Native 
--J - Japanese 
--K - Korean 
--L - Laotian 
--O - Other (26,669)
--P - Pacific Islander 
--S - Samoan 
--U - Hawaiian 
--V - Vietnamese 
--W - White (70,866)
--X - Unknown 
--Z - Asian Indian
SELECT
SUM(
CASE 
	WHEN Vict_Descent = 'A' THEN 1
	ELSE 0
END) AS 'Other Asian',
SUM(CASE
	WHEN Vict_Descent = 'B' THEN 1
	ELSE 0
END) AS 'Black',
SUM(
CASE
	WHEN Vict_Descent = 'C' THEN 1
	ELSE 0
END) AS 'Chinese',
SUM(
CASE
	WHEN Vict_Descent = 'D' THEN 1
	ELSE 0
END) AS 'Cambodian',
SUM(
CASE
	WHEN Vict_Descent = 'F' THEN 1
	ELSE 0
END) AS 'Filipino',
SUM(
CASE
	WHEN Vict_Descent = 'G' THEN 1
	ELSE 0
END) AS 'Guamanian',
SUM(
CASE
	WHEN Vict_Descent = 'H' THEN 1
	ELSE 0
END) AS 'Hispanic/Latin/Mexican',
SUM(
CASE
	WHEN Vict_Descent = 'I' THEN 1
	ELSE 0
END) AS 'American Indian/Alaskan Native',
SUM(
CASE 
	WHEN Vict_Descent = 'J' THEN 1
	ELSE 0
END) AS 'Japenese',
SUM(
CASE
	WHEN Vict_Descent = 'K' THEN 1
	ELSE 0
END) AS 'Korean',
SUM(
CASE
	WHEN Vict_Descent = 'L' THEN 1
	ELSE 0
END) AS 'Laotian',
SUM(
CASE
	WHEN Vict_Descent = 'O' THEN 1
	ELSE 0
END) AS 'Other',
SUM(
CASE
	WHEN Vict_Descent = 'P' THEN 1
	ELSE 0
END) AS 'Pacific Islander',
SUM(
CASE
	WHEN Vict_Descent = 'S' THEN 1
	ELSE 0
END) AS 'Samoan',
SUM(
CASE
	WHEN Vict_Descent = 'S' THEN 1
	ELSE 0
END) AS 'Samoan',
SUM(
CASE
	WHEN Vict_Descent = 'U' THEN 1
	ELSE 0
END) AS 'Hawaiian',
SUM(
CASE
	WHEN Vict_Descent = 'V' THEN 1
	ELSE 0
END) AS 'Vietnamese',
SUM(
CASE
	WHEN Vict_Descent = 'W' THEN 1
	ELSE 0
END) AS 'White',
SUM(
CASE
	WHEN Vict_Descent = 'U' THEN 1
	ELSE 0
END) AS 'Unknown',
SUM(
CASE
	WHEN Vict_Descent = 'Z' THEN 1
	ELSE 0
END) AS 'Asian Indian'
FROM dbo.Crime_Data_from_2020_to_Present

-- TOP TIME_OCC: 1200 (12005), 1800, 1700, 2000, 1900 (less than 10,000)
-- Many rows have incoherent data (one to three digits)
--SELECT TIME_OCC, COUNT(TIME_OCC) time_occurred
--FROM dbo.Crime_Data_from_2020_to_Present
--GROUP BY TIME_OCC
--ORDER BY time_occurred DESC