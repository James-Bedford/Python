 --Curve_Finder.sql - Great for finding difficult curves!
 /* If you just wnat to search on a provider you can and /or 
 you want to look through the meta data for a key word you can do that too. */
   SELECT  * 
   FROM [PointConnect].[pointconnect].[Curve] pcc
   INNER JOIN  [PointConnect].[common].[BaseMetadata] pcm
   ON pcc.[CurveId] = pcm.[CurveId]
   AND pcc.CurveID in (
				SELECT DISTINCT curveid  
				FROM [PointConnect].[common].[BaseMetadata] pcm
				WHERE pcm.[Provider.is] like '%')
 AND CurveName like '%Sum_across%'
--and [Geography.to] like 'Norway'
--and [Facility.is] like 'Dornum'
ORDER BY pcc.CurveId


