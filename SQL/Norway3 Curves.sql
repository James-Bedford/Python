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
 and CurveName like 'Mur%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

--GTS norway  Gassco - it a daily curve so need need for summry - it will bring back the data a day late.

/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value

  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(107594855)
  --AND ValueDate > '2012-01-23 06:00:00.000'
  --AND ValueDate < '2014-10-04 06:00:00.000'
  --group by ValueDate
  order by ValueDate asc

  /* bring back each row */
 Select Datename(DAY,ValueDate)as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg

  FROM [PointConnect].[pointconnect].[CurveData] pcc
  where pcc.CurveId in(103638845)
   group by ValueDate,value
  order by ValueDate asc



  --now by gas day - Summarised rows
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(104879123
 )

 AND ValueDate > '2008-12-31 06:00:00.000'
 -- AND ValueDate < '2014-10-10 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))


select curveid,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(102231683
)
 --AND ValueDate > '2008-12-31 06:00:00.000'
 --AND ValueDate < '2009-01-04 06:00:00.000'
group by curveid,convert(date,dateadd(HH,-6,valueDate))
order by curveid






  --Query to pull back individual curve data rows - sumarising by 1 row/day data - moved date out by 24 hours
  Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909)as McM_avg
  FROM [PointConnect].[pointconnect].[CurveData]
  where CurveId in(102235090)
  --and ValueDate > '2017-04-08 06:00:00.000'
   --AND ValueDate > '2009-01-01 06:00:00.000'
  -- and ValueDate > '2017-03-27 06:00:00.000'
--   and ValueDate > '2012-01-05 06:00:00.000'
  group by CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,
  DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,(AVG(value*-1)*0.0000000909)as McM_avg
  order by ValueDate asc

SELECT top 10  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%')
  and CurveName like 'Mur%'
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
				where curveid = 104495494
)



/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(
    103169048,
103169056,
103169066,
103242891,
103312359,
103168537,
103169046,
103169054,
103169058,
103169064,
103168519,
103168525,
103168534,
103169044,
103169446,
103242889,
103367355,
103367371,
103367377,
103243069,
103367383,
103476149,
103574089,
103792220,
103169050,
103169052,
103169444,
103367369,
103792226,
103169060,
103169062,
103312269,
103367379,
103368116,
103168522,
103168528,
103168531,
103312357,
103367373,
103792228,
103927930,
103946258,
103946266,
103946280,
103792232,
103946236,
103946246,
103946252,
103367381,
103927926,
103946260,
103946268,
103946278,
103476151,
103927924,
103946238,
103946240,
103946248,
103792222,
103792224,
103792230,
103927904,
103927928,
103946244,
103946254,
103946270,
103946296,
103946282,
103946292,
103927907,
103946242,
103946272,
103946274,
103946250,
103946256,
103946290,
103946276,
103946294,
103946288
  
  
  )
  --AND ValueDate > '2012-01-23 06:00:00.000'
   AND ValueDate > '2014-10-03 06:00:00.000'
  AND ValueDate < '2014-10-04 06:00:00.000'
  --group by value
  order by value ,ValueDate asc

  --now by gas day - Summarised rows
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(104495369)

 --AND ValueDate > '2014-10-01 06:00:00.000'
  --AND ValueDate < '2014-10-04 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))
