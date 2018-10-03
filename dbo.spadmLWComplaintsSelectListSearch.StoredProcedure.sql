USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWComplaintsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallID)
  SELECT [ADM_Complaints].[CallID] FROM [ADM_Complaints]
 WHERE  
   ( 
         STR(ISNULL([ADM_Complaints].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[EndUserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[AssignedTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[LoggedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [ADM_Complaints].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [ADM_Complaints].[CallID] END DESC,
     CASE @orderBy WHEN 'EndUserID' THEN [ADM_Complaints].[EndUserID] END,
     CASE @orderBy WHEN 'EndUserID DESC' THEN [ADM_Complaints].[EndUserID] END DESC,
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_Complaints].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_Complaints].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Complaints].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Complaints].[Description] END DESC,
     CASE @orderBy WHEN 'AssignedTo' THEN [ADM_Complaints].[AssignedTo] END,
     CASE @orderBy WHEN 'AssignedTo DESC' THEN [ADM_Complaints].[AssignedTo] END DESC,
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_Complaints].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_Complaints].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'LoggedOn' THEN [ADM_Complaints].[LoggedOn] END,
     CASE @orderBy WHEN 'LoggedOn DESC' THEN [ADM_Complaints].[LoggedOn] END DESC,
     CASE @orderBy WHEN 'LoggedBy' THEN [ADM_Complaints].[LoggedBy] END,
     CASE @orderBy WHEN 'LoggedBy DESC' THEN [ADM_Complaints].[LoggedBy] END DESC,
     CASE @orderBy WHEN 'FirstAttendedOn' THEN [ADM_Complaints].[FirstAttendedOn] END,
     CASE @orderBy WHEN 'FirstAttendedOn DESC' THEN [ADM_Complaints].[FirstAttendedOn] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [ADM_Complaints].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [ADM_Complaints].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'FirstAttended' THEN [ADM_Complaints].[FirstAttended] END,
     CASE @orderBy WHEN 'FirstAttended DESC' THEN [ADM_Complaints].[FirstAttended] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_Complaints].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_Complaints].[Closed] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_Complaints].[CallID],
		[ADM_Complaints].[EndUserID],
		[ADM_Complaints].[CallTypeID],
		[ADM_Complaints].[Description],
		[ADM_Complaints].[AssignedTo],
		[ADM_Complaints].[CallStatusID],
		[ADM_Complaints].[LoggedOn],
		[ADM_Complaints].[LoggedBy],
		[ADM_Complaints].[FirstAttendedOn],
		[ADM_Complaints].[ClosedOn],
		[ADM_Complaints].[FirstAttended],
		[ADM_Complaints].[Closed] 
  FROM [ADM_Complaints] 
    	INNER JOIN #PageIndex
          ON [ADM_Complaints].[CallID] = #PageIndex.CallID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
