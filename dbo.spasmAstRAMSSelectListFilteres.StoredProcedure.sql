USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RAMID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RAMID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstRAMS].[RAMID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstRAMS] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RAMID' THEN '[ASM_AstRAMS].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstRAMS].[RAMID] DESC'
                        WHEN 'Description' THEN '[ASM_AstRAMS].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstRAMS].[Description] DESC'
                        ELSE '[ASM_AstRAMS].[RAMID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstRAMS].[RAMID],
		[ASM_AstRAMS].[Description] 
  FROM [ASM_AstRAMS] 
    	INNER JOIN #PageIndex
          ON [ASM_AstRAMS].[RAMID] = #PageIndex.RAMID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
