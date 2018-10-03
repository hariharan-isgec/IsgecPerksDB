USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDASelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[TA_F_SiteDA].[Perm_Bord_DA] ,
		[TA_F_SiteDA].[Cont_NonT_Bord_DA] ,
		[TA_F_SiteDA].[Cont_Tech_Bord_DA] ,
		[TA_F_SiteDA].[SerialNo] ,
		[TA_F_SiteDA].[CategoryID] ,
		[TA_F_SiteDA].[Cont_Tech_DA] ,
		[TA_F_SiteDA].[Cont_NonT_DA] ,
		[TA_F_SiteDA].[Perm_DA] ,
		[TA_F_SiteDA].[FromDate] ,
		[TA_F_SiteDA].[TillDate] ,
		[TA_F_SiteDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_F_SiteDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_SiteDA].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
  [TA_F_SiteDA].[SerialNo] = @SerialNo
GO
