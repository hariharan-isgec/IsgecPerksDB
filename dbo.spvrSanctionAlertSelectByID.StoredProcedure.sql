USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[VR_SanctionAlert].[ProjectID] ,
		[VR_SanctionAlert].[At60] ,
		[VR_SanctionAlert].[At70] ,
		[VR_SanctionAlert].[At80] ,
		[VR_SanctionAlert].[At90] ,
		[VR_SanctionAlert].[At95] ,
		[VR_SanctionAlert].[At96] ,
		[VR_SanctionAlert].[At97] ,
		[VR_SanctionAlert].[At98] ,
		[VR_SanctionAlert].[At99] ,
		[VR_SanctionAlert].[EMailIDs] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [VR_SanctionAlert] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_SanctionAlert].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
  [VR_SanctionAlert].[ProjectID] = @ProjectID
GO
