USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttendComplaintsSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_CallTypeID Int,
  @Filter_CallStatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @AttenderID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CallID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CallID) ' + 
               'SELECT [CAL_Register].[CallID] FROM [CAL_Register] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[AttenderID] = [aspnet_Users4].[UserName]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority3]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[Priority] = [CAL_Priority3].[Priority]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status5]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[CallStatusID] = [CAL_Status5].[CallStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [CAL_Register].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_CallTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [CAL_Register].[CallTypeID] = ' + STR(@Filter_CallTypeID)
  IF (@Filter_CallStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [CAL_Register].[CallStatusID] = ' + STR(@Filter_CallStatusID)
  SET @LGSQL = @LGSQL + ' AND [CAL_Register].[AttenderID] = ''' + @AttenderID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[CAL_Register].[CallID]'
                        WHEN 'CallID DESC' THEN '[CAL_Register].[CallID] DESC'
                        WHEN 'UserID' THEN '[CAL_Register].[UserID]'
                        WHEN 'UserID DESC' THEN '[CAL_Register].[UserID] DESC'
                        WHEN 'LoggedOn' THEN '[CAL_Register].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[CAL_Register].[LoggedOn] DESC'
                        WHEN 'CallDescription' THEN '[CAL_Register].[CallDescription]'
                        WHEN 'CallDescription DESC' THEN '[CAL_Register].[CallDescription] DESC'
                        WHEN 'CallTypeID' THEN '[CAL_Register].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[CAL_Register].[CallTypeID] DESC'
                        WHEN 'AttenderID' THEN '[CAL_Register].[AttenderID]'
                        WHEN 'AttenderID DESC' THEN '[CAL_Register].[AttenderID] DESC'
                        WHEN 'Priority' THEN '[CAL_Register].[Priority]'
                        WHEN 'Priority DESC' THEN '[CAL_Register].[Priority] DESC'
                        WHEN 'AssignedOn' THEN '[CAL_Register].[AssignedOn]'
                        WHEN 'AssignedOn DESC' THEN '[CAL_Register].[AssignedOn] DESC'
                        WHEN 'ResponseTime' THEN '[CAL_Register].[ResponseTime]'
                        WHEN 'ResponseTime DESC' THEN '[CAL_Register].[ResponseTime] DESC'
                        WHEN 'AttendedOn' THEN '[CAL_Register].[AttendedOn]'
                        WHEN 'AttendedOn DESC' THEN '[CAL_Register].[AttendedOn] DESC'
                        WHEN 'AttenderDescription' THEN '[CAL_Register].[AttenderDescription]'
                        WHEN 'AttenderDescription DESC' THEN '[CAL_Register].[AttenderDescription] DESC'
                        WHEN 'CallStatusID' THEN '[CAL_Register].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[CAL_Register].[CallStatusID] DESC'
                        WHEN 'ClosedOn' THEN '[CAL_Register].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[CAL_Register].[ClosedOn] DESC'
                        WHEN 'SignedOffOn' THEN '[CAL_Register].[SignedOffOn]'
                        WHEN 'SignedOffOn DESC' THEN '[CAL_Register].[SignedOffOn] DESC'
                        WHEN 'aspnet_Users1_UserName' THEN '[aspnet_Users1].[UserName]'
                        WHEN 'aspnet_Users1_UserName DESC' THEN '[aspnet_Users1].[UserName] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users1_LocationID' THEN '[aspnet_Users1].[LocationID]'
                        WHEN 'aspnet_Users1_LocationID DESC' THEN '[aspnet_Users1].[LocationID] DESC'
                        WHEN 'aspnet_Users1_ExtnNo' THEN '[aspnet_Users1].[ExtnNo]'
                        WHEN 'aspnet_Users1_ExtnNo DESC' THEN '[aspnet_Users1].[ExtnNo] DESC'
                        WHEN 'aspnet_Users1_MobileNo' THEN '[aspnet_Users1].[MobileNo]'
                        WHEN 'aspnet_Users1_MobileNo DESC' THEN '[aspnet_Users1].[MobileNo] DESC'
                        WHEN 'aspnet_Users1_EMailID' THEN '[aspnet_Users1].[EMailID]'
                        WHEN 'aspnet_Users1_EMailID DESC' THEN '[aspnet_Users1].[EMailID] DESC'
                        WHEN 'CAL_CallTypes2_CallTypeID' THEN '[CAL_CallTypes2].[CallTypeID]'
                        WHEN 'CAL_CallTypes2_CallTypeID DESC' THEN '[CAL_CallTypes2].[CallTypeID] DESC'
                        WHEN 'CAL_CallTypes2_Description' THEN '[CAL_CallTypes2].[Description]'
                        WHEN 'CAL_CallTypes2_Description DESC' THEN '[CAL_CallTypes2].[Description] DESC'
                        WHEN 'CAL_CallTypes2_Priority' THEN '[CAL_CallTypes2].[Priority]'
                        WHEN 'CAL_CallTypes2_Priority DESC' THEN '[CAL_CallTypes2].[Priority] DESC'
                        WHEN 'CAL_CallTypes2_ResponseTime' THEN '[CAL_CallTypes2].[ResponseTime]'
                        WHEN 'CAL_CallTypes2_ResponseTime DESC' THEN '[CAL_CallTypes2].[ResponseTime] DESC'
                        WHEN 'aspnet_Users4_UserName' THEN '[aspnet_Users4].[UserName]'
                        WHEN 'aspnet_Users4_UserName DESC' THEN '[aspnet_Users4].[UserName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_LocationID' THEN '[aspnet_Users4].[LocationID]'
                        WHEN 'aspnet_Users4_LocationID DESC' THEN '[aspnet_Users4].[LocationID] DESC'
                        WHEN 'aspnet_Users4_ExtnNo' THEN '[aspnet_Users4].[ExtnNo]'
                        WHEN 'aspnet_Users4_ExtnNo DESC' THEN '[aspnet_Users4].[ExtnNo] DESC'
                        WHEN 'aspnet_Users4_MobileNo' THEN '[aspnet_Users4].[MobileNo]'
                        WHEN 'aspnet_Users4_MobileNo DESC' THEN '[aspnet_Users4].[MobileNo] DESC'
                        WHEN 'aspnet_Users4_EMailID' THEN '[aspnet_Users4].[EMailID]'
                        WHEN 'aspnet_Users4_EMailID DESC' THEN '[aspnet_Users4].[EMailID] DESC'
                        WHEN 'CAL_Priority3_Priority' THEN '[CAL_Priority3].[Priority]'
                        WHEN 'CAL_Priority3_Priority DESC' THEN '[CAL_Priority3].[Priority] DESC'
                        WHEN 'CAL_Priority3_Description' THEN '[CAL_Priority3].[Description]'
                        WHEN 'CAL_Priority3_Description DESC' THEN '[CAL_Priority3].[Description] DESC'
                        WHEN 'CAL_Status5_CallStatusID' THEN '[CAL_Status5].[CallStatusID]'
                        WHEN 'CAL_Status5_CallStatusID DESC' THEN '[CAL_Status5].[CallStatusID] DESC'
                        WHEN 'CAL_Status5_Description' THEN '[CAL_Status5].[Description]'
                        WHEN 'CAL_Status5_Description DESC' THEN '[CAL_Status5].[Description] DESC'
                        ELSE '[CAL_Register].[CallID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[UserID],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[CallDescription],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[AttenderID],
		[CAL_Register].[Priority],
		[CAL_Register].[AssignedOn],
		[CAL_Register].[ResponseTime],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[aspnet_Users1].[UserName] AS aspnet_Users1_UserName,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users1].[LocationID] AS aspnet_Users1_LocationID,
		[aspnet_Users1].[ExtnNo] AS aspnet_Users1_ExtnNo,
		[aspnet_Users1].[MobileNo] AS aspnet_Users1_MobileNo,
		[aspnet_Users1].[EMailID] AS aspnet_Users1_EMailID,
		[CAL_CallTypes2].[CallTypeID] AS CAL_CallTypes2_CallTypeID,
		[CAL_CallTypes2].[Description] AS CAL_CallTypes2_Description,
		[CAL_CallTypes2].[Priority] AS CAL_CallTypes2_Priority,
		[CAL_CallTypes2].[ResponseTime] AS CAL_CallTypes2_ResponseTime,
		[aspnet_Users4].[UserName] AS aspnet_Users4_UserName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users4].[LocationID] AS aspnet_Users4_LocationID,
		[aspnet_Users4].[ExtnNo] AS aspnet_Users4_ExtnNo,
		[aspnet_Users4].[MobileNo] AS aspnet_Users4_MobileNo,
		[aspnet_Users4].[EMailID] AS aspnet_Users4_EMailID,
		[CAL_Priority3].[Priority] AS CAL_Priority3_Priority,
		[CAL_Priority3].[Description] AS CAL_Priority3_Description,
		[CAL_Status5].[CallStatusID] AS CAL_Status5_CallStatusID,
		[CAL_Status5].[Description] AS CAL_Status5_Description 
  FROM [CAL_Register] 
    	INNER JOIN #PageIndex
          ON [CAL_Register].[CallID] = #PageIndex.CallID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [CAL_Register].[AttenderID] = [aspnet_Users4].[UserName]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority3]
    ON [CAL_Register].[Priority] = [CAL_Priority3].[Priority]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status5]
    ON [CAL_Register].[CallStatusID] = [CAL_Status5].[CallStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
