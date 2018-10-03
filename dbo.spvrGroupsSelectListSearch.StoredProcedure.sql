USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsSelectListSearch]
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
 ,GroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (GroupID)
  SELECT [VR_Groups].[GroupID] FROM [VR_Groups]
 WHERE  
   ( 
         STR(ISNULL([VR_Groups].[GroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Groups].[GroupName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [VR_Groups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [VR_Groups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'GroupName' THEN [VR_Groups].[GroupName] END,
     CASE @OrderBy WHEN 'GroupName DESC' THEN [VR_Groups].[GroupName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_Groups].[GroupID] ,
		[VR_Groups].[GroupName]  
  FROM [VR_Groups] 
    	INNER JOIN #PageIndex
          ON [VR_Groups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
