USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_D_LodgingSelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @CityTypeID NVarChar(6),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
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
  AND [TA_D_Lodging].[CityTypeID] = @CityTypeID
  AND @ForStartDate Between	[TA_D_Lodging].[FromDate] AND [TA_D_Lodging].[TillDate] 
  AND [TA_D_Lodging].[Active] = 1  

  SET @RecordCount = @@RowCount
GO
