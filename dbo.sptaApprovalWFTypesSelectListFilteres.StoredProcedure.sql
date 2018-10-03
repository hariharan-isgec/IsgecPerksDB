USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesSelectListFilteres]
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
 ,WFTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'WFTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_ApprovalWFTypes].[WFTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_ApprovalWFTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WFTypeID' THEN '[TA_ApprovalWFTypes].[WFTypeID]'
                        WHEN 'WFTypeID DESC' THEN '[TA_ApprovalWFTypes].[WFTypeID] DESC'
                        WHEN 'WFTypeDescription' THEN '[TA_ApprovalWFTypes].[WFTypeDescription]'
                        WHEN 'WFTypeDescription DESC' THEN '[TA_ApprovalWFTypes].[WFTypeDescription] DESC'
                        WHEN 'RequiredDivisionHeadApproval' THEN '[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval]'
                        WHEN 'RequiredDivisionHeadApproval DESC' THEN '[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] DESC'
                        WHEN 'RequiredMDApproval' THEN '[TA_ApprovalWFTypes].[RequiredMDApproval]'
                        WHEN 'RequiredMDApproval DESC' THEN '[TA_ApprovalWFTypes].[RequiredMDApproval] DESC'
                        ELSE '[TA_ApprovalWFTypes].[WFTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_ApprovalWFTypes].[WFTypeID] ,
		[TA_ApprovalWFTypes].[WFTypeDescription] ,
		[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] ,
		[TA_ApprovalWFTypes].[RequiredMDApproval]  
  FROM [TA_ApprovalWFTypes] 
      INNER JOIN #PageIndex
          ON [TA_ApprovalWFTypes].[WFTypeID] = #PageIndex.WFTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
