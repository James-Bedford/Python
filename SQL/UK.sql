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
 and CurveName like '%Aldbrough%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
order by pcc.CurveId

SELECT curveId,CONVERT(date,DATEADD(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],SUM(value)as[ KwH],(SUM(value)*0.0000000909)as McM
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(106768978
)
/*Date filter if you need them
 AND ValueDate > '2011-12-31 06:00:00.000'
 AND ValueDate <'2013-03-17 06:00:00.000'
*/
GROUP BY CurveId,CONVERT(date,DATEADD(HH,-6,valueDate))
ORDER by CONVERT(date,DATEADD(HH,-6,valueDate))

SELECT top 10  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where curveid in (104449815
))
