USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeSelectListFilteres]
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
 ,PurposeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PurposeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_Purpose].[PurposeID]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_Purpose] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PurposeID' THEN '[QAP_Purpose].[PurposeID]'
                        WHEN 'PurposeID DESC' THEN '[QAP_Purpose].[PurposeID] DESC'
                        WHEN 'PurposeName' THEN '[QAP_Purpose].[PurposeName]'
                        WHEN 'PurposeName DESC' THEN '[QAP_Purpose].[PurposeName] DESC'
                        ELSE '[QAP_Purpose].[PurposeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
    	INNER JOIN #PageIndex
          ON [QAP_Purpose].[PurposeID] = #PageIndex.PurposeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
