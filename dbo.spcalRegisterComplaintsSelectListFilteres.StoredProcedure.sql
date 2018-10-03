USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterComplaintsSelectListFilteres]
  @Filter_CallStatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @UserID NVarChar(8),
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes1]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes1].[CallTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority2]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[Priority] = [CAL_Priority2].[Priority]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CallStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [CAL_Register].[CallStatusID] = ' + STR(@Filter_CallStatusID)
  SET @LGSQL = @LGSQL + ' AND [CAL_Register].[UserID] = ''' + @UserID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[CAL_Register].[CallID]'
                        WHEN 'CallID DESC' THEN '[CAL_Register].[CallID] DESC'
                        WHEN 'LoggedOn' THEN '[CAL_Register].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[CAL_Register].[LoggedOn] DESC'
                        WHEN 'UserID' THEN '[CAL_Register].[UserID]'
                        WHEN 'UserID DESC' THEN '[CAL_Register].[UserID] DESC'
                        WHEN 'CallTypeID' THEN '[CAL_Register].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[CAL_Register].[CallTypeID] DESC'
                        WHEN 'CallDescription' THEN '[CAL_Register].[CallDescription]'
                        WHEN 'CallDescription DESC' THEN '[CAL_Register].[CallDescription] DESC'
                        WHEN 'AttenderID' THEN '[CAL_Register].[AttenderID]'
                        WHEN 'AttenderID DESC' THEN '[CAL_Register].[AttenderID] DESC'
                        WHEN 'Priority' THEN '[CAL_Register].[Priority]'
                        WHEN 'Priority DESC' THEN '[CAL_Register].[Priority] DESC'
                        WHEN 'AttendedOn' THEN '[CAL_Register].[AttendedOn]'
                        WHEN 'AttendedOn DESC' THEN '[CAL_Register].[AttendedOn] DESC'
                        WHEN 'ResponseTime' THEN '[CAL_Register].[ResponseTime]'
                        WHEN 'ResponseTime DESC' THEN '[CAL_Register].[ResponseTime] DESC'
                        WHEN 'AttenderDescription' THEN '[CAL_Register].[AttenderDescription]'
                        WHEN 'AttenderDescription DESC' THEN '[CAL_Register].[AttenderDescription] DESC'
                        WHEN 'AssignedOn' THEN '[CAL_Register].[AssignedOn]'
                        WHEN 'AssignedOn DESC' THEN '[CAL_Register].[AssignedOn] DESC'
                        WHEN 'CallStatusID' THEN '[CAL_Register].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[CAL_Register].[CallStatusID] DESC'
                        WHEN 'ClosedOn' THEN '[CAL_Register].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[CAL_Register].[ClosedOn] DESC'
                        WHEN 'SignedOffOn' THEN '[CAL_Register].[SignedOffOn]'
                        WHEN 'SignedOffOn DESC' THEN '[CAL_Register].[SignedOffOn] DESC'
                        WHEN 'CAL_CallTypes1_CallTypeID' THEN '[CAL_CallTypes1].[CallTypeID]'
                        WHEN 'CAL_CallTypes1_CallTypeID DESC' THEN '[CAL_CallTypes1].[CallTypeID] DESC'
                        WHEN 'CAL_CallTypes1_Description' THEN '[CAL_CallTypes1].[Description]'
                        WHEN 'CAL_CallTypes1_Description DESC' THEN '[CAL_CallTypes1].[Description] DESC'
                        WHEN 'CAL_CallTypes1_Priority' THEN '[CAL_CallTypes1].[Priority]'
                        WHEN 'CAL_CallTypes1_Priority DESC' THEN '[CAL_CallTypes1].[Priority] DESC'
                        WHEN 'CAL_CallTypes1_ResponseTime' THEN '[CAL_CallTypes1].[ResponseTime]'
                        WHEN 'CAL_CallTypes1_ResponseTime DESC' THEN '[CAL_CallTypes1].[ResponseTime] DESC'
                        WHEN 'aspnet_Users3_UserName' THEN '[aspnet_Users3].[UserName]'
                        WHEN 'aspnet_Users3_UserName DESC' THEN '[aspnet_Users3].[UserName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_LocationID' THEN '[aspnet_Users3].[LocationID]'
                        WHEN 'aspnet_Users3_LocationID DESC' THEN '[aspnet_Users3].[LocationID] DESC'
                        WHEN 'aspnet_Users3_ExtnNo' THEN '[aspnet_Users3].[ExtnNo]'
                        WHEN 'aspnet_Users3_ExtnNo DESC' THEN '[aspnet_Users3].[ExtnNo] DESC'
                        WHEN 'aspnet_Users3_MobileNo' THEN '[aspnet_Users3].[MobileNo]'
                        WHEN 'aspnet_Users3_MobileNo DESC' THEN '[aspnet_Users3].[MobileNo] DESC'
                        WHEN 'aspnet_Users3_EMailID' THEN '[aspnet_Users3].[EMailID]'
                        WHEN 'aspnet_Users3_EMailID DESC' THEN '[aspnet_Users3].[EMailID] DESC'
                        WHEN 'CAL_Priority2_Priority' THEN '[CAL_Priority2].[Priority]'
                        WHEN 'CAL_Priority2_Priority DESC' THEN '[CAL_Priority2].[Priority] DESC'
                        WHEN 'CAL_Priority2_Description' THEN '[CAL_Priority2].[Description]'
                        WHEN 'CAL_Priority2_Description DESC' THEN '[CAL_Priority2].[Description] DESC'
                        WHEN 'CAL_Status4_CallStatusID' THEN '[CAL_Status4].[CallStatusID]'
                        WHEN 'CAL_Status4_CallStatusID DESC' THEN '[CAL_Status4].[CallStatusID] DESC'
                        WHEN 'CAL_Status4_Description' THEN '[CAL_Status4].[Description]'
                        WHEN 'CAL_Status4_Description DESC' THEN '[CAL_Status4].[Description] DESC'
                        ELSE '[CAL_Register].[CallID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[UserID],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[CallDescription],
		[CAL_Register].[AttenderID],
		[CAL_Register].[Priority],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[ResponseTime],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[AssignedOn],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[CAL_CallTypes1].[CallTypeID] AS CAL_CallTypes1_CallTypeID,
		[CAL_CallTypes1].[Description] AS CAL_CallTypes1_Description,
		[CAL_CallTypes1].[Priority] AS CAL_CallTypes1_Priority,
		[CAL_CallTypes1].[ResponseTime] AS CAL_CallTypes1_ResponseTime,
		[aspnet_Users3].[UserName] AS aspnet_Users3_UserName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users3].[LocationID] AS aspnet_Users3_LocationID,
		[aspnet_Users3].[ExtnNo] AS aspnet_Users3_ExtnNo,
		[aspnet_Users3].[MobileNo] AS aspnet_Users3_MobileNo,
		[aspnet_Users3].[EMailID] AS aspnet_Users3_EMailID,
		[CAL_Priority2].[Priority] AS CAL_Priority2_Priority,
		[CAL_Priority2].[Description] AS CAL_Priority2_Description,
		[CAL_Status4].[CallStatusID] AS CAL_Status4_CallStatusID,
		[CAL_Status4].[Description] AS CAL_Status4_Description 
  FROM [CAL_Register] 
    	INNER JOIN #PageIndex
          ON [CAL_Register].[CallID] = #PageIndex.CallID
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes1]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes1].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority2]
    ON [CAL_Register].[Priority] = [CAL_Priority2].[Priority]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]
    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
