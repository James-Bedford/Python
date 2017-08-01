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


--Get latest price - supplier but two rows come back
SELECT distinct pc.[FlowDataRowId],pc.[FileCurveId],pc.[ValueDate],pc.[ValueDateUtc],pc.[ForecastDate],pc.[ForecastDateUtc],pc.[Value],pc.[TimestampRowId],pfc.CurveId
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(104101846

)
and ValueDate <getdate()
and ValueDate >getdate()-2
order by ForecastDate

--this works but curve id needed
select * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2
and FileCurveId = 28315
and TimestampRowId =( select max(TimestampRowId) from [PointConnect].[pointconnect].[Flow_Staging] pc where  FileCurveId = 28315)

--one correct row back
select distinct * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2
and TimestampRowId =( select distinct max(TimestampRowId)
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(104101846))
and  FileCurveId =(select distinct pfc.FileCurveId from [PointConnect].[pointconnect].[FileCurve] pfc
inner join  [PointConnect].[pointconnect].[Flow_Staging] pc on pc.FileCurveId= pfc.FileCurveId
and  pfc.CurveId in(104101846))

--one correct row back
select distinct * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2

and TimestampRowId =( select distinct max(TimestampRowId)
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(103309077))
and  FileCurveId =(select distinct pfc.FileCurveId from [PointConnect].[pointconnect].[FileCurve] pfc
inner join  [PointConnect].[pointconnect].[Flow_Staging] pc on pc.FileCurveId= pfc.FileCurveId
and  pfc.CurveId in(103309077))


--Fluxy also has hourly prices
--Get latest price - supplier where price every five minutes -288 rows in 24 hours
SELECT distinct pc.[FlowDataRowId],pc.[FileCurveId],pc.[ValueDate],pc.[ValueDateUtc],pc.[ForecastDate],pc.[ForecastDateUtc],pc.[Value],pc.[TimestampRowId],pfc.CurveId
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(103309077
)
WHERE ValueDate between '2017-06-06 05:00' and '2017-06-08 05:59'
--where ValueDate >'2017-06-05 06:00'
--and ValueDate <'2017-06-07 05:59'
--and DATEPART(HOUR, [ValueDate])< 6 THEN DATEADD(DAY, -1, CAST([ValueDate] AS DATE))
--and datepart(HOUR,ValueDate)>5
--and  datepart(HOUR,ValueDate)<
order by ForecastDate

