USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  JoiningStateID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (JoiningStateID)
  SELECT [HRM_JoiningStates].[JoiningStateID] FROM [HRM_JoiningStates]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_JoiningStates].[JoiningStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_JoiningStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'JoiningStateID' THEN [HRM_JoiningStates].[JoiningStateID] END,
     CASE @orderBy WHEN 'JoiningStateID DESC' THEN [HRM_JoiningStates].[JoiningStateID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_JoiningStates].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_JoiningStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_JoiningStates].[JoiningStateID],
		[HRM_JoiningStates].[Description] 
  FROM [HRM_JoiningStates] 
    	INNER JOIN #PageIndex
          ON [HRM_JoiningStates].[JoiningStateID] = #PageIndex.JoiningStateID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
