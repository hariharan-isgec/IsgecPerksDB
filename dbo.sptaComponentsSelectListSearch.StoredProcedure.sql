USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsSelectListSearch]
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
 ,ComponentID Int NOT NULL
  )
  INSERT INTO #PageIndex (ComponentID)
  SELECT [TA_Components].[ComponentID] FROM [TA_Components]
 WHERE  
   ( 
         STR(ISNULL([TA_Components].[ComponentID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Components].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ComponentID' THEN [TA_Components].[ComponentID] END,
     CASE @OrderBy WHEN 'ComponentID DESC' THEN [TA_Components].[ComponentID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_Components].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_Components].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_Components].[ComponentID] ,
		[TA_Components].[Description]  
  FROM [TA_Components] 
      INNER JOIN #PageIndex
          ON [TA_Components].[ComponentID] = #PageIndex.ComponentID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
