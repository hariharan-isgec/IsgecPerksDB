USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_GuestHouseDASelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
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
  [TA_D_GuestHouseDA].[SerialNo] = @SerialNo
GO
