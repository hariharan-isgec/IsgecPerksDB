USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWITComplaintsSelectListSearch]
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
  SELECT [ADM_ITComplaints].[CallID] FROM [ADM_ITComplaints]
 WHERE  
   ( 
         STR(ISNULL([ADM_ITComplaints].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[EndUserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[AssignedTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[LoggedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [ADM_ITComplaints].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [ADM_ITComplaints].[CallID] END DESC,
     CASE @orderBy WHEN 'EndUserID' THEN [ADM_ITComplaints].[EndUserID] END,
     CASE @orderBy WHEN 'EndUserID DESC' THEN [ADM_ITComplaints].[EndUserID] END DESC,
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_ITComplaints].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_ITComplaints].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITComplaints].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITComplaints].[Description] END DESC,
     CASE @orderBy WHEN 'AssignedTo' THEN [ADM_ITComplaints].[AssignedTo] END,
     CASE @orderBy WHEN 'AssignedTo DESC' THEN [ADM_ITComplaints].[AssignedTo] END DESC,
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_ITComplaints].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_ITComplaints].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'LoggedOn' THEN [ADM_ITComplaints].[LoggedOn] END,
     CASE @orderBy WHEN 'LoggedOn DESC' THEN [ADM_ITComplaints].[LoggedOn] END DESC,
     CASE @orderBy WHEN 'LoggedBy' THEN [ADM_ITComplaints].[LoggedBy] END,
     CASE @orderBy WHEN 'LoggedBy DESC' THEN [ADM_ITComplaints].[LoggedBy] END DESC,
     CASE @orderBy WHEN 'FirstAttendedOn' THEN [ADM_ITComplaints].[FirstAttendedOn] END,
     CASE @orderBy WHEN 'FirstAttendedOn DESC' THEN [ADM_ITComplaints].[FirstAttendedOn] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [ADM_ITComplaints].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [ADM_ITComplaints].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'FirstAttended' THEN [ADM_ITComplaints].[FirstAttended] END,
     CASE @orderBy WHEN 'FirstAttended DESC' THEN [ADM_ITComplaints].[FirstAttended] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_ITComplaints].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_ITComplaints].[Closed] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITComplaints].[CallID],
		[ADM_ITComplaints].[EndUserID],
		[ADM_ITComplaints].[CallTypeID],
		[ADM_ITComplaints].[Description],
		[ADM_ITComplaints].[AssignedTo],
		[ADM_ITComplaints].[CallStatusID],
		[ADM_ITComplaints].[LoggedOn],
		[ADM_ITComplaints].[LoggedBy],
		[ADM_ITComplaints].[FirstAttendedOn],
		[ADM_ITComplaints].[ClosedOn],
		[ADM_ITComplaints].[FirstAttended],
		[ADM_ITComplaints].[Closed] 
  FROM [ADM_ITComplaints] 
    	INNER JOIN #PageIndex
          ON [ADM_ITComplaints].[CallID] = #PageIndex.CallID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
