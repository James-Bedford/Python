 
 /*Super sniffer finds values to match */
 --Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value 
select curveId,convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ KwH],(sum(value)*0.0000000909)as Mcm
--AVG(value*-1) as [Average]
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
  and CurveName like '%gs%'
  ))
  AND ValueDate > '2017-06-07 06:00:00.000'
  AND ValueDate < '2017-06-10 06:00:00.000'
 -- order by value,ValueDate asc
 GROUP BY CurveId,convert(date,dateadd(HH,-6,valueDate))
order by  sum(value),convert(date,dateadd(HH,-6,valueDate))


/*Super Sniffer2 - search out the calendar day curves */

select curveId,convert(date,dateadd(HH,0,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ KwH],(sum(value)*0.0000000909)as Mcm
--AVG(value*-1) as [Average]
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
  and CurveName like '%Aldbrough%'
  ))
  AND ValueDate > '2017-06-06 06:00:00.000'
  AND ValueDate < '2017-06-09 06:00:00.000'
 -- order by value,ValueDate asc
 GROUP BY CurveId,convert(date,dateadd(HH,0,valueDate))
order by sum(value),convert(date,dateadd(HH,0,valueDate))






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
 and CurveName like '%Greifswald%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

/*Return the curve metadata */
SELECT top 10  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where curveid in (103932789

))