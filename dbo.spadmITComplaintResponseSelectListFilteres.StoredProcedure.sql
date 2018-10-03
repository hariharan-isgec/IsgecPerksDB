USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ADM_ITComplaintResponse].[CallID]'  SET @LGSQL = @LGSQL + ', [ADM_ITComplaintResponse].[SerialNo]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITComplaintResponse] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CallID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITComplaintResponse].[CallID] = ' + STR(@Filter_CallID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_ITComplaintResponse].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_ITComplaintResponse].[CallID] DESC'
                        WHEN 'SerialNo' THEN '[ADM_ITComplaintResponse].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ADM_ITComplaintResponse].[SerialNo] DESC'
                        WHEN 'Remarks' THEN '[ADM_ITComplaintResponse].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ADM_ITComplaintResponse].[Remarks] DESC'
                        WHEN 'AttendedOn' THEN '[ADM_ITComplaintResponse].[AttendedOn]'
                        WHEN 'AttendedOn DESC' THEN '[ADM_ITComplaintResponse].[AttendedOn] DESC'
                        WHEN 'AttendedBy' THEN '[ADM_ITComplaintResponse].[AttendedBy]'
                        WHEN 'AttendedBy DESC' THEN '[ADM_ITComplaintResponse].[AttendedBy] DESC'
                        WHEN 'AutoPosted' THEN '[ADM_ITComplaintResponse].[AutoPosted]'
                        WHEN 'AutoPosted DESC' THEN '[ADM_ITComplaintResponse].[AutoPosted] DESC'
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
                        ELSE '[ADM_ITComplaintResponse].[CallID],[ADM_ITComplaintResponse].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ADM_ITComplaintResponse].[CallID] = #PageIndex.CallID
          AND [ADM_ITComplaintResponse].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [ADM_ITComplaintResponse].[AttendedBy] = [aspnet_users2].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
