

 --curve name - Great for finding difficult curves!
   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%')
 and CurveName like '%Haidach%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

--GTS norway  Gassco - it a daily curve so need need for summry - it will bring back the data a day late.

/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value

  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(102633642)
  AND ValueDate > '2011-12-30 06:00:00.000'
  --AND ValueDate < '2014-10-04 06:00:00.000'
  --group by ValueDate
  order by ValueDate asc

  /* bring back each row  - also works for daily where gas day is not used by Eclipse. */
 Select Datename(DAY,ValueDate)as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg

  FROM [PointConnect].[pointconnect].[CurveData] pcc
  where pcc.CurveId in(103285659
)
    AND ValueDate > '2011-12-31 06:00:00.000'
   group by ValueDate,value
  order by ValueDate asc


  
  --now by gas day - Summarised rows - it can be a day out by eclipse.
  --by moving the hour back by 7 not six - realigns the two data providers.

select convert(date,dateadd(HH,-7,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103638815

)

 AND ValueDate > '2011-12-30 06:00:00.000'
 -- AND ValueDate < '2014-10-10 06:00:00.000'
group by convert(date,dateadd(HH,-7,valueDate))

--union query to match six and seven hour differences.
select convert(date,dateadd(HH,-7,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(110697149
)

 AND ValueDate > '2011-12-30 06:00:00.000'
 -- AND ValueDate < '2014-10-10 06:00:00.000'
group by convert(date,dateadd(HH,-7,valueDate))
union 
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(110697149
)

 AND ValueDate > '2011-12-30 06:00:00.000'
 -- AND ValueDate < '2014-10-10 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))




select curveid,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103926593

)
 AND ValueDate > '2011-12-31 06:00:00.000'
 --AND ValueDate < '2009-01-04 06:00:00.000'
group by curveid,convert(date,dateadd(HH,-6,valueDate))
order by curveid

  --Query to pull back individual curve data rows - sumarising by 1 row/day data - moved date out by 24 hours
  Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909)as McM_avg
  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(102432115
)
  --and ValueDate > '2017-04-08 06:00:00.000'
   --AND ValueDate > '2009-01-01 06:00:00.000'
  -- and ValueDate > '2017-03-27 06:00:00.000'
--   and ValueDate > '2012-01-05 06:00:00.000'


  group by CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate)as Year ,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909) as McM
  order by ValueDate asc

--SELECT top 10  * 
select pcc.CurveId
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%')
  and CurveName like '%LHSUM%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'



/*Return the curve metadata */
SELECT top 10  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where curveid in (103345064
))

/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(102235063

)
  --AND ValueDate > '2017-05-30 06:00:00.000'
  --AND ValueDate > '2017-06-02 06:00:00.000'
 -- AND ValueDate < '2014-10-04 06:00:00.000'
  --group by value
  order by ValueDate asc,value


/* bring back each row */
/*Use with care, can use a lot of db resource */ 
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(
  select pcc.CurveId
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%'
  and CurveName like '%Oude%'
  ))
  AND ValueDate > '2012-01-07 06:00:00.000'
  AND ValueDate < '2012-01-09 06:00:00.000'
  order by value,ValueDate asc


select * FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(102235063)


  --now by gas day - Summarised rows
select  CurveId,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103
)
AND ValueDate > '2011-12-31 06:00:00.000'
--AND ValueDate < '2017-08-23 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)),curveid

--now by gas day - Actual query - starts day at 6am
SELECT curveId,CONVERT(date,DATEADD(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],SUM(value)as[ KwH],(SUM(value)*0.0000000909)as McM
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(102235027
)
/*
Date filter if you need them */
 AND ValueDate > '2011-12-31 06:00:00.000'
/* AND ValueDate <'2017-03-17 06:00:00.000'
  */
GROUP BY CurveId,CONVERT(date,DATEADD(HH,-6,valueDate))
ORDER by CONVERT(date,DATEADD(HH,-6,valueDate))

-- work out if a range of day exists unbroken or not


--create temp calendar table then compare against this 

create Table #calendar(d DateTime, Primary Key (d))

drop Table #calendar

DECLARE @dIncr DATE = '2011-12-31'
DECLARE @dEnd DATE = '2017-07-10'
WHILE ( @dIncr < @dEnd )
BEGIN
	INSERT INTO #calendar (d) values( @dIncr)
	SELECT @dIncr = DATEADD(DAY,1,@dIncr)
END



--Returns only rows not in [PointConnect].[pointconnect].[CurveData]
SELECT CONVERT(DATE, d,101)
FROM #CALENDAR
where d >'2011-12-31'
and d < '2017-07-10'
EXCEPT
SELECT CONVERT(DATE,ValueDate,101)
FROM [PointConnect].[pointconnect].[CurveData]
where CurveId in(103638810)
ORDER BY CONVERT(DATE, d,101)



 -- To summarise for a Gas day where the curve has multiple rows – I.E 5 minutes, Hourly etc.
/*Summarise A gas day - various calculations to use or ignore! */
/*Only use if curve has more than one row per gas day - as the date will come back a day difference I.E 1/8/2016 wil show as 2/8/2016 */
SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],
(AVG(value*-1)*0.0000000909)as [McM_avg],(Value*0.0000000909) as[ McM],(value/0.0000000909)as Kwhs,
(value *0.093) as [GwH to McM],(value /0.093) as [GwH to KwH]
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(104879091)
 AND ValueDate > '2011-12-31 06:00:00.000'
GROUP BY convert(date,dateadd(HH,-6,valueDate)),value
ORDER BY Gas_Day



/* Few curves are bring back multiple rows - fix(not for everything use temp table fix below if this fails */
--Also useful when Eclipse is gas day starts at midnight and point curve is 6am

SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],convert(date,dateadd(HH,-8,ValueDateUtc)) as [Gas_Day2],
COUNT(valueDate) as [Count],sum(value)as[KWH],CurveId
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(102235065
)
--AND ValueDate >'2012-03-01 00:00:00.000'
--AND ValueDate <'2012-04-03 00:00:00.000'
GROUP BY convert(date,dateadd(HH,-6,valueDate)),convert(date,dateadd(HH,-8,ValueDateUtc)),value,CurveId
ORDER BY Gas_Day



select * from [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(109765767)
AND ValueDate >'2016-10-29 00:00:00.000'
And ValueDate <'2016-11-06 00:00:00.000'


Query to return already summarised data – but convert to McM
/*Use this query for Curves where it is already summarised - I.E oe row per Gas Day. */
  --Query to pull back individual curve data rows - summarising by 1 row/day data - moved date out by 24 hours
  --Also useful query for returning every row - which can then be put into Excel and worked out if data is gas day or 24 hours
  --Important - useful also when Eclipse and Point curve seem to be out of sync by a day

  SELECT CurveDataId,CurveId,ValueDate,Value as [KwH],
  (value*-1)*0.0000000909 as [McM],
  (value /0.0093) as [GwH to KwH]
  FROM [PointConnect].[pointconnect].[CurveData]
  WHERE CurveId in(104879115)
  AND ValueDate >'2011-12-30 00:00:00.000'
  --AND ValueDate <'2012-05-31 00:00:00.000'
  GROUP BY curveid,ValueDate,value,CurveDataId
  ORDER BY ValueDate


/*Hardcore difficult stuff - where multi rows are comding from different file ids */

--Use this if data follows Gas day protocol
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
WHERE CurveId in(102235063)
GROUP BY convert(date,dateadd(HH,-6,valueDate)),value
--ORDER BY Gas_Day
)select * into #Murfield from Summary


/* Use summarised - keep this for analysis
select Gas_Day,Sum(kwh)asKwh from #Murfield group by Gas_Day,kwh order by Gas_Day

select Gas_Day from #Murfield group by Gas_Day order by Gas_day */

drop table #Murfield

/*Summarised ! */
select distinct GAS_DAY,sum(KWH) as KwH,SUM(KWH*0.0000000909) as[ McM]
 from #Murfield
group by GAS_DAY
order by GAS_DAY


select * from #Murfield order by GAS_DAY

/* Use the following if data follows 24 hour clock. */


with Summary as (
SELECT ValueDate,
sum(value)as[KWH]
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(102235065

)
GROUP BY ValueDate,value

)select * into #Murfield from Summary




select  convert(date,dateadd(HH,0,valueDate)) as not_gas_day,
sum(KWH) from #Murfield
group by convert(date,dateadd(HH,0,valueDate))
order by convert(date,dateadd(HH,0,valueDate))



drop table #Murfield


/*Stuarts Query */
/*Stassfurt*/
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697607,110697000,110696691	)
ORDER BY [ValueDate] ASC

--Haresfeld
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697564
,110697252,110697879)
ORDER BY [ValueDate] ASC

--Peckensen
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697376,110697869

,110697299
)
ORDER BY [ValueDate] ASC

---Uelsen
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697312,110697361,110696974
)ORDER BY [ValueDate] ASC


--Epe Trianel
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110696594,110696660,110696867
)ORDER BY [ValueDate] ASC

--Bierwang
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697288,110697149,110696898
)ORDER BY [ValueDate] ASC


--Breitbrunn
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697606,110697636,110697768
)ORDER BY [ValueDate] ASC

--Epe Uniper H-Gas

SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164367
,105164416
,105164401)ORDER BY [ValueDate] ASC

--Epe Uniper l-Gas
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164367
,105164416
,105164401)ORDER BY [ValueDate] ASC

--Uniper Energy Storage Eschenfelden
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164477
,105164566
,105164648)ORDER BY [ValueDate] ASC

--Etzel EGL
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164459,105164790
,105164647)ORDER BY [ValueDate] ASC

--HÃ¤hnlein

SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110699307,110699426
,110699302)ORDER BY [ValueDate] ASC

--Kraak
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110696835,110696821
,110697799)ORDER BY [ValueDate] ASC

--Krummhorn
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110696964,110696923
,110697285)ORDER BY [ValueDate] ASC

--Sandhausen
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164353,105164258
,105164473)ORDER BY [ValueDate] ASC

--Stockstadt
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110699341,110699427
,110699340)ORDER BY [ValueDate] ASC

--Bad Lauchstädt
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164518,105164851
,105164525)ORDER BY [ValueDate] ASC

--Bernburg

SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (105164627,105164653
,105164332)ORDER BY [ValueDate] ASC

--kirchheiligen
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110696849,110697711
,110696690)ORDER BY [ValueDate] ASC

--Etzel
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110696803,110697545
,110696938)ORDER BY [ValueDate] ASC

--Schmidhausen
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697646,110696610
,110696574)ORDER BY [ValueDate] ASC

--Jemgum Astora
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697523,110697657
,110697882)ORDER BY [ValueDate] ASC

--Inzenham-West
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697502,110697703
,110697677)ORDER BY [ValueDate] ASC

--Reckrod
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (104857849
,104857848)ORDER BY [ValueDate] ASC

--Katharina
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (107588029,107588032,107588030
)ORDER BY [ValueDate] ASC

--VNG Storage
SELECT CONCAT([CurveId], CAST([ValueDate] AS DATE)) AS [Combined],[CurveId],CAST([ValueDate] AS DATE) AS [ValueDate],[Value]*0.090909090909*1000 AS [Value_mcm_TWh],
[Value]*0.090909090909 AS [Value_mcm_GWh],[Value]     
FROM [PointConnect].[pointconnect].[CurveData] 
WHERE [CurveId] IN (110697754
,110696712
,110697393

)ORDER BY [ValueDate] ASC