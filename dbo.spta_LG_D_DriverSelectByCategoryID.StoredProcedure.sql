USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_D_DriverSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
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
  AND @ForStartDate Between [TA_D_Driver].[FromDate] AND [TA_D_Driver].[TillDate] 
  AND [TA_D_Driver].[Active] = 1

  SET @RecordCount = @@RowCount
GO
