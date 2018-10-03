USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestStatusSelectListSearch]
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
  SELECT [ERP_RequestStatus].[StatusID] FROM [ERP_RequestStatus]
 WHERE  
   ( 
         STR(ISNULL([ERP_RequestStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ERP_RequestStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ERP_RequestStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestStatus].[StatusID] ,
		[ERP_RequestStatus].[Description]  
  FROM [ERP_RequestStatus] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
