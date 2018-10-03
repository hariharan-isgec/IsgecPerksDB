USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,BLID NVarChar(9) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (BLID, SerialNo)
  SELECT [ELOG_BLDetails].[BLID], [ELOG_BLDetails].[SerialNo] FROM [ELOG_BLDetails]
  INNER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader1]
    ON [ELOG_BLDetails].[BLID] = [ELOG_BLHeader1].[BLID]
 WHERE  
   ( 
         LOWER(ISNULL([ELOG_BLDetails].[BLID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_BLDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_BLDetails].[SizeAndTypeOfContainer],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_BLDetails].[ContainerNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_BLDetails].[Remarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BLID' THEN [ELOG_BLDetails].[BLID] END,
     CASE @OrderBy WHEN 'BLID DESC' THEN [ELOG_BLDetails].[BLID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [ELOG_BLDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ELOG_BLDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'SizeAndTypeOfContainer' THEN [ELOG_BLDetails].[SizeAndTypeOfContainer] END,
     CASE @OrderBy WHEN 'SizeAndTypeOfContainer DESC' THEN [ELOG_BLDetails].[SizeAndTypeOfContainer] END DESC,
     CASE @OrderBy WHEN 'ContainerNumber' THEN [ELOG_BLDetails].[ContainerNumber] END,
     CASE @OrderBy WHEN 'ContainerNumber DESC' THEN [ELOG_BLDetails].[ContainerNumber] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ELOG_BLDetails].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ELOG_BLDetails].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ELOG_BLHeader1_BLNumber' THEN [ELOG_BLHeader1].[BLNumber] END,
     CASE @OrderBy WHEN 'ELOG_BLHeader1_BLNumber DESC' THEN [ELOG_BLHeader1].[BLNumber] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BLDetails].* ,
    [ELOG_BLHeader1].[BLNumber] AS ELOG_BLHeader1_BLNumber 
  FROM [ELOG_BLDetails] 
      INNER JOIN #PageIndex
          ON [ELOG_BLDetails].[BLID] = #PageIndex.BLID
          AND [ELOG_BLDetails].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader1]
    ON [ELOG_BLDetails].[BLID] = [ELOG_BLHeader1].[BLID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
