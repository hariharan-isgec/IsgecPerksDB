USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINSelectListFilteres]
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
 ,GSTID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GSTID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_IsgecGSTIN].[GSTID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_IsgecGSTIN] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GSTID' THEN '[SPMT_IsgecGSTIN].[GSTID]'
                        WHEN 'GSTID DESC' THEN '[SPMT_IsgecGSTIN].[GSTID] DESC'
                        WHEN 'Description' THEN '[SPMT_IsgecGSTIN].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_IsgecGSTIN].[Description] DESC'
                        WHEN 'State' THEN '[SPMT_IsgecGSTIN].[State]'
                        WHEN 'State DESC' THEN '[SPMT_IsgecGSTIN].[State] DESC'
                        ELSE '[SPMT_IsgecGSTIN].[GSTID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_IsgecGSTIN].*  
  FROM [SPMT_IsgecGSTIN] 
      INNER JOIN #PageIndex
          ON [SPMT_IsgecGSTIN].[GSTID] = #PageIndex.GSTID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
