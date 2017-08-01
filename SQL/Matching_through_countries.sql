--The hunt for matchign PC to Eclipse
 SELECT DISTINCT TOP 1000 * FROM [PointConnect].[common].[BaseMetadata] pcm 

 SELECT DISTINCT TOP 1000 [Geography.is], [GEOGRAPHY.to]  
  FROM [PointConnect].[common].[BaseMetadata] pcm 
  group by [Geography.is],[GEOGRAPHY.to] 
  order by  [Geography.is],[GEOGRAPHY.to] 


  --France to Norway 
  select DISTINCT TOP 1000 *
  FROM [PointConnect].[common].[BaseMetadata] pcm
  WHERE  [Geography.is] like 'United Kingdom'
  AND [GEOGRAPHY.to] like 'Norway' 


  --Also search on Provider.is 
  select distinct top 1000  *
  FROM [PointConnect].[common].[BaseMetadata] pcm
  where pcm.[Provider.is] like 'GASSCO%'

  --Issue.Frequency.is like 'Daily'

  --Get the curve information
   SELECT TOP 100 * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (103944788,
103944790,
103944791,
103944792,
103944793,
103944794,
103944795,
103944796,
104449208,
104449209,
104449210,
104818602,
104818755,
107114830,
107213371)

 /*  AND pcc.CurveId in (SELECT CurveId 
  FROM [PointConnect].[common].[BaseMetadata] pcm
  WHERE  [Geography.is] like 'France'
  AND [GEOGRAPHY.to] like 'Norway') */



   --Curve data now required
select * from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId = 102231765
--and pfc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
--and pfc.CurveId in 
--(102231767)
/*102231768,
102231774,
102231765,
102231766) */
and ValueDate >'2017-06-03 23:59'
and ValueDate <'2017-06-07 00:00'

--Get latest price - supplier
select * from [PointConnect].[pointconnect].[Flow_Staging] pc
inner join [PointConnect].[pointconnect].[FileCurve] pfc on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId in( 103944788,107213371,103944791,103944792,103944793,103944794)
and ValueDate = (select  Max(ValueDate)
 from [PointConnect].[pointconnect].[Flow_Staging]pc inner join [PointConnect].[pointconnect].[FileCurve] pfc
 on pfc.FileCurveId= pc.FileCurveId
and pfc.CurveId = 103944788
 )



--and pfc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
--and pfc.CurveId in 
--(102231767)
/*102231768,
102231774,
102231765,
102231766) */
and ValueDate >'2017-06-03 23:59'
and ValueDate <'2017-06-07 00:00'





--Combined but slow
  SELECT TOP 100 * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId = 103333262
   AND pcc.CurveId in (SELECT CurveId 
  FROM [PointConnect].[common].[BaseMetadata] pcm
  WHERE  [Geography.is] like 'France'
  AND [GEOGRAPHY.to] like 'Norway')

  --investigating which of the [PointConnect].[pointconnect].[Flow_Staging] is correct
  select top 10 * from [PointConnect].[pointconnect].FileCurve
  where fileid = 35290