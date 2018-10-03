USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencySelectListFilteres]
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
 ,ResponsibleAgencyID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ResponsibleAgencyID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_ResponsibleAgency].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_ResponsibleAgency] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ResponsibleAgencyID' THEN '[IDM_ResponsibleAgency].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[IDM_ResponsibleAgency].[ResponsibleAgencyID] DESC'
                        WHEN 'Description' THEN '[IDM_ResponsibleAgency].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_ResponsibleAgency].[Description] DESC'
                        ELSE '[IDM_ResponsibleAgency].[ResponsibleAgencyID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [IDM_ResponsibleAgency].*  
  FROM [IDM_ResponsibleAgency] 
      INNER JOIN #PageIndex
          ON [IDM_ResponsibleAgency].[ResponsibleAgencyID] = #PageIndex.ResponsibleAgencyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
