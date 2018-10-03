USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaSelectListSearch]
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
 ,FunctionalAreaID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (FunctionalAreaID)
  SELECT [TOS_FunctionalArea].[FunctionalAreaID] FROM [TOS_FunctionalArea]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_FunctionalArea].[FunctionalAreaID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_FunctionalArea].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FunctionalAreaID' THEN [TOS_FunctionalArea].[FunctionalAreaID] END,
     CASE @OrderBy WHEN 'FunctionalAreaID DESC' THEN [TOS_FunctionalArea].[FunctionalAreaID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_FunctionalArea].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_FunctionalArea].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_FunctionalArea].[FunctionalAreaID] ,
		[TOS_FunctionalArea].[Description]  
  FROM [TOS_FunctionalArea] 
    	INNER JOIN #PageIndex
          ON [TOS_FunctionalArea].[FunctionalAreaID] = #PageIndex.FunctionalAreaID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
