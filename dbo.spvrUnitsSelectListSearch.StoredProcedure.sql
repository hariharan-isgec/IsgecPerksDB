USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsSelectListSearch]
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
 ,UnitID Int NOT NULL
  )
  INSERT INTO #PageIndex (UnitID)
  SELECT [VR_Units].[UnitID] FROM [VR_Units]
 WHERE  
   ( 
         STR(ISNULL([VR_Units].[UnitID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Units].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_Units].[ConversionFactor], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UnitID' THEN [VR_Units].[UnitID] END,
     CASE @OrderBy WHEN 'UnitID DESC' THEN [VR_Units].[UnitID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_Units].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_Units].[Description] END DESC,
     CASE @OrderBy WHEN 'ConversionFactor' THEN [VR_Units].[ConversionFactor] END,
     CASE @OrderBy WHEN 'ConversionFactor DESC' THEN [VR_Units].[ConversionFactor] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_Units].[UnitID] ,
		[VR_Units].[Description] ,
		[VR_Units].[ConversionFactor]  
  FROM [VR_Units] 
    	INNER JOIN #PageIndex
          ON [VR_Units].[UnitID] = #PageIndex.UnitID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
