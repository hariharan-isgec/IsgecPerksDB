USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmComplaintResponseSelectListFilteres]
  @Filter_CallID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallID'  SET @LGSQL = @LGSQL + ', SerialNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ComplaintResponse].[CallID]'  SET @LGSQL = @LGSQL + ', [ADM_ComplaintResponse].[SerialNo]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ComplaintResponse] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CallID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ADM_ComplaintResponse].[CallID] = ' + STR(@Filter_CallID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_ComplaintResponse].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_ComplaintResponse].[CallID] DESC'
                        WHEN 'SerialNo' THEN '[ADM_ComplaintResponse].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ADM_ComplaintResponse].[SerialNo] DESC'
                        WHEN 'Remarks' THEN '[ADM_ComplaintResponse].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ADM_ComplaintResponse].[Remarks] DESC'
                        WHEN 'AttendedOn' THEN '[ADM_ComplaintResponse].[AttendedOn]'
                        WHEN 'AttendedOn DESC' THEN '[ADM_ComplaintResponse].[AttendedOn] DESC'
                        WHEN 'AttendedBy' THEN '[ADM_ComplaintResponse].[AttendedBy]'
                        WHEN 'AttendedBy DESC' THEN '[ADM_ComplaintResponse].[AttendedBy] DESC'
                        WHEN 'AutoPosted' THEN '[ADM_ComplaintResponse].[AutoPosted]'
                        WHEN 'AutoPosted DESC' THEN '[ADM_ComplaintResponse].[AutoPosted] DESC'
                        WHEN 'aspnet_users2_UserName' THEN '[aspnet_users2].[UserName]'
                        WHEN 'aspnet_users2_UserName DESC' THEN '[aspnet_users2].[UserName] DESC'
                        WHEN 'aspnet_users2_UserFullName' THEN '[aspnet_users2].[UserFullName]'
                        WHEN 'aspnet_users2_UserFullName DESC' THEN '[aspnet_users2].[UserFullName] DESC'
                        WHEN 'aspnet_users2_LocationID' THEN '[aspnet_users2].[LocationID]'
                        WHEN 'aspnet_users2_LocationID DESC' THEN '[aspnet_users2].[LocationID] DESC'
                        WHEN 'aspnet_users2_ExtnNo' THEN '[aspnet_users2].[ExtnNo]'
                        WHEN 'aspnet_users2_ExtnNo DESC' THEN '[aspnet_users2].[ExtnNo] DESC'
                        WHEN 'aspnet_users2_MobileNo' THEN '[aspnet_users2].[MobileNo]'
                        WHEN 'aspnet_users2_MobileNo DESC' THEN '[aspnet_users2].[MobileNo] DESC'
                        WHEN 'aspnet_users2_EMailID' THEN '[aspnet_users2].[EMailID]'
                        WHEN 'aspnet_users2_EMailID DESC' THEN '[aspnet_users2].[EMailID] DESC'
                        WHEN 'aspnet_users2_C_OfficeID' THEN '[aspnet_users2].[C_OfficeID]'
                        WHEN 'aspnet_users2_C_OfficeID DESC' THEN '[aspnet_users2].[C_OfficeID] DESC'
                        WHEN 'aspnet_users2_C_DepartmentID' THEN '[aspnet_users2].[C_DepartmentID]'
                        WHEN 'aspnet_users2_C_DepartmentID DESC' THEN '[aspnet_users2].[C_DepartmentID] DESC'
                        ELSE '[ADM_ComplaintResponse].[CallID],[ADM_ComplaintResponse].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ADM_ComplaintResponse].[CallID] = #PageIndex.CallID
          AND [ADM_ComplaintResponse].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [ADM_ComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
