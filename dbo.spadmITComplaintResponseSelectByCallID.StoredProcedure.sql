USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseSelectByCallID]
  @CallID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [ADM_ITComplaintResponse].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [ADM_ITComplaintResponse].[CallID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [ADM_ITComplaintResponse].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [ADM_ITComplaintResponse].[SerialNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ADM_ITComplaintResponse].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ADM_ITComplaintResponse].[Remarks] END DESC,
     CASE @orderBy WHEN 'AttendedOn' THEN [ADM_ITComplaintResponse].[AttendedOn] END,
     CASE @orderBy WHEN 'AttendedOn DESC' THEN [ADM_ITComplaintResponse].[AttendedOn] END DESC,
     CASE @orderBy WHEN 'AttendedBy' THEN [ADM_ITComplaintResponse].[AttendedBy] END,
     CASE @orderBy WHEN 'AttendedBy DESC' THEN [ADM_ITComplaintResponse].[AttendedBy] END DESC,
     CASE @orderBy WHEN 'AutoPosted' THEN [ADM_ITComplaintResponse].[AutoPosted] END,
     CASE @orderBy WHEN 'AutoPosted DESC' THEN [ADM_ITComplaintResponse].[AutoPosted] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_UserName' THEN [aspnet_users2].[UserName] END,
     CASE @orderBy WHEN 'aspnet_users2_UserName DESC' THEN [aspnet_users2].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_UserFullName' THEN [aspnet_users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users2_UserFullName DESC' THEN [aspnet_users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_LocationID' THEN [aspnet_users2].[LocationID] END,
     CASE @orderBy WHEN 'aspnet_users2_LocationID DESC' THEN [aspnet_users2].[LocationID] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_ExtnNo' THEN [aspnet_users2].[ExtnNo] END,
     CASE @orderBy WHEN 'aspnet_users2_ExtnNo DESC' THEN [aspnet_users2].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_MobileNo' THEN [aspnet_users2].[MobileNo] END,
     CASE @orderBy WHEN 'aspnet_users2_MobileNo DESC' THEN [aspnet_users2].[MobileNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_EMailID' THEN [aspnet_users2].[EMailID] END,
     CASE @orderBy WHEN 'aspnet_users2_EMailID DESC' THEN [aspnet_users2].[EMailID] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_C_OfficeID' THEN [aspnet_users2].[C_OfficeID] END,
     CASE @orderBy WHEN 'aspnet_users2_C_OfficeID DESC' THEN [aspnet_users2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'aspnet_users2_C_DepartmentID' THEN [aspnet_users2].[C_DepartmentID] END,
     CASE @orderBy WHEN 'aspnet_users2_C_DepartmentID DESC' THEN [aspnet_users2].[C_DepartmentID] END DESC 
  SET @RecordCount = @@RowCount
GO
