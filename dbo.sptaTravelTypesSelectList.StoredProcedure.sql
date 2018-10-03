USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_TravelTypes].[TravelTypeID] ,
		[TA_TravelTypes].[TravelTypeDescription]  
  FROM [TA_TravelTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'TravelTypeID' THEN [TA_TravelTypes].[TravelTypeID] END,
     CASE @OrderBy WHEN 'TravelTypeID DESC' THEN [TA_TravelTypes].[TravelTypeID] END DESC,
     CASE @OrderBy WHEN 'TravelTypeDescription' THEN [TA_TravelTypes].[TravelTypeDescription] END,
     CASE @OrderBy WHEN 'TravelTypeDescription DESC' THEN [TA_TravelTypes].[TravelTypeDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
