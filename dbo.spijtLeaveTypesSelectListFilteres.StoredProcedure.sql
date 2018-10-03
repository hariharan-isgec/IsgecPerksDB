USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtLeaveTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Applyiable Bit,
  @ForSite Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,LeaveTypeID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LeaveTypeID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_LeaveTypes].[LeaveTypeID]'  SET @LGSQL = @LGSQL + ' FROM [ATN_LeaveTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_LeaveTypes].[Applyiable] = ''' + CONVERT(NVarChar(10), @Applyiable) + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_LeaveTypes].[ForSite] = ''' + CONVERT(NVarChar(10), @ForSite) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveTypeID' THEN '[ATN_LeaveTypes].[LeaveTypeID]'
                        WHEN 'LeaveTypeID DESC' THEN '[ATN_LeaveTypes].[LeaveTypeID] DESC'
                        WHEN 'Description' THEN '[ATN_LeaveTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_LeaveTypes].[Description] DESC'
                        WHEN 'OBALApplicable' THEN '[ATN_LeaveTypes].[OBALApplicable]'
                        WHEN 'OBALApplicable DESC' THEN '[ATN_LeaveTypes].[OBALApplicable] DESC'
                        WHEN 'OBALMonthly' THEN '[ATN_LeaveTypes].[OBALMonthly]'
                        WHEN 'OBALMonthly DESC' THEN '[ATN_LeaveTypes].[OBALMonthly] DESC'
                        WHEN 'OpeningBalance' THEN '[ATN_LeaveTypes].[OpeningBalance]'
                        WHEN 'OpeningBalance DESC' THEN '[ATN_LeaveTypes].[OpeningBalance] DESC'
                        WHEN 'CarryForward' THEN '[ATN_LeaveTypes].[CarryForward]'
                        WHEN 'CarryForward DESC' THEN '[ATN_LeaveTypes].[CarryForward] DESC'
                        WHEN 'ForwardToLeaveTypeID' THEN '[ATN_LeaveTypes].[ForwardToLeaveTypeID]'
                        WHEN 'ForwardToLeaveTypeID DESC' THEN '[ATN_LeaveTypes].[ForwardToLeaveTypeID] DESC'
                        WHEN 'AdvanceApplicable' THEN '[ATN_LeaveTypes].[AdvanceApplicable]'
                        WHEN 'AdvanceApplicable DESC' THEN '[ATN_LeaveTypes].[AdvanceApplicable] DESC'
                        WHEN 'SpecialSanctionRequired' THEN '[ATN_LeaveTypes].[SpecialSanctionRequired]'
                        WHEN 'SpecialSanctionRequired DESC' THEN '[ATN_LeaveTypes].[SpecialSanctionRequired] DESC'
                        WHEN 'SpecialSanctionBy' THEN '[ATN_LeaveTypes].[SpecialSanctionBy]'
                        WHEN 'SpecialSanctionBy DESC' THEN '[ATN_LeaveTypes].[SpecialSanctionBy] DESC'
                        WHEN 'Applyiable' THEN '[ATN_LeaveTypes].[Applyiable]'
                        WHEN 'Applyiable DESC' THEN '[ATN_LeaveTypes].[Applyiable] DESC'
                        WHEN 'Postable' THEN '[ATN_LeaveTypes].[Postable]'
                        WHEN 'Postable DESC' THEN '[ATN_LeaveTypes].[Postable] DESC'
                        WHEN 'PostedLeaveTypeID' THEN '[ATN_LeaveTypes].[PostedLeaveTypeID]'
                        WHEN 'PostedLeaveTypeID DESC' THEN '[ATN_LeaveTypes].[PostedLeaveTypeID] DESC'
                        WHEN 'Sequence' THEN '[ATN_LeaveTypes].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[ATN_LeaveTypes].[Sequence] DESC'
                        WHEN 'MainType' THEN '[ATN_LeaveTypes].[MainType]'
                        WHEN 'MainType DESC' THEN '[ATN_LeaveTypes].[MainType] DESC'
                        WHEN 'ForSite' THEN '[ATN_LeaveTypes].[ForSite]'
                        WHEN 'ForSite DESC' THEN '[ATN_LeaveTypes].[ForSite] DESC'
                        ELSE '[ATN_LeaveTypes].[LeaveTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_LeaveTypes].[LeaveTypeID],
		[ATN_LeaveTypes].[Description],
		[ATN_LeaveTypes].[OBALApplicable],
		[ATN_LeaveTypes].[OBALMonthly],
		[ATN_LeaveTypes].[OpeningBalance],
		[ATN_LeaveTypes].[CarryForward],
		[ATN_LeaveTypes].[ForwardToLeaveTypeID],
		[ATN_LeaveTypes].[AdvanceApplicable],
		[ATN_LeaveTypes].[SpecialSanctionRequired],
		[ATN_LeaveTypes].[SpecialSanctionBy],
		[ATN_LeaveTypes].[Applyiable],
		[ATN_LeaveTypes].[Postable],
		[ATN_LeaveTypes].[PostedLeaveTypeID],
		[ATN_LeaveTypes].[Sequence],
		[ATN_LeaveTypes].[MainType],
		[ATN_LeaveTypes].[ForSite] 
  FROM [ATN_LeaveTypes] 
    	INNER JOIN #PageIndex
          ON [ATN_LeaveTypes].[LeaveTypeID] = #PageIndex.LeaveTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
