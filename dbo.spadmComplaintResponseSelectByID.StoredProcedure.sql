USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmComplaintResponseSelectByID]
  @CallID Int,
  @SerialNo Int 
  AS
  SELECT
		[ADM_ComplaintResponse].[CallID],
		[ADM_ComplaintResponse].[SerialNo],
		[ADM_ComplaintResponse].[Remarks],
		[ADM_ComplaintResponse].[AttendedOn],
		[ADM_ComplaintResponse].[AttendedBy],
		[ADM_ComplaintResponse].[AutoPosted],
		[aspnet_users2].[UserName] AS aspnet_users2_UserName,
		[aspnet_users2].[UserFullName] AS aspnet_users2_UserFullName,
		[aspnet_users2].[LocationID] AS aspnet_users2_LocationID,
		[aspnet_users2].[ExtnNo] AS aspnet_users2_ExtnNo,
		[aspnet_users2].[MobileNo] AS aspnet_users2_MobileNo,
		[aspnet_users2].[EMailID] AS aspnet_users2_EMailID,
		[aspnet_users2].[C_OfficeID] AS aspnet_users2_C_OfficeID,
		[aspnet_users2].[C_DepartmentID] AS aspnet_users2_C_DepartmentID 
  FROM [ADM_ComplaintResponse] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [ADM_ComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]
  WHERE
  [ADM_ComplaintResponse].[CallID] = @CallID
  AND [ADM_ComplaintResponse].[SerialNo] = @SerialNo
GO
