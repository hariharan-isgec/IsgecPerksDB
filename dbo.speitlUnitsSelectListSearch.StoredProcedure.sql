USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsSelectListSearch]
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
 ,UnitID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (UnitID)
  SELECT [EITL_Units].[UnitID] FROM [EITL_Units]
 WHERE  
   ( 
         LOWER(ISNULL([EITL_Units].[UnitID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Units].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UnitID' THEN [EITL_Units].[UnitID] END,
     CASE @OrderBy WHEN 'UnitID DESC' THEN [EITL_Units].[UnitID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_Units].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_Units].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_Units].[UnitID] ,
		[EITL_Units].[Description]  
  FROM [EITL_Units] 
    	INNER JOIN #PageIndex
          ON [EITL_Units].[UnitID] = #PageIndex.UnitID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
