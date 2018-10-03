USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_GetUserGroupByUserID]
  @UserID NVarChar(8),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  SELECT
		[VR_UserGroup].[SerialNo] ,
		[VR_UserGroup].[UserID] ,
		[VR_UserGroup].[GroupID] ,
		[VR_UserGroup].[RoleID] ,
		[VR_UserGroup].[OutOfContractApprover] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VR_Groups2].[GroupName] AS VR_Groups2_GroupName 
  FROM [VR_UserGroup] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserGroup].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [VR_Groups] AS [VR_Groups2]
    ON [VR_UserGroup].[GroupID] = [VR_Groups2].[GroupID]
  WHERE
		[VR_UserGroup].[UserID] = @UserID 

  SET @RecordCount = @@RowCount

  END
GO
