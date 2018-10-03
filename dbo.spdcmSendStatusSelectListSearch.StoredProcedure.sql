USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SendStatusID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (SendStatusID)
  SELECT [DCM_SendStatus].[SendStatusID] FROM [DCM_SendStatus]
 WHERE  
   ( 
         LOWER(ISNULL([DCM_SendStatus].[SendStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_SendStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SendStatusID' THEN [DCM_SendStatus].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [DCM_SendStatus].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_SendStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_SendStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_SendStatus].[SendStatusID],
		[DCM_SendStatus].[Description] 
  FROM [DCM_SendStatus] 
    	INNER JOIN #PageIndex
          ON [DCM_SendStatus].[SendStatusID] = #PageIndex.SendStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
