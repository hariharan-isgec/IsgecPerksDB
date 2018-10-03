USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsSelectListSearch]
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
 ,ReasonID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReasonID)
  SELECT [VR_ODCReasons].[ReasonID] FROM [VR_ODCReasons]
 WHERE  
   ( 
         STR(ISNULL([VR_ODCReasons].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_ODCReasons].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [VR_ODCReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [VR_ODCReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_ODCReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_ODCReasons].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_ODCReasons].[ReasonID] ,
		[VR_ODCReasons].[Description]  
  FROM [VR_ODCReasons] 
    	INNER JOIN #PageIndex
          ON [VR_ODCReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
