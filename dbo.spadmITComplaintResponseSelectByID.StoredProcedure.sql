USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseSelectByID]
  @CallID Int,
  @SerialNo Int 
  AS
  SELECT
		[ADM_ITComplaintResponse].[CallID],
		[ADM_ITComplaintResponse].[SerialNo],
		[ADM_ITComplaintResponse].[Remarks],
		[ADM_ITComplaintResponse].[AttendedOn],
		[ADM_ITComplaintResponse].[AttendedBy],
		[ADM_ITComplaintResponse].[AutoPosted],
		[aspnet_users2].[UserName] AS aspnet_users2_UserName,
		[aspnet_users2].[UserFullName] AS aspnet_users2_UserFullName,
		[aspnet_users2].[LocationID] AS aspnet_users2_LocationID,
		[aspnet_users2].[ExtnNo] AS aspnet_users2_ExtnNo,
		[aspnet_users2].[MobileNo] AS aspnet_users2_MobileNo,
		[aspnet_users2].[EMailID] AS aspnet_users2_EMailID,
		[aspnet_users2].[C_OfficeID] AS aspnet_users2_C_OfficeID,
		[aspnet_users2].[C_DepartmentID] AS aspnet_users2_C_DepartmentID 
  FROM [ADM_ITComplaintResponse] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [ADM_ITComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]
  WHERE
  [ADM_ITComplaintResponse].[CallID] = @CallID
  AND [ADM_ITComplaintResponse].[SerialNo] = @SerialNo
GO
