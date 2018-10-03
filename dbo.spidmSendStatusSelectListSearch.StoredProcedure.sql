USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusSelectListSearch]
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
 ,SendStatusID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (SendStatusID)
  SELECT [IDM_SendStatus].[SendStatusID] FROM [IDM_SendStatus]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_SendStatus].[SendStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_SendStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SendStatusID' THEN [IDM_SendStatus].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [IDM_SendStatus].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_SendStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_SendStatus].[Description] END DESC,
     CASE @orderBy WHEN 'ReceivedBack' THEN [IDM_SendStatus].[ReceivedBack] END,
     CASE @orderBy WHEN 'ReceivedBack DESC' THEN [IDM_SendStatus].[ReceivedBack] END DESC,
     CASE @orderBy WHEN 'IsItForApproval' THEN [IDM_SendStatus].[IsItForApproval] END,
     CASE @orderBy WHEN 'IsItForApproval DESC' THEN [IDM_SendStatus].[IsItForApproval] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_SendStatus].[SendStatusID] ,
		[IDM_SendStatus].[Description] ,
		[IDM_SendStatus].[ReceivedBack] ,
		[IDM_SendStatus].[IsItForApproval]  
  FROM [IDM_SendStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_SendStatus].[SendStatusID] = #PageIndex.SendStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
