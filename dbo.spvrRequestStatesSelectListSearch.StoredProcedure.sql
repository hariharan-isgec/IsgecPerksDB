USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [VR_RequestStates].[StatusID] FROM [VR_RequestStates]
 WHERE  
   ( 
         STR(ISNULL([VR_RequestStates].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [VR_RequestStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [VR_RequestStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_RequestStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_RequestStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_RequestStates].[StatusID] ,
		[VR_RequestStates].[Description]  
  FROM [VR_RequestStates] 
    	INNER JOIN #PageIndex
          ON [VR_RequestStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
