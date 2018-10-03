USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_DriverSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_D_Driver].[SerialNo] ,
		[TA_D_Driver].[CategoryID] ,
		[TA_D_Driver].[DriverAmount] ,
		[TA_D_Driver].[FromDate] ,
		[TA_D_Driver].[TillDate] ,
		[TA_D_Driver].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_D_Driver] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Driver].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
  [TA_D_Driver].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_D_Driver].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_D_Driver].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_D_Driver].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_D_Driver].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'DriverAmount' THEN [TA_D_Driver].[DriverAmount] END,
     CASE @OrderBy WHEN 'DriverAmount DESC' THEN [TA_D_Driver].[DriverAmount] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_D_Driver].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_D_Driver].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_D_Driver].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_D_Driver].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_D_Driver].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_D_Driver].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
