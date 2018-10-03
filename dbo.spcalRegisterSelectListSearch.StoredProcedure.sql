USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CallID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallID)
  SELECT [CAL_Register].[CallID] FROM [CAL_Register]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]
    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]
 WHERE  
   ( 
         STR(ISNULL([CAL_Register].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Register].[UserID],'')) LIKE @KeyWord1
     OR STR(ISNULL([CAL_Register].[CallTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Register].[CallDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Register].[AttenderID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Register].[AttenderDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([CAL_Register].[CallStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users1].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users1].[UserFullName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_CallTypes2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users3].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users3].[UserFullName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Status4].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [CAL_Register].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [CAL_Register].[CallID] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [CAL_Register].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [CAL_Register].[UserID] END DESC,
     CASE @orderBy WHEN 'CallTypeID' THEN [CAL_Register].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [CAL_Register].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'CallDescription' THEN [CAL_Register].[CallDescription] END,
     CASE @orderBy WHEN 'CallDescription DESC' THEN [CAL_Register].[CallDescription] END DESC,
     CASE @orderBy WHEN 'LoggedOn' THEN [CAL_Register].[LoggedOn] END,
     CASE @orderBy WHEN 'LoggedOn DESC' THEN [CAL_Register].[LoggedOn] END DESC,
     CASE @orderBy WHEN 'AttenderID' THEN [CAL_Register].[AttenderID] END,
     CASE @orderBy WHEN 'AttenderID DESC' THEN [CAL_Register].[AttenderID] END DESC,
     CASE @orderBy WHEN 'AttendedOn' THEN [CAL_Register].[AttendedOn] END,
     CASE @orderBy WHEN 'AttendedOn DESC' THEN [CAL_Register].[AttendedOn] END DESC,
     CASE @orderBy WHEN 'AttenderDescription' THEN [CAL_Register].[AttenderDescription] END,
     CASE @orderBy WHEN 'AttenderDescription DESC' THEN [CAL_Register].[AttenderDescription] END DESC,
     CASE @orderBy WHEN 'CallStatusID' THEN [CAL_Register].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [CAL_Register].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [CAL_Register].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [CAL_Register].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'SignedOffOn' THEN [CAL_Register].[SignedOffOn] END,
     CASE @orderBy WHEN 'SignedOffOn DESC' THEN [CAL_Register].[SignedOffOn] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserName' THEN [aspnet_Users1].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserName DESC' THEN [aspnet_Users1].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'CAL_CallTypes2_CallTypeID' THEN [CAL_CallTypes2].[CallTypeID] END,
     CASE @orderBy WHEN 'CAL_CallTypes2_CallTypeID DESC' THEN [CAL_CallTypes2].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'CAL_CallTypes2_Description' THEN [CAL_CallTypes2].[Description] END,
     CASE @orderBy WHEN 'CAL_CallTypes2_Description DESC' THEN [CAL_CallTypes2].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserName' THEN [aspnet_Users3].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserName DESC' THEN [aspnet_Users3].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'CAL_Status4_CallStatusID' THEN [CAL_Status4].[CallStatusID] END,
     CASE @orderBy WHEN 'CAL_Status4_CallStatusID DESC' THEN [CAL_Status4].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'CAL_Status4_Description' THEN [CAL_Status4].[Description] END,
     CASE @orderBy WHEN 'CAL_Status4_Description DESC' THEN [CAL_Status4].[Description] END DESC 

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
