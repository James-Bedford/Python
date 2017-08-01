  
  /* use this query to return - new curves added - */
  
  /* Find dates since last update*/
	SELECT DISTINCT pcc.LastMetadataUpdateDateUtc
	FROM [PointConnect].[pointconnect].[Curve] pcc
	ORDER BY LastMetadataUpdateDateUtc DESC


   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID in (
				select distinct curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				where pcm.[Provider.is] like '%%')
 and CurveName like '%%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
and LastMetadataUpdateDateUtc > '2017-06-26 01:00:00.000'  -- change since last update
and LastMetadataProcessedDateUtc IS not NULL
order by pcc.CurveId

--Difference
 SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   --AND pcc.CurveId in( 102231768,102231766,102231765,102231767,102231774)
   and pcc.CurveID not in (
   SELECT  CurveId 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   WHERE LastMetadataUpdateDateUtc > '2017-06-26 01:00:00.000'  -- change since last update
   AND LastMetadataProcessedDateUtc IS not NULL
				)
 and CurveName like '%%'

order by pcc.CurveId


