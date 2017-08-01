SELECT 
pcc.curveid,
pcc.CurveName,
pcm.[Geography.to],
pcm.[Geography.from],
pcm.[Unit.is],
pcm.[issue.Frequency.is],
pcm.[status.is],
pcm.[provider.is]
FROM [PointConnect].[common].[BaseMetadata] pcm 
INNER JOIN [PointConnect].[pointconnect].[Curve] pcc 
ON pcc.[CurveId] = pcm.[CurveId]
  where 
  pcm.curveid = 103309077

--Use to get all curve information - used in Curve database
  SELECT * FROM [PointConnect].[common].[BaseMetadata] pcm 
INNER JOIN [PointConnect].[pointconnect].[Curve] pcc 
ON pcc.[CurveId] = pcm.[CurveId]
order by pcc.[CurveId]

  SELECT  *
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  order by ValueDate asc

  --Query to pull back individual curve data rows
  Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944790)
  --and ValueDate > '2017-04-08 06:00:00.000'
   --AND ValueDate > '2009-01-01 06:00:00.000'
  -- and ValueDate > '2017-03-27 06:00:00.000'
   and ValueDate > '2012-01-05 06:00:00.000'
  --group by value
  order by ValueDate asc


 

  --summarises but by 24 hours
  select count(convert(CHAR(10), valueDate, 103) ),convert(char(10), valueDate, 103),Sum(value)as Total
   FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944791)
  and ValueDate > '2017-04-08 05:00:00.000'

  GROUP BY CONVERT(CHAR(10),valueDate,103)
  ORDER BY CONVERT(CHAR(10),valueDate,103)

  --need Gas Day summary
 SELECT CAST(valueDate as date) as Start,datepart(hour,valuedate) as onhour,count(*) as totals
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  GROUP BY CAST (ValueDate as date),DATEPART(hour,ValueDate)
 
 --summary by hour
 SELECT  CAST(valueDate as DATE) as 'StartDate', 
        CAST(DATEPART(Hour, valueDate) as varchar) + ':59' as 'Hour', 
        COUNT(*) as 'Ct',sum(value)
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2017-04-08 05:00:00.000'
GROUP BY CAST(valueDate as DATE), DATEPART(Hour, valueDate)
ORDER BY CAST(valueDate as DATE) ASC

/*The folowing queries summarise on a gas day and provide average. */

--now by gas day - Actual query -ZPT
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

--now by gas day - Actual query -Dunkerque
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944791)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

--now by gas day - Actual query -Dornum
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944788)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

--now by gas day - Actual query -Emden
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(107213371)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))


--now by gas day - Actual query -Emden EPT(EMS)
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944796)
 AND ValueDate > '2009-01-04 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

--now by gas day - Actual query -Emden NGT
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944790)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 

--now by gas day - Actual query -Easington
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944793)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 

--now by gas day - Actual query -St Fergus Total
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944794)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 

--now by gas day - Actual query -St Fergus Shell
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944795)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 

--now by gas day - Actual query -Emden
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(107114830)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 

--now by gas day - Actual query
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(104868921)
 AND ValueDate > '2017-05-08 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)) 



SELECT CONVERT(DATEPART(HOUR, [DateApplicableAt])< 6 THEN DATEADD(DAY, -1, CAST([DateApplicableAt] AS DATE))




SELECT c.[CurveId], c.[CurveName], c.[TimezoneId], tfi.*
FROM [Fundalytics].[ATTR].[TSO_FLOW_ITEM] tfi 
       INNER JOIN [Fundalytics].[_CORE].[DATA_PROVIDER_MAPPING] dpm ON tfi.[CORE_DATUM_TYPE_ID] = dpm.[CORE_DATUM_TYPE_ID]
       INNER JOIN [PointConnect].[pointconnect].[Curve] c ON c.[CurveId] = dpm.[DATA_PROVIDER_ITEM_ID]
WHERE tfi.[DATA_SOURCE] = 'GASCADE' 


 
SELECT top 10 c.[CurveId], c.[CurveName], c.[TimezoneId], tfi.*
FROM [Fundalytics].[ATTR].[TSO_FLOW_ITEM] tfi 
       INNER JOIN [Fundalytics].[_CORE].[DATA_PROVIDER_MAPPING] dpm ON tfi.[CORE_DATUM_TYPE_ID] = dpm.[CORE_DATUM_TYPE_ID]
       INNER JOIN [PointConnect].[pointconnect].[Curve] c ON c.[CurveId] = dpm.[DATA_PROVIDER_ITEM_ID]
WHERE tfi.[DATA_SOURCE] = 'Elia' 

--providers 
select distinct  tfi.[DATA_SOURCE] from [Fundalytics].[ATTR].[TSO_FLOW_ITEM] tfi 

--connect to find energy allocation
select * from [PointConnect].[Flow_Staging] pc
inner join [pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId =  103944788
and ValueDate >'2017-06-04 23:59'
and ValueDate <'2017-06-06 00:00'

select sum(Value) from [PointConnect].[Flow_Staging] pc
inner join [pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId =  103944788
and ValueDate >'2017-06-04 23:59'
and ValueDate <'2017-06-06 00:00'

select min(ValueDate) from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId =  103944788

--report table info 
select top 10 * from [report].[CurveSearchTable] where curveid = 103944788


-- Read off netflows Work book 
SELECT TOP 1000 [CORE_DATUM_TYPE_ID]
      ,[DATA_ITEM_NAME]
      ,[DATA_SOURCE]
      ,[NATIVE_MEASUREMENT_PLACE_NAME]
      ,[NATIVE_MEASUREMENT_PLACE_ID]
      ,[MEASUREMENT_PLACE_ID]
      ,[NET_FLOW_PLACE_ID]
      ,[PLACE_VERSION_ID]
      ,[MEASUREMENT_PLACE_AGGREGATION]
      ,[LOCATION]
      ,[MEASUREMENT_TYPE]
      ,[MEASUREMENT_VERSION]
      ,[FIRMNESS]
      ,[CALORIFIC_VALUE]
      ,[NATIVE_DIRECTION_NAME]
      ,[NATIVE_DIRECTION]
      ,[MEASURE]
      ,[NATIVE_UNIT]
      ,[REPORT_PLACE_NAME]
      ,[REPORT_PLACE_VERSION]
      ,[FROM_COUNTRY]
      ,[TO_COUNTRY]
      ,[DATA_RESOLUTION]
      ,[LEADING_ZERO]
      ,[DATE_UPDATED]
  FROM [Fundalytics].[ATTR].[TSO_FLOW_ITEM]
 -- WHERE [CORE_DATUM_TYPE_ID] > 50000000
 -- AND [CORE_DATUM_TYPE_ID] = 50000075
  where FROM_COUNTRY = 'NORWAY'
  AND TO_COUNTRY = 'GERMANY'
  and FIRMNESS = 'TOTAL'
  and MEASUREMENT_TYPE = 'BORDER FLOW'
  and MEASUREMENT_VERSION = 'ACTUAL (FINAL)'
  and REPORT_PLACE_NAME = 'OGE - EMDEN EPT'


  SELECT TOP 1000 [DATA_PROVIDER_MAPPING_ID]
      ,[DATA_PROVIDER_ID]
      ,[DATA_PROVIDER_ITEM_ID]
      ,[CORE_DATUM_TYPE_ID]
      ,[MAPPING_START_DATETIME_UTC]
      ,[MAPPING_END_DATETIME_UTC]
      ,[LAST_DATA_PROVIDER_UPDATE_UTC]
      ,[AUDIT_DT]
      ,[ERROR_FLAG]
      ,[ERROR_DESCRIPTION]
      ,[ERROR_DATETIME_UTC]
      ,[KEEP_ALL_VERSIONS]
      ,[DATA_PROVIDER_TIME]
  FROM [Fundalytics].[_CORE].[DATA_PROVIDER_MAPPING]
  WHERE [CORE_DATUM_TYPE_ID] >=29027
  and  [CORE_DATUM_TYPE_ID]<= 29119
  29031
,29043
,29079
,29091
,29102
,29114)