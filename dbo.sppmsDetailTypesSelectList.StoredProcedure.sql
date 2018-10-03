USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMS_DetailTypes].[DetailTypeID] ,
		[PMS_DetailTypes].[Description]  
  FROM [PMS_DetailTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DetailTypeID' THEN [PMS_DetailTypes].[DetailTypeID] END,
     CASE @OrderBy WHEN 'DetailTypeID DESC' THEN [PMS_DetailTypes].[DetailTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_DetailTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_DetailTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
