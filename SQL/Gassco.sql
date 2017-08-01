 --Also search on Provider.is 
 --List of suppliers
 select distinct top 1000   pcm.[Provider.is]
  FROM [PointConnect].[common].[BaseMetadata] pcm
  order by  pcm.[Provider.is]


  select distinct top 1000  *
  FROM [PointConnect].[common].[BaseMetadata] pcm
  where pcm.[Provider.is] like 'Fluxy%'
  and pcm.[Geography.to] !='NULL'

  --curve name -
   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like 'Fluxy%')
and CurveName like '%ZPT%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'


/* Actual query used */

--Get latest price - supplier where price every five minutes -288 rows in 24 hours
SELECT distinct pc.[FlowDataRowId],pc.[FileCurveId],pc.[ValueDate],pc.[ValueDateUtc],pc.[ForecastDate],pc.[ForecastDateUtc],pc.[Value],pc.[TimestampRowId],pfc.CurveId
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(103944792
)
WHERE ValueDate between '2017-06-05 06:00' and '2017-06-06 05:59'
--where ValueDate >'2017-06-05 06:00'
--and ValueDate <'2017-06-07 05:59'
--and DATEPART(HOUR, [ValueDate])< 6 THEN DATEADD(DAY, -1, CAST([ValueDate] AS DATE))
--and datepart(HOUR,ValueDate)>5
--and  datepart(HOUR,ValueDate)<
order by ForecastDate

--One rows returns!
select  distinct CAST (CAST(pc.[ValueDate] AS char(11)) as datetime)
--CAST(FLOOR(CAST(@date as FLOAT)) as DateTime);
--into #Gassco
--WHEN 
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(103944788
)
where ValueDate >'2017-06-05 23:59'
and ValueDate <'2017-06-07 00:00'
order by ForecastDate


		
