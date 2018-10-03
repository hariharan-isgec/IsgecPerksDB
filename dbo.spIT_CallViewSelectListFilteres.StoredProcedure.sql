USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIT_CallViewSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IT_CallView].[CallID]'
  SET @LGSQL = @LGSQL + ' FROM [IT_CallView] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[IT_CallView].[CallID]'
                        WHEN 'CallID DESC' THEN '[IT_CallView].[CallID] DESC'
                        WHEN 'EndUserID' THEN '[IT_CallView].[EndUserID]'
                        WHEN 'EndUserID DESC' THEN '[IT_CallView].[EndUserID] DESC'
                        WHEN 'EmployeeName' THEN '[IT_CallView].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[IT_CallView].[EmployeeName] DESC'
                        WHEN 'DepartmentDescription' THEN '[IT_CallView].[DepartmentDescription]'
                        WHEN 'DepartmentDescription DESC' THEN '[IT_CallView].[DepartmentDescription] DESC'
                        WHEN 'Location' THEN '[IT_CallView].[Location]'
                        WHEN 'Location DESC' THEN '[IT_CallView].[Location] DESC'
                        WHEN 'CallTypeID' THEN '[IT_CallView].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[IT_CallView].[CallTypeID] DESC'
                        WHEN 'CallDesc' THEN '[IT_CallView].[CallDesc]'
                        WHEN 'CallDesc DESC' THEN '[IT_CallView].[CallDesc] DESC'
                        WHEN 'AssignedTo' THEN '[IT_CallView].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[IT_CallView].[AssignedTo] DESC'
                        WHEN 'CallStatusID' THEN '[IT_CallView].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[IT_CallView].[CallStatusID] DESC'
                        WHEN 'LoggedOn' THEN '[IT_CallView].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[IT_CallView].[LoggedOn] DESC'
                        WHEN 'LoggedBy' THEN '[IT_CallView].[LoggedBy]'
                        WHEN 'LoggedBy DESC' THEN '[IT_CallView].[LoggedBy] DESC'
                        WHEN 'FirstAttendedOn' THEN '[IT_CallView].[FirstAttendedOn]'
                        WHEN 'FirstAttendedOn DESC' THEN '[IT_CallView].[FirstAttendedOn] DESC'
                        WHEN 'ClosedOn' THEN '[IT_CallView].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[IT_CallView].[ClosedOn] DESC'
                        WHEN 'FirstAttended' THEN '[IT_CallView].[FirstAttended]'
                        WHEN 'FirstAttended DESC' THEN '[IT_CallView].[FirstAttended] DESC'
                        WHEN 'Closed' THEN '[IT_CallView].[Closed]'
                        WHEN 'Closed DESC' THEN '[IT_CallView].[Closed] DESC'
                        WHEN 'CallReceivedOn' THEN '[IT_CallView].[CallReceivedOn]'
                        WHEN 'CallReceivedOn DESC' THEN '[IT_CallView].[CallReceivedOn] DESC'
                        ELSE '[IT_CallView].[CallID]'
                    END
  EXEC (@LGSQL)

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
