USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_F_LodgDASelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @RegionID NVarChar(10),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
		[TA_F_LodgDA].[SerialNo] ,
		[TA_F_LodgDA].[CategoryID] ,
		[TA_F_LodgDA].[RegionID] ,
		[TA_F_LodgDA].[Lodging] ,
		[TA_F_LodgDA].[DA] ,
		[TA_F_LodgDA].[FromDate] ,
		[TA_F_LodgDA].[TillDate] ,
		[TA_F_LodgDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Regions1].[RegionName] AS TA_Regions1_RegionName 
  FROM [TA_F_LodgDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_LodgDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions1]
    ON [TA_F_LodgDA].[RegionID] = [TA_Regions1].[RegionID]
  WHERE
     [TA_F_LodgDA].[CategoryID] = @CategoryID  
     AND [TA_F_LodgDA].[RegionID] = @RegionID 
	 AND @ForStartDate Between [TA_F_LodgDA].[FromDate] AND [TA_F_LodgDA].[TillDate] 
	 AND [TA_F_LodgDA].[Active] = 1
  SET @RecordCount = @@RowCount
GO
