USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWComplaintsSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ADM_Complaints].[CallID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Complaints] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_Complaints].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_Complaints].[CallID] DESC'
                        WHEN 'EndUserID' THEN '[ADM_Complaints].[EndUserID]'
                        WHEN 'EndUserID DESC' THEN '[ADM_Complaints].[EndUserID] DESC'
                        WHEN 'CallTypeID' THEN '[ADM_Complaints].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_Complaints].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_Complaints].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_Complaints].[Description] DESC'
                        WHEN 'AssignedTo' THEN '[ADM_Complaints].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[ADM_Complaints].[AssignedTo] DESC'
                        WHEN 'CallStatusID' THEN '[ADM_Complaints].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_Complaints].[CallStatusID] DESC'
                        WHEN 'LoggedOn' THEN '[ADM_Complaints].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[ADM_Complaints].[LoggedOn] DESC'
                        WHEN 'LoggedBy' THEN '[ADM_Complaints].[LoggedBy]'
                        WHEN 'LoggedBy DESC' THEN '[ADM_Complaints].[LoggedBy] DESC'
                        WHEN 'FirstAttendedOn' THEN '[ADM_Complaints].[FirstAttendedOn]'
                        WHEN 'FirstAttendedOn DESC' THEN '[ADM_Complaints].[FirstAttendedOn] DESC'
                        WHEN 'ClosedOn' THEN '[ADM_Complaints].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[ADM_Complaints].[ClosedOn] DESC'
                        WHEN 'FirstAttended' THEN '[ADM_Complaints].[FirstAttended]'
                        WHEN 'FirstAttended DESC' THEN '[ADM_Complaints].[FirstAttended] DESC'
                        WHEN 'Closed' THEN '[ADM_Complaints].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_Complaints].[Closed] DESC'
                        ELSE '[ADM_Complaints].[CallID]'
                    END
  EXEC (@LGSQL)

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
