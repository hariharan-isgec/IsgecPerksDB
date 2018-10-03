USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkStatus]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [PRK_Status].[StatusID] FROM [PRK_Status]
  WHERE STR(ISNULL([PRK_Status].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Status].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Status].[StatusID] AS SearchCode, 
  ISNULL([PRK_Status].[Description],'') 
  AS SearchDescription 
  FROM [PRK_Status] 
    	INNER JOIN #PageIndex
          ON [PRK_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
