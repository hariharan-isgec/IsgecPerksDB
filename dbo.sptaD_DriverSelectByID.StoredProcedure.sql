USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_DriverSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
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
  [TA_D_Driver].[SerialNo] = @SerialNo
GO
