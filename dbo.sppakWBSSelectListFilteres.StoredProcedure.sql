USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakWBSSelectListFilteres]
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
 ,WBSID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'WBSID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_WBS].[WBSID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_WBS] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_WBS].[ResponsibleAgencyID] = [IDM_ResponsibleAgency1].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WBSID' THEN '[IDM_WBS].[WBSID]'
                        WHEN 'WBSID DESC' THEN '[IDM_WBS].[WBSID] DESC'
                        WHEN 'Description' THEN '[IDM_WBS].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_WBS].[Description] DESC'
                        WHEN 'WBSLevel' THEN '[IDM_WBS].[WBSLevel]'
                        WHEN 'WBSLevel DESC' THEN '[IDM_WBS].[WBSLevel] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[IDM_WBS].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[IDM_WBS].[ResponsibleAgencyID] DESC'
                        WHEN 'IDM_ResponsibleAgency1_Description' THEN '[IDM_ResponsibleAgency1].[Description]'
                        WHEN 'IDM_ResponsibleAgency1_Description DESC' THEN '[IDM_ResponsibleAgency1].[Description] DESC'
                        ELSE '[IDM_WBS].[WBSID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [IDM_WBS].* ,
    [IDM_ResponsibleAgency1].[Description] AS IDM_ResponsibleAgency1_Description 
  FROM [IDM_WBS] 
      INNER JOIN #PageIndex
          ON [IDM_WBS].[WBSID] = #PageIndex.WBSID
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency1]
    ON [IDM_WBS].[ResponsibleAgencyID] = [IDM_ResponsibleAgency1].[ResponsibleAgencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
