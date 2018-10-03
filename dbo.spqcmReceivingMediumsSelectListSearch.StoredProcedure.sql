USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsSelectListSearch]
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
 ,ReceivingMediumID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReceivingMediumID)
  SELECT [QCM_ReceivingMediums].[ReceivingMediumID] FROM [QCM_ReceivingMediums]
 WHERE  
   ( 
         STR(ISNULL([QCM_ReceivingMediums].[ReceivingMediumID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_ReceivingMediums].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReceivingMediumID' THEN [QCM_ReceivingMediums].[ReceivingMediumID] END,
     CASE @OrderBy WHEN 'ReceivingMediumID DESC' THEN [QCM_ReceivingMediums].[ReceivingMediumID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_ReceivingMediums].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_ReceivingMediums].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_ReceivingMediums].[ReceivingMediumID] ,
		[QCM_ReceivingMediums].[Description]  
  FROM [QCM_ReceivingMediums] 
    	INNER JOIN #PageIndex
          ON [QCM_ReceivingMediums].[ReceivingMediumID] = #PageIndex.ReceivingMediumID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
