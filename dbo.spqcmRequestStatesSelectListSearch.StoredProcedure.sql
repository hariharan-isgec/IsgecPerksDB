USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesSelectListSearch]
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
 ,StateID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (StateID)
  SELECT [QCM_RequestStates].[StateID] FROM [QCM_RequestStates]
 WHERE  
   ( 
         LOWER(ISNULL([QCM_RequestStates].[StateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_RequestStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [QCM_RequestStates].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [QCM_RequestStates].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_RequestStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_RequestStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_RequestStates].[StateID] ,
		[QCM_RequestStates].[Description]  
  FROM [QCM_RequestStates] 
    	INNER JOIN #PageIndex
          ON [QCM_RequestStates].[StateID] = #PageIndex.StateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
