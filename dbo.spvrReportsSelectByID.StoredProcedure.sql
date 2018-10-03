USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrReportsSelectByID]
  @LoginID NVarChar(8),
  @FProject NVarChar(6) 
  AS
  SELECT
		[VR_Reports].[FProject] ,
		[VR_Reports].[TProject] ,
		[VR_Reports].[FSupplier] ,
		[VR_Reports].[TSupplier] ,
		[VR_Reports].[FReqDt] ,
		[VR_Reports].[TReqDt] ,
		[VR_Reports].[FUser] ,
		[VR_Reports].[TUser] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[IDM_Projects3].[Description] AS IDM_Projects3_Description,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[VR_Transporters5].[TransporterName] AS VR_Transporters5_TransporterName,
		[VR_Transporters6].[TransporterName] AS VR_Transporters6_TransporterName 
  FROM [VR_Reports] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_Reports].[FUser] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_Reports].[TUser] = [aspnet_Users2].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [VR_Reports].[FProject] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [VR_Reports].[TProject] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters5]
    ON [VR_Reports].[FSupplier] = [VR_Transporters5].[TransporterID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters6]
    ON [VR_Reports].[TSupplier] = [VR_Transporters6].[TransporterID]
  WHERE
  [VR_Reports].[FProject] = @FProject
GO
