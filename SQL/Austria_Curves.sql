/*Norway 3 Curves */

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
 and CurveName like '%7Fields%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

--GTS norway  Gassco - it a daily curve so need need for summry - it will bring back the data a day late.

/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value

  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(102633642)
  --AND ValueDate > '2012-01-23 06:00:00.000'
  --AND ValueDate < '2014-10-04 06:00:00.000'
  --group by ValueDate
  order by ValueDate asc

  /* bring back each row */
 Select Datename(DAY,ValueDate)as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg

  FROM [PointConnect].[pointconnect].[CurveData] pcc
  where pcc.CurveId in(104209582

)
   group by ValueDate,value
  order by ValueDate asc



  --now by gas day - Summarised rows
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(109765764


)

 --AND ValueDate > '2010-03-05 06:00:00.000'
 -- AND ValueDate < '2014-10-10 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))


select curveid,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(102633642

)
 --AND ValueDate > '2008-12-31 06:00:00.000'
 --AND ValueDate < '2009-01-04 06:00:00.000'
group by curveid,convert(date,dateadd(HH,-6,valueDate))
order by curveid

  --Query to pull back individual curve data rows - sumarising by 1 row/day data - moved date out by 24 hours
  Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909)as McM_avg
  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(102633642)
  --and ValueDate > '2017-04-08 06:00:00.000'
   --AND ValueDate > '2009-01-01 06:00:00.000'
  -- and ValueDate > '2017-03-27 06:00:00.000'
--   and ValueDate > '2012-01-05 06:00:00.000'
  group by CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909)as McM_avg
  order by ValueDate asc

--SELECT top 10  * 
select *
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%')
  and CurveName like '%;;EXIT MURFELD%'
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
				where curveid = 110697149

)



/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(106588442,106588443
   
  )
  --AND ValueDate > '2012-01-23 06:00:00.000'
  -- AND ValueDate > '2014-10-03 06:00:00.000'
 -- AND ValueDate < '2014-10-04 06:00:00.000'
  --group by value
  order by value ,ValueDate asc

  --now by gas day - Summarised rows
select  CurveId,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(102633642


)
--AND ValueDate > '2017-06-01 06:00:00.000'
--AND ValueDate < '2017-08-23 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate)),curveid




--now by gas day - Actual query -
select curveId,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ KwH],(sum(value)*0.0000000909)as Mcm
--AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(110696898
)
 --AND ValueDate > '2013-03-12 06:00:00.000'
-- AND ValueDate <'2013-03-17 06:00:00.000'
GROUP BY CurveId,convert(date,dateadd(HH,-6,valueDate))
order by convert(date,dateadd(HH,-6,valueDate))




 -- To summarise for a Gas day where the curve has multiple rows – I.E 5 minutes, Hourly etc.
/*Summarise A gas day - various calculations to use or ignore! */
/*Only use if curve has more than one row per gas day - as the date will come back a day difference I.E 1/8/2016 wil show as 2/8/2016 */
SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],
(AVG(value*-1)*0.0000000909)as [McM_avg],(Value*0.0000000909) as[ McM],(value/0.0000000909)as Kwhs,
(value *0.093) as [GwH to McM],(value /0.093) as [GwH to KwH]
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(109706469)
GROUP BY convert(date,dateadd(HH,-6,valueDate)),value
ORDER BY Gas_Day







/* Few curves are bring back multiple rows - fix(not for everything use temp table fix below if this fails */
--Also useful when Eclipse is gas day starts at midnight and point curve is 6am

SELECT convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],convert(date,dateadd(HH,-8,ValueDateUtc)) as [Gas_Day2],
COUNT(valueDate) as [Count],sum(value)as[KWH],CurveId
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(110697149


)
AND ValueDate >'2012-03-01 00:00:00.000'
AND ValueDate <'2012-04-03 00:00:00.000'
GROUP BY convert(date,dateadd(HH,-6,valueDate)),convert(date,dateadd(HH,-8,ValueDateUtc)),value,CurveId
ORDER BY Gas_Day



select * from [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(106709295)
AND ValueDate ='2015-10-02 00:00:00.000'



Query to return already summarised data – but convert to McM
/*Use this query for Curves where it is already summarised - I.E oe row per Gas Day. */
  --Query to pull back individual curve data rows - summarising by 1 row/day data - moved date out by 24 hours
  --Also useful query for returning every row - which can then be put into Excel and worked out if data is gas day or 24 hours

  SELECT CurveDataId,CurveId,ValueDate,Value as [KwH],
  (value*-1)*0.0000000909 as [McM],
  (value /0.0093) as [GwH to KwH]
  FROM [PointConnect].[pointconnect].[CurveData]
  WHERE CurveId in(110696898)
  AND ValueDate >'2012-03-01 00:00:00.000'
  AND ValueDate <'2012-05-31 00:00:00.000'
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
WHERE CurveId in(102633642)
GROUP BY convert(date,dateadd(HH,-6,valueDate)),value
--ORDER BY Gas_Day
)select * into #Murfield from Summary


/* Use summarised - keep this for analysis
select Gas_Day,Sum(kwh)asKwh from #Murfield group by Gas_Day,kwh order by Gas_Day

select Gas_Day from #Murfield group by Gas_Day order by Gas_day */

drop table #Murfield

/*Summarised ! */
select distinct GAS_DAY,sum(KWH) as KwH from #Murfield
group by GAS_DAY
order by GAS_DAY


select * from #Murfield order by GAS_DAY

/* Use the following if data follows 24 hour clock. */


with Summary as (
SELECT ValueDate,
sum(value)as[KWH]
FROM [PointConnect].[pointconnect].[CurveData]
WHERE CurveId in(103932792)
GROUP BY ValueDate,value

)select * into #Murfield from Summary




select  convert(date,dateadd(HH,0,valueDate)) as not_gas_day,
sum(KWH) from #Murfield
group by convert(date,dateadd(HH,0,valueDate))
order by convert(date,dateadd(HH,0,valueDate))



drop table #Murfield