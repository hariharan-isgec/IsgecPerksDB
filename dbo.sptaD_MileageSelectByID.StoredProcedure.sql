USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_MileageSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[TA_D_Mileage].[SerialNo] ,
		[TA_D_Mileage].[CategoryID] ,
		[TA_D_Mileage].[CityID] ,
		[TA_D_Mileage].[OtherCity] ,
		[TA_D_Mileage].[AmountPerKM] ,
		[TA_D_Mileage].[FromDate] ,
		[TA_D_Mileage].[TillDate] ,
		[TA_D_Mileage].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Cities2].[CityName] AS TA_Cities2_CityName 
  FROM [TA_D_Mileage] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Mileage].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_Mileage].[CityID] = [TA_Cities2].[CityID]
  WHERE
  [TA_D_Mileage].[SerialNo] = @SerialNo
GO
