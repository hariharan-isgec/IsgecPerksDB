USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_D_Lodging].[SerialNo] ,
		[TA_D_Lodging].[CategoryID] ,
		[TA_D_Lodging].[CityTypeID] ,
		[TA_D_Lodging].[LodgingAmount] ,
		[TA_D_Lodging].[FromDate] ,
		[TA_D_Lodging].[TillDate] ,
		[TA_D_Lodging].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_CityTypes2].[CityTypeName] AS TA_CityTypes2_CityTypeName 
  FROM [TA_D_Lodging] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Lodging].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_D_Lodging].[CityTypeID] = [TA_CityTypes2].[CityTypeID]
  WHERE
  [TA_D_Lodging].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_Lodging].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_Lodging].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_Lodging].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_Lodging].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_D_Lodging].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_D_Lodging].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'LodgingAmount' THEN [TA_D_Lodging].[LodgingAmount] END,
     CASE @OrderBy WHEN 'LodgingAmount DESC' THEN [TA_D_Lodging].[LodgingAmount] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_Lodging].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_Lodging].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_Lodging].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_Lodging].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_Lodging].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_Lodging].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName' THEN [TA_CityTypes2].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName DESC' THEN [TA_CityTypes2].[CityTypeName] END DESC 
  SET @RecordCount = @@RowCount
GO
