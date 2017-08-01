/*Useful Sql */

 --curve name - Great for finding difficult curves! Just add a name or part of name and it will bring back the meta data rows which match plus the curve id
   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%')
 and CurveName like '%Energinet%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

/* bring back each row  - of curve data using the curve id*/
 Select Datename(DAY,ValueDate)as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,
 DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value,AVG(value*-1) as [Average],(AVG(value*-1)*0.0000000909)as McM_avg

  FROM [PointConnect].[pointconnect].[CurveData] pcc
  where pcc.CurveId in(103285659
)
    AND ValueDate > '2011-12-31 06:00:00.000'
   group by ValueDate,value
  order by ValueDate asc

/* Summarise - data to a single gas day value. */

--now by gas day - Actual query - starts day at 6am
SELECT curveId,CONVERT(date,DATEADD(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],SUM(value)as[ KwH],(SUM(value)*0.0000000909)as McM
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(106294989

)
/*
Date filter if you need them 
 AND ValueDate > '2011-12-31 06:00:00.000'
 AND ValueDate <'2017-08-01 06:00:00.000'
  */
GROUP BY CurveId,CONVERT(date,DATEADD(HH,-6,valueDate))
ORDER by CONVERT(date,DATEADD(HH,-6,valueDate))