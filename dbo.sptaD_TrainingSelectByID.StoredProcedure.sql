USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TrainingSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[TA_D_Training].[SerialNo] ,
		[TA_D_Training].[Bord_Lodg_DA_Percent] ,
		[TA_D_Training].[Lodg_DA_Percent] ,
		[TA_D_Training].[FromDate] ,
		[TA_D_Training].[TillDate] ,
		[TA_D_Training].[Active]  
  FROM [TA_D_Training] 
  WHERE
  [TA_D_Training].[SerialNo] = @SerialNo
GO
