 --Also search on Provider.is 
 --List of suppliers
 select distinct top 1000   pcm.[Provider.is]
  FROM [PointConnect].[common].[BaseMetadata] pcm
  order by  pcm.[Provider.is]


  select distinct top 1000  *
  FROM [PointConnect].[common].[BaseMetadata] pcm
  where pcm.[Provider.is] like 'Fluxy%'
  and pcm.[Geography.to] !='NULL'

  --Pullback all the curves @31791 rows
  select *
  FROM [PointConnect].[common].[BaseMetadata] pcm


  --curve name - Great for finding difficult curves!
   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like 'Gas Transport Services%')
  and CurveName like '%EMDEN EPT%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'



--Get latest price - supplier
SELECT distinct pc.[FlowDataRowId],pc.[FileCurveId],pc.[ValueDate],pc.[ValueDateUtc],pc.[ForecastDate],pc.[ForecastDateUtc],pc.[Value],pc.[TimestampRowId],pfc.CurveId
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(102209683
)
and ValueDate <getdate()
and ValueDate >getdate()-2
order by ForecastDate

--this works but curve id needed
select * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2
and FileCurveId = 28245
and TimestampRowId =( select max(TimestampRowId) from [PointConnect].[pointconnect].[Flow_Staging] pc where  FileCurveId = 28245)

--one correct row back
select distinct * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2
and TimestampRowId =( select distinct max(TimestampRowId)
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(102209683))
and  FileCurveId =(select distinct pfc.FileCurveId from [PointConnect].[pointconnect].[FileCurve] pfc
inner join  [PointConnect].[pointconnect].[Flow_Staging] pc on pc.FileCurveId= pfc.FileCurveId
and  pfc.CurveId in(102209683))

--one correct row back
select distinct * from [PointConnect].[pointconnect].[Flow_Staging] pc
where ValueDate <getdate()
and ValueDate >getdate()-2
and TimestampRowId =( select distinct max(TimestampRowId)
from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in(102718173))
and  FileCurveId =(select distinct pfc.FileCurveId from [PointConnect].[pointconnect].[FileCurve] pfc
inner join  [PointConnect].[pointconnect].[Flow_Staging] pc on pc.FileCurveId= pfc.FileCurveId
and  pfc.CurveId in(102718173))

--two rows back !
select * from [PointConnect].[pointconnect].[FileCurve] pfc where  pfc.CurveId in(104868921)

select top 10 * from  [PointConnect].[pointconnect].[Flow_Staging] where FileCurveId = 29139

/* bring back each row */
 Select CurveDataId,CurveId,Datename(DAY,ValueDate),DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(107594855)
  AND ValueDate > '2012-01-23 06:00:00.000'
  --group by value
  order by ValueDate asc

  --now by gas day - Summarised rows
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[KWH],AVG(value*-1) as [Average]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(104495591)
 AND ValueDate > '2014-03-19 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))