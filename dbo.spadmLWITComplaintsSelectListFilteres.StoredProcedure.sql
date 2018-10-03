USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWITComplaintsSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITComplaints].[CallID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITComplaints] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_ITComplaints].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_ITComplaints].[CallID] DESC'
                        WHEN 'EndUserID' THEN '[ADM_ITComplaints].[EndUserID]'
                        WHEN 'EndUserID DESC' THEN '[ADM_ITComplaints].[EndUserID] DESC'
                        WHEN 'CallTypeID' THEN '[ADM_ITComplaints].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_ITComplaints].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_ITComplaints].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITComplaints].[Description] DESC'
                        WHEN 'AssignedTo' THEN '[ADM_ITComplaints].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[ADM_ITComplaints].[AssignedTo] DESC'
                        WHEN 'CallStatusID' THEN '[ADM_ITComplaints].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_ITComplaints].[CallStatusID] DESC'
                        WHEN 'LoggedOn' THEN '[ADM_ITComplaints].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[ADM_ITComplaints].[LoggedOn] DESC'
                        WHEN 'LoggedBy' THEN '[ADM_ITComplaints].[LoggedBy]'
                        WHEN 'LoggedBy DESC' THEN '[ADM_ITComplaints].[LoggedBy] DESC'
                        WHEN 'FirstAttendedOn' THEN '[ADM_ITComplaints].[FirstAttendedOn]'
                        WHEN 'FirstAttendedOn DESC' THEN '[ADM_ITComplaints].[FirstAttendedOn] DESC'
                        WHEN 'ClosedOn' THEN '[ADM_ITComplaints].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[ADM_ITComplaints].[ClosedOn] DESC'
                        WHEN 'FirstAttended' THEN '[ADM_ITComplaints].[FirstAttended]'
                        WHEN 'FirstAttended DESC' THEN '[ADM_ITComplaints].[FirstAttended] DESC'
                        WHEN 'Closed' THEN '[ADM_ITComplaints].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_ITComplaints].[Closed] DESC'
                        ELSE '[ADM_ITComplaints].[CallID]'
                    END
  EXEC (@LGSQL)

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
