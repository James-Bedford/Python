From  [REPORT].[FOTA_GASSCO_INSTANTANEOUS_FLOW_ALL_GASDAY]



SELECT 
d.[TIME_SERIES_ITEM_ID]
,d.[APPLIES_TO_DATE]
,d.[VALUE]
,[VALUE_MCM] = d.[Value]*a.[FACTOR]
FROM
(
-- =====================================================================
-- the history
SELECT 
[TIME_SERIES_ITEM_ID]
,[VALUE]
,[APPLIES_TO_DATE]
FROM [CODA].[CACHE].[FOTA_GASSCO_INSTANTANEOUS_FLOW_HISTORY_GASDAY]




UNION ALL
-- the new data
SELECT 
d.[TIME_SERIES_ITEM_ID]
,[VALUE] = AVG(d.[Value])
,[APPLIES_TO_DATE] = CASE
    WHEN DATEPART(HOUR, [DateApplicableAt])< 6 THEN DATEADD(DAY, -1, CAST([DateApplicableAt] AS DATE))
    ELSE CAST([DateApplicableAt] AS DATE) END


FROM
[CODA].[LINK].[FOTA_TIME_SERIES_DATA] d


GROUP BY
d.[TIME_SERIES_ITEM_ID]
,CASE WHEN DATEPART(HOUR, [DateApplicableAt])< 6 THEN DATEADD(DAY, -1, CAST([DateApplicableAt] AS DATE))
    ELSE CAST([DateApplicableAt] AS DATE) END
-- =====================================================================
) d


INNER JOIN
       (
       -- =====================================================================
       -- the attribution
       -- required for the ncm to scm conversion factor
       SELECT 
       [DATA_SOURCE]
       ,[TIME_SERIES_ITEM_ID]
       ,[MEASUREMENT_PLACE_ID]
       ,[NATIVE_MEASUREMENT_PLACE_NAME]
       ,[LOCATION]
       ,[GAS_TYPE]
       ,[NATIVE_UNIT]
       ,[UNIT]
       ,[FACTOR] = COALESCE([FACTOR], 1)
       FROM [CODA].[ATTR].[FOTA_GASSCO_INSTANTANEOUS_FLOW] a

       LEFT OUTER JOIN
              (
              SELECT * FROM
              [CODA].[UTILITY].[CONVERSION_FACTORS] 
              WHERE [CONVERSION_ID] = 13
              ) cf
              ON cf.[FROM_UNIT] = [UNIT]
       WHERE 
       a.[DATA_SOURCE] = 'GASSCO'
       -- =====================================================================   
       ) a
ON 
d.[TIME_SERIES_ITEM_ID] = a.[TIME_SERIES_ITEM_ID]










GO
