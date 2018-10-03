USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[PAK_ResponsibleAgencies].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_ResponsibleAgencies] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ResponsibleAgencyID' THEN '[PAK_ResponsibleAgencies].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[PAK_ResponsibleAgencies].[ResponsibleAgencyID] DESC'
                        WHEN 'Description' THEN '[PAK_ResponsibleAgencies].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_ResponsibleAgencies].[Description] DESC'
                        WHEN 'ExternalAgency' THEN '[PAK_ResponsibleAgencies].[ExternalAgency]'
                        WHEN 'ExternalAgency DESC' THEN '[PAK_ResponsibleAgencies].[ExternalAgency] DESC'
                        ELSE '[PAK_ResponsibleAgencies].[ResponsibleAgencyID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_ResponsibleAgencies].*  
  FROM [PAK_ResponsibleAgencies] 
      INNER JOIN #PageIndex
          ON [PAK_ResponsibleAgencies].[ResponsibleAgencyID] = #PageIndex.ResponsibleAgencyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
