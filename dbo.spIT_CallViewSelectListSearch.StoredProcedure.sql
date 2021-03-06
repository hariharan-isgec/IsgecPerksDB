USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIT_CallViewSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallID)
  SELECT [IT_CallView].[CallID] FROM [IT_CallView]
 WHERE  
   ( 
         STR(ISNULL([IT_CallView].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[EndUserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[DepartmentDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[Location],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[CallDesc],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[AssignedTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IT_CallView].[LoggedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CallID' THEN [IT_CallView].[CallID] END,
     CASE @OrderBy WHEN 'CallID DESC' THEN [IT_CallView].[CallID] END DESC,
     CASE @OrderBy WHEN 'EndUserID' THEN [IT_CallView].[EndUserID] END,
     CASE @OrderBy WHEN 'EndUserID DESC' THEN [IT_CallView].[EndUserID] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [IT_CallView].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [IT_CallView].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'DepartmentDescription' THEN [IT_CallView].[DepartmentDescription] END,
     CASE @OrderBy WHEN 'DepartmentDescription DESC' THEN [IT_CallView].[DepartmentDescription] END DESC,
     CASE @OrderBy WHEN 'Location' THEN [IT_CallView].[Location] END,
     CASE @OrderBy WHEN 'Location DESC' THEN [IT_CallView].[Location] END DESC,
     CASE @OrderBy WHEN 'CallTypeID' THEN [IT_CallView].[CallTypeID] END,
     CASE @OrderBy WHEN 'CallTypeID DESC' THEN [IT_CallView].[CallTypeID] END DESC,
     CASE @OrderBy WHEN 'CallDesc' THEN [IT_CallView].[CallDesc] END,
     CASE @OrderBy WHEN 'CallDesc DESC' THEN [IT_CallView].[CallDesc] END DESC,
     CASE @OrderBy WHEN 'AssignedTo' THEN [IT_CallView].[AssignedTo] END,
     CASE @OrderBy WHEN 'AssignedTo DESC' THEN [IT_CallView].[AssignedTo] END DESC,
     CASE @OrderBy WHEN 'CallStatusID' THEN [IT_CallView].[CallStatusID] END,
     CASE @OrderBy WHEN 'CallStatusID DESC' THEN [IT_CallView].[CallStatusID] END DESC,
     CASE @OrderBy WHEN 'LoggedOn' THEN [IT_CallView].[LoggedOn] END,
     CASE @OrderBy WHEN 'LoggedOn DESC' THEN [IT_CallView].[LoggedOn] END DESC,
     CASE @OrderBy WHEN 'LoggedBy' THEN [IT_CallView].[LoggedBy] END,
     CASE @OrderBy WHEN 'LoggedBy DESC' THEN [IT_CallView].[LoggedBy] END DESC,
     CASE @OrderBy WHEN 'FirstAttendedOn' THEN [IT_CallView].[FirstAttendedOn] END,
     CASE @OrderBy WHEN 'FirstAttendedOn DESC' THEN [IT_CallView].[FirstAttendedOn] END DESC,
     CASE @OrderBy WHEN 'ClosedOn' THEN [IT_CallView].[ClosedOn] END,
     CASE @OrderBy WHEN 'ClosedOn DESC' THEN [IT_CallView].[ClosedOn] END DESC,
     CASE @OrderBy WHEN 'FirstAttended' THEN [IT_CallView].[FirstAttended] END,
     CASE @OrderBy WHEN 'FirstAttended DESC' THEN [IT_CallView].[FirstAttended] END DESC,
     CASE @OrderBy WHEN 'Closed' THEN [IT_CallView].[Closed] END,
     CASE @OrderBy WHEN 'Closed DESC' THEN [IT_CallView].[Closed] END DESC,
     CASE @OrderBy WHEN 'CallReceivedOn' THEN [IT_CallView].[CallReceivedOn] END,
     CASE @OrderBy WHEN 'CallReceivedOn DESC' THEN [IT_CallView].[CallReceivedOn] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IT_CallView].[CallID] ,
		[IT_CallView].[EndUserID] ,
		[IT_CallView].[EmployeeName] ,
		[IT_CallView].[DepartmentDescription] ,
		[IT_CallView].[Location] ,
		[IT_CallView].[CallTypeID] ,
		[IT_CallView].[CallDesc] ,
		[IT_CallView].[AssignedTo] ,
		[IT_CallView].[CallStatusID] ,
		[IT_CallView].[LoggedOn] ,
		[IT_CallView].[LoggedBy] ,
		[IT_CallView].[FirstAttendedOn] ,
		[IT_CallView].[ClosedOn] ,
		[IT_CallView].[FirstAttended] ,
		[IT_CallView].[Closed] ,
		[IT_CallView].[CallReceivedOn]  
  FROM [IT_CallView] 
    	INNER JOIN #PageIndex
          ON [IT_CallView].[CallID] = #PageIndex.CallID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
