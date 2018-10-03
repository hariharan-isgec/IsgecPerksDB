USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SoftwareID NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SoftwareID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstSoftwares].[SoftwareID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstSoftwares] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SoftwareID' THEN '[ASM_AstSoftwares].[SoftwareID]'
                        WHEN 'SoftwareID DESC' THEN '[ASM_AstSoftwares].[SoftwareID] DESC'
                        WHEN 'Description' THEN '[ASM_AstSoftwares].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstSoftwares].[Description] DESC'
                        ELSE '[ASM_AstSoftwares].[SoftwareID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstSoftwares].[SoftwareID],
		[ASM_AstSoftwares].[Description] 
  FROM [ASM_AstSoftwares] 
    	INNER JOIN #PageIndex
          ON [ASM_AstSoftwares].[SoftwareID] = #PageIndex.SoftwareID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
