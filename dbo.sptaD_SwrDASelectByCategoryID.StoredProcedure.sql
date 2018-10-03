USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_SwrDASelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_D_SwrDA].[SerialNo] ,
		[TA_D_SwrDA].[CategoryID] ,
		[TA_D_SwrDA].[CityTypeID] ,
		[TA_D_SwrDA].[HotelStayDA] ,
		[TA_D_SwrDA].[SwrDA] ,
		[TA_D_SwrDA].[FromDate] ,
		[TA_D_SwrDA].[TillDate] ,
		[TA_D_SwrDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_CityTypes2].[CityTypeName] AS TA_CityTypes2_CityTypeName 
  FROM [TA_D_SwrDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_SwrDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_D_SwrDA].[CityTypeID] = [TA_CityTypes2].[CityTypeID]
  WHERE
  [TA_D_SwrDA].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_SwrDA].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_SwrDA].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_SwrDA].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_SwrDA].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_D_SwrDA].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_D_SwrDA].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'HotelStayDA' THEN [TA_D_SwrDA].[HotelStayDA] END,
     CASE @OrderBy WHEN 'HotelStayDA DESC' THEN [TA_D_SwrDA].[HotelStayDA] END DESC,
     CASE @OrderBy WHEN 'SwrDA' THEN [TA_D_SwrDA].[SwrDA] END,
     CASE @OrderBy WHEN 'SwrDA DESC' THEN [TA_D_SwrDA].[SwrDA] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_SwrDA].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_SwrDA].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_SwrDA].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_SwrDA].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_SwrDA].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_SwrDA].[Active] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName' THEN [TA_CityTypes2].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName DESC' THEN [TA_CityTypes2].[CityTypeName] END DESC 
  SET @RecordCount = @@RowCount
GO
