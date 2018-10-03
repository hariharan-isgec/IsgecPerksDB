USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsSelectListSearch]
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
 ,GroupID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (GroupID)
  SELECT [SYS_Groups].[GroupID] FROM [SYS_Groups]
 WHERE  
   ( 
         LOWER(ISNULL([SYS_Groups].[GroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Groups].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [SYS_Groups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [SYS_Groups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_Groups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_Groups].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [SYS_Groups].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [SYS_Groups].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_Groups].*  
  FROM [SYS_Groups] 
      INNER JOIN #PageIndex
          ON [SYS_Groups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
