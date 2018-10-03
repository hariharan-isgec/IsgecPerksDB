USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusSelectListSearch]
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
 ,FormStatusID NVarChar(30) NOT NULL
  )
  INSERT INTO #PageIndex (FormStatusID)
  SELECT [PMS_FormStatus].[FormStatusID] FROM [PMS_FormStatus]
 WHERE  
   ( 
         LOWER(ISNULL([PMS_FormStatus].[FormStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMS_FormStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FormStatusID' THEN [PMS_FormStatus].[FormStatusID] END,
     CASE @OrderBy WHEN 'FormStatusID DESC' THEN [PMS_FormStatus].[FormStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_FormStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_FormStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormStatus].[FormStatusID] ,
		[PMS_FormStatus].[Description]  
  FROM [PMS_FormStatus] 
    	INNER JOIN #PageIndex
          ON [PMS_FormStatus].[FormStatusID] = #PageIndex.FormStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
