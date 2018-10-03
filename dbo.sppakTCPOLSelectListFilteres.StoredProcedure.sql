USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLSelectListFilteres]
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
 ,ItemNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POLine].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLine].[ItemNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POLine] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLine].[ItemElement] = [IDM_WBS1].[WBSID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLine].[SerialNo] = [PAK_PO2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POLineStatus] AS [PAK_POLineStatus3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLine].[ItemStatusID] = [PAK_POLineStatus3].[ItemStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLine].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POLine].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POLine].[SerialNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POLine].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POLine].[ItemNo] DESC'
                        WHEN 'ItemCode' THEN '[PAK_POLine].[ItemCode]'
                        WHEN 'ItemCode DESC' THEN '[PAK_POLine].[ItemCode] DESC'
                        WHEN 'ItemDescription' THEN '[PAK_POLine].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[PAK_POLine].[ItemDescription] DESC'
                        WHEN 'ItemQuantity' THEN '[PAK_POLine].[ItemQuantity]'
                        WHEN 'ItemQuantity DESC' THEN '[PAK_POLine].[ItemQuantity] DESC'
                        WHEN 'ItemUnit' THEN '[PAK_POLine].[ItemUnit]'
                        WHEN 'ItemUnit DESC' THEN '[PAK_POLine].[ItemUnit] DESC'
                        WHEN 'ItemPrice' THEN '[PAK_POLine].[ItemPrice]'
                        WHEN 'ItemPrice DESC' THEN '[PAK_POLine].[ItemPrice] DESC'
                        WHEN 'ItemAmount' THEN '[PAK_POLine].[ItemAmount]'
                        WHEN 'ItemAmount DESC' THEN '[PAK_POLine].[ItemAmount] DESC'
                        WHEN 'ItemElement' THEN '[PAK_POLine].[ItemElement]'
                        WHEN 'ItemElement DESC' THEN '[PAK_POLine].[ItemElement] DESC'
                        WHEN 'ItemStatusID' THEN '[PAK_POLine].[ItemStatusID]'
                        WHEN 'ItemStatusID DESC' THEN '[PAK_POLine].[ItemStatusID] DESC'
                        WHEN 'IDM_WBS1_Description' THEN '[IDM_WBS1].[Description]'
                        WHEN 'IDM_WBS1_Description DESC' THEN '[IDM_WBS1].[Description] DESC'
                        WHEN 'PAK_PO2_PODescription' THEN '[PAK_PO2].[PODescription]'
                        WHEN 'PAK_PO2_PODescription DESC' THEN '[PAK_PO2].[PODescription] DESC'
                        WHEN 'PAK_POLineStatus3_Description' THEN '[PAK_POLineStatus3].[Description]'
                        WHEN 'PAK_POLineStatus3_Description DESC' THEN '[PAK_POLineStatus3].[Description] DESC'
                        ELSE '[PAK_POLine].[SerialNo],[PAK_POLine].[ItemNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POLine].* ,
    [IDM_WBS1].[Description] AS IDM_WBS1_Description,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POLineStatus3].[Description] AS PAK_POLineStatus3_Description 
  FROM [PAK_POLine] 
      INNER JOIN #PageIndex
          ON [PAK_POLine].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POLine].[ItemNo] = #PageIndex.ItemNo
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS1]
    ON [PAK_POLine].[ItemElement] = [IDM_WBS1].[WBSID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_POLine].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_POLineStatus] AS [PAK_POLineStatus3]
    ON [PAK_POLine].[ItemStatusID] = [PAK_POLineStatus3].[ItemStatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
