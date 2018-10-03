USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesSelectListFilteres]
  @Filter_GLCode NVarChar(7),
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
 ,GLCode NVarChar(7) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GLCode'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ERPGLCodes].[GLCode]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ERPGLCodes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GLCode > '') 
    SET @LGSQL = @LGSQL + ' AND [COST_ERPGLCodes].[GLCode] = ''' + @Filter_GLCode + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GLCode' THEN '[COST_ERPGLCodes].[GLCode]'
                        WHEN 'GLCode DESC' THEN '[COST_ERPGLCodes].[GLCode] DESC'
                        WHEN 'GLDescription' THEN '[COST_ERPGLCodes].[GLDescription]'
                        WHEN 'GLDescription DESC' THEN '[COST_ERPGLCodes].[GLDescription] DESC'
                        ELSE '[COST_ERPGLCodes].[GLCode]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ERPGLCodes].*  
  FROM [COST_ERPGLCodes] 
      INNER JOIN #PageIndex
          ON [COST_ERPGLCodes].[GLCode] = #PageIndex.GLCode
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
