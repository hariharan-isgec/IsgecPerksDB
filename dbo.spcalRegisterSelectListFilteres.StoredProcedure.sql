USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]'
  SET @LGSQL = @LGSQL + '    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[CAL_Register].[CallID]'
                        WHEN 'CallID DESC' THEN '[CAL_Register].[CallID] DESC'
                        WHEN 'UserID' THEN '[CAL_Register].[UserID]'
                        WHEN 'UserID DESC' THEN '[CAL_Register].[UserID] DESC'
                        WHEN 'CallTypeID' THEN '[CAL_Register].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[CAL_Register].[CallTypeID] DESC'
                        WHEN 'CallDescription' THEN '[CAL_Register].[CallDescription]'
                        WHEN 'CallDescription DESC' THEN '[CAL_Register].[CallDescription] DESC'
                        WHEN 'LoggedOn' THEN '[CAL_Register].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[CAL_Register].[LoggedOn] DESC'
                        WHEN 'AttenderID' THEN '[CAL_Register].[AttenderID]'
                        WHEN 'AttenderID DESC' THEN '[CAL_Register].[AttenderID] DESC'
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
                        WHEN 'CAL_CallTypes2_CallTypeID' THEN '[CAL_CallTypes2].[CallTypeID]'
                        WHEN 'CAL_CallTypes2_CallTypeID DESC' THEN '[CAL_CallTypes2].[CallTypeID] DESC'
                        WHEN 'CAL_CallTypes2_Description' THEN '[CAL_CallTypes2].[Description]'
                        WHEN 'CAL_CallTypes2_Description DESC' THEN '[CAL_CallTypes2].[Description] DESC'
                        WHEN 'aspnet_Users3_UserName' THEN '[aspnet_Users3].[UserName]'
                        WHEN 'aspnet_Users3_UserName DESC' THEN '[aspnet_Users3].[UserName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
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
		[CAL_Register].[UserID],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[CallDescription],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[AttenderID],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[aspnet_Users1].[UserName] AS aspnet_Users1_UserName,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[CAL_CallTypes2].[CallTypeID] AS CAL_CallTypes2_CallTypeID,
		[CAL_CallTypes2].[Description] AS CAL_CallTypes2_Description,
		[aspnet_Users3].[UserName] AS aspnet_Users3_UserName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[CAL_Status4].[CallStatusID] AS CAL_Status4_CallStatusID,
		[CAL_Status4].[Description] AS CAL_Status4_Description 
  FROM [CAL_Register] 
    	INNER JOIN #PageIndex
          ON [CAL_Register].[CallID] = #PageIndex.CallID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]
    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
