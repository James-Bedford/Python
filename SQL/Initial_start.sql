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



  SELECT  *
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  order by ValueDate asc

  Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  --group by value
  order by ValueDate asc


  Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  Select * 
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  --and ValueDate < '2017-04-09 05:59:00.000'
  --group by DATEPART(HOUR, [ValueDate])--< 6 THEN DATEADD(DAY, -1, CAST([ValueDate] AS DATE)
  --group by CAST( ValueDate as DATE)
  GROUP BY CONVERT(CHAR(8),ValueDate,10)
  order by ValueDate asc

  --summarises but by 24 hours
  select count(convert(CHAR(10), valueDate, 103) ),convert(char(10), valueDate, 103),Sum(value)as Total
   FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
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



select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944796)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

--now by gas day - Actual query -Emden NGT
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944790)
 AND ValueDate > '2009-01-01 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))



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

/*Summarise A gas day - various calculations to use or ignore! */
/*Only use if curve has more than one row per gas day - as the date will come back a day difference I.E 1/8/2016 wil show as 2/8/2016 */
select curveid,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as [McM_avg],(Value*0.0000000909) as[ McM]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(
 107594855

)
 --AND ValueDate > '2017-02-20 06:00:00.000'
 --AND ValueDate < '2017-02-28 06:00:00.000'
group by curveid,convert(date,dateadd(HH,-6,valueDate)),value
order by curveid,Gas_Day



/*Use this query for Curves where it is already summarised - I.E oe row per Gas Day. */
  --Query to pull back individual curve data rows - sumarising by 1 row/day data - moved date out by 24 hours
  Select CurveDataId,CurveId,--Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  --DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,
  ValueDate,
  Value as [KwH],(AVG(value*-1)*0.0000000909)as [McM]
  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(107594855)
  --and ValueDate > '2017-04-08 06:00:00.000'
   --AND ValueDate > '2009-01-01 06:00:00.000'
  -- and ValueDate > '2017-03-27 06:00:00.000'
--   and ValueDate > '2012-01-05 06:00:00.000'

group by curveid,ValueDate,value,CurveDataId
order by ValueDate



--Use for non summarised data
 SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ KwH],(sum(value)*0.0000000909)as McM
--AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(104495494)
 --AND ValueDate > '2009-01-01 06:00:00.000'
GROUP BY convert(date,dateadd(HH,-6,valueDate))

--USE for already summarised data
 SELECT curveid,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
 COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as [McM_avg],(Value*0.0000000909) as[ McM]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(107594855)
 GROUP BY curveid,convert(date,dateadd(HH,-6,valueDate)),value
 ORDER BY curveid,Gas_Day



    SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like 'Open%')
 and CurveName like '%Dornum%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId


SELECT * FROM [PointConnect].[pointconnect].[Curve] pcc 
JOIN  [PointConnect].[common].[BaseMetadata] pcm 
ON  PCM.CURVEID = PCC.CurveId


/*Query whci fixes multiple rows coming back even after summarising */
with Summary as (

SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
--COUNT(valueDate) as [Count],
sum(value)as[KWH]
--AVG(value*-1) as [Average],
--(AVG(value*-1)*0.0000000909)as [McM_avg],
--(Value*0.0000000909) as[ McM],
--(value/0.0000000909)as Kwhs,
--(value *0.093) as [GwH to McM],(value /0.093) as [GwH to KwH]
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(106710176)
GROUP BY convert(date,dateadd(HH,-6,valueDate)),value
--ORDER BY Gas_Day
)select * into #Murfield from Summary

drop table #Murfield
select Gas_Day,Sum(kwh) from #Murfield group by Gas_Day,kwh order by Gas_Day

select Gas_Day from #Murfield group by Gas_Day order by Gas_day

/aggregates three rows
select gas_day,sum(KWH) from #Murfield where gas_day = '2015-10-02 00:00:00.000'
group by gas_day

select GAS_DAY,sum(KWH) from #Murfield
group by GAS_DAY
order by GAS_DAY
