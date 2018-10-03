USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesSelectListSearch]
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
 ,RequestTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestTypeID)
  SELECT [ERP_RequestTypes].[RequestTypeID] FROM [ERP_RequestTypes]
 WHERE  
   ( 
         STR(ISNULL([ERP_RequestTypes].[RequestTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestTypeID' THEN [ERP_RequestTypes].[RequestTypeID] END,
     CASE @OrderBy WHEN 'RequestTypeID DESC' THEN [ERP_RequestTypes].[RequestTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestTypes].[RequestTypeID] ,
		[ERP_RequestTypes].[Description]  
  FROM [ERP_RequestTypes] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestTypes].[RequestTypeID] = #PageIndex.RequestTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
