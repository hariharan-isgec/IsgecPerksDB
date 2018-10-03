USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[spta_LG_D_GuestHouseDASelectByCategoryIDForOtherCityType]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @ForStartDate DateTime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
		[TA_D_GuestHouseDA].[SerialNo] ,
		[TA_D_GuestHouseDA].[CategoryID] ,
		[TA_D_GuestHouseDA].[CityID] ,
		[TA_D_GuestHouseDA].[OtherCity] ,
		[TA_D_GuestHouseDA].[DA] ,
		[TA_D_GuestHouseDA].[FromDate] ,
		[TA_D_GuestHouseDA].[TillDate] ,
		[TA_D_GuestHouseDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Cities2].[CityName] AS TA_Cities2_CityName 
  FROM [TA_D_GuestHouseDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_GuestHouseDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_GuestHouseDA].[CityID] = [TA_Cities2].[CityID]
  WHERE
  [TA_D_GuestHouseDA].[CategoryID] = @CategoryID 
  AND [TA_D_GuestHouseDA].[OtherCity] = 1  
  AND @ForStartDate Between [TA_D_GuestHouseDA].[FromDate] and [TA_D_GuestHouseDA].[TillDate] 
  AND [TA_D_GuestHouseDA].[Active] = 1
  SET @RecordCount = @@RowCount
GO
