USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesSelectListSearch]
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
 ,CargoTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (CargoTypeID)
  SELECT [ELOG_CargoTypes].[CargoTypeID] FROM [ELOG_CargoTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_CargoTypes].[CargoTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_CargoTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CargoTypeID' THEN [ELOG_CargoTypes].[CargoTypeID] END,
     CASE @OrderBy WHEN 'CargoTypeID DESC' THEN [ELOG_CargoTypes].[CargoTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_CargoTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_CargoTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_CargoTypes].*  
  FROM [ELOG_CargoTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_CargoTypes].[CargoTypeID] = #PageIndex.CargoTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
