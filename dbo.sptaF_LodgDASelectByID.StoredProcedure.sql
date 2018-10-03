USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_LodgDASelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
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
  [TA_F_LodgDA].[SerialNo] = @SerialNo
GO
