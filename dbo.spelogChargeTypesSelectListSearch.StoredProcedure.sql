USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesSelectListSearch]
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
 ,ChargeTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (ChargeTypeID)
  SELECT [ELOG_ChargeTypes].[ChargeTypeID] FROM [ELOG_ChargeTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_ChargeTypes].[ChargeTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_ChargeTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ChargeTypeID' THEN [ELOG_ChargeTypes].[ChargeTypeID] END,
     CASE @OrderBy WHEN 'ChargeTypeID DESC' THEN [ELOG_ChargeTypes].[ChargeTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ChargeTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ChargeTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ChargeTypes].*  
  FROM [ELOG_ChargeTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_ChargeTypes].[ChargeTypeID] = #PageIndex.ChargeTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
