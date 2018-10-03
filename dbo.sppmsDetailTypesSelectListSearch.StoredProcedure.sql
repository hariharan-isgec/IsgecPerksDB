USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesSelectListSearch]
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
 ,DetailTypeID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (DetailTypeID)
  SELECT [PMS_DetailTypes].[DetailTypeID] FROM [PMS_DetailTypes]
 WHERE  
   ( 
         LOWER(ISNULL([PMS_DetailTypes].[DetailTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_DetailTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DetailTypeID' THEN [PMS_DetailTypes].[DetailTypeID] END,
     CASE @OrderBy WHEN 'DetailTypeID DESC' THEN [PMS_DetailTypes].[DetailTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_DetailTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_DetailTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_DetailTypes].[DetailTypeID] ,
		[PMS_DetailTypes].[Description]  
  FROM [PMS_DetailTypes] 
    	INNER JOIN #PageIndex
          ON [PMS_DetailTypes].[DetailTypeID] = #PageIndex.DetailTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
