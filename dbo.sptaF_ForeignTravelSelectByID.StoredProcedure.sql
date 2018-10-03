USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_ForeignTravelSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[TA_F_ForeignTravel].[SerialNo] ,
		[TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[DA_Adjested_LC_Percent] ,
		[TA_F_ForeignTravel].[FromDate] ,
		[TA_F_ForeignTravel].[TillDate] ,
		[TA_F_ForeignTravel].[Active]  
  FROM [TA_F_ForeignTravel] 
  WHERE
  [TA_F_ForeignTravel].[SerialNo] = @SerialNo
GO
