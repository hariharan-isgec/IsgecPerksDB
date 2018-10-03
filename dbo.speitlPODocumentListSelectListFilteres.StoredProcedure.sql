USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentListSelectListFilteres]
  @Filter_SerialNo Int,
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
 ,SerialNo Int NOT NULL
 ,DocumentLineNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', DocumentLineNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_PODocumentList].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [EITL_PODocumentList].[DocumentLineNo]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_PODocumentList] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [EITL_POList] AS [EITL_POList1]'
  SET @LGSQL = @LGSQL + '    ON [EITL_PODocumentList].[SerialNo] = [EITL_POList1].[SerialNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_PODocumentList].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[EITL_PODocumentList].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[EITL_PODocumentList].[SerialNo] DESC'
                        WHEN 'DocumentLineNo' THEN '[EITL_PODocumentList].[DocumentLineNo]'
                        WHEN 'DocumentLineNo DESC' THEN '[EITL_PODocumentList].[DocumentLineNo] DESC'
                        WHEN 'DocumentID' THEN '[EITL_PODocumentList].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[EITL_PODocumentList].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[EITL_PODocumentList].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[EITL_PODocumentList].[RevisionNo] DESC'
                        WHEN 'Description' THEN '[EITL_PODocumentList].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_PODocumentList].[Description] DESC'
                        WHEN 'ReadyToDespatch' THEN '[EITL_PODocumentList].[ReadyToDespatch]'
                        WHEN 'ReadyToDespatch DESC' THEN '[EITL_PODocumentList].[ReadyToDespatch] DESC'
                        WHEN 'Despatched' THEN '[EITL_PODocumentList].[Despatched]'
                        WHEN 'Despatched DESC' THEN '[EITL_PODocumentList].[Despatched] DESC'
                        WHEN 'DespatchDate' THEN '[EITL_PODocumentList].[DespatchDate]'
                        WHEN 'DespatchDate DESC' THEN '[EITL_PODocumentList].[DespatchDate] DESC'
                        WHEN 'EITL_POList1_PONumber' THEN '[EITL_POList1].[PONumber]'
                        WHEN 'EITL_POList1_PONumber DESC' THEN '[EITL_POList1].[PONumber] DESC'
                        ELSE '[EITL_PODocumentList].[SerialNo],[EITL_PODocumentList].[DocumentLineNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_PODocumentList].[SerialNo] ,
		[EITL_PODocumentList].[DocumentLineNo] ,
		[EITL_PODocumentList].[DocumentID] ,
		[EITL_PODocumentList].[RevisionNo] ,
		[EITL_PODocumentList].[Description] ,
		[EITL_PODocumentList].[ReadyToDespatch] ,
		[EITL_PODocumentList].[Despatched] ,
		[EITL_PODocumentList].[DespatchDate] ,
		[EITL_POList1].[PONumber] AS EITL_POList1_PONumber 
  FROM [EITL_PODocumentList] 
    	INNER JOIN #PageIndex
          ON [EITL_PODocumentList].[SerialNo] = #PageIndex.SerialNo
          AND [EITL_PODocumentList].[DocumentLineNo] = #PageIndex.DocumentLineNo
  INNER JOIN [EITL_POList] AS [EITL_POList1]
    ON [EITL_PODocumentList].[SerialNo] = [EITL_POList1].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
