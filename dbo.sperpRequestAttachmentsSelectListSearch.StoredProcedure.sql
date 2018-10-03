USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsSelectListSearch]
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
 ,ApplID Int NOT NULL
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplID, RequestID, SerialNo)
  SELECT [ERP_RequestAttachments].[ApplID], [ERP_RequestAttachments].[RequestID], [ERP_RequestAttachments].[SerialNo] FROM [ERP_RequestAttachments]
  INNER JOIN [ERP_Applications] AS [ERP_Applications1]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_Applications1].[ApplID]
  INNER JOIN [ERP_ChaneRequest] AS [ERP_ChaneRequest2]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_ChaneRequest2].[ApplID]
    AND [ERP_RequestAttachments].[RequestID] = [ERP_ChaneRequest2].[RequestID]
 WHERE  
   ( 
         STR(ISNULL([ERP_RequestAttachments].[ApplID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_RequestAttachments].[RequestID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_RequestAttachments].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestAttachments].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestAttachments].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestAttachments].[DiskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ApplID' THEN [ERP_RequestAttachments].[ApplID] END,
     CASE @OrderBy WHEN 'ApplID DESC' THEN [ERP_RequestAttachments].[ApplID] END DESC,
     CASE @OrderBy WHEN 'RequestID' THEN [ERP_RequestAttachments].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [ERP_RequestAttachments].[RequestID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [ERP_RequestAttachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ERP_RequestAttachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestAttachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestAttachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [ERP_RequestAttachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [ERP_RequestAttachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [ERP_RequestAttachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [ERP_RequestAttachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'ERP_Applications1_ApplName' THEN [ERP_Applications1].[ApplName] END,
     CASE @OrderBy WHEN 'ERP_Applications1_ApplName DESC' THEN [ERP_Applications1].[ApplName] END DESC,
     CASE @OrderBy WHEN 'ERP_ChaneRequest2_ChangeSubject' THEN [ERP_ChaneRequest2].[ChangeSubject] END,
     CASE @OrderBy WHEN 'ERP_ChaneRequest2_ChangeSubject DESC' THEN [ERP_ChaneRequest2].[ChangeSubject] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestAttachments].[ApplID] ,
		[ERP_RequestAttachments].[RequestID] ,
		[ERP_RequestAttachments].[SerialNo] ,
		[ERP_RequestAttachments].[Description] ,
		[ERP_RequestAttachments].[FileName] ,
		[ERP_RequestAttachments].[DiskFile] ,
		[ERP_Applications1].[ApplName] AS ERP_Applications1_ApplName,
		[ERP_ChaneRequest2].[ChangeSubject] AS ERP_ChaneRequest2_ChangeSubject 
  FROM [ERP_RequestAttachments] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestAttachments].[ApplID] = #PageIndex.ApplID
          AND [ERP_RequestAttachments].[RequestID] = #PageIndex.RequestID
          AND [ERP_RequestAttachments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [ERP_Applications] AS [ERP_Applications1]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_Applications1].[ApplID]
  INNER JOIN [ERP_ChaneRequest] AS [ERP_ChaneRequest2]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_ChaneRequest2].[ApplID]
    AND [ERP_RequestAttachments].[RequestID] = [ERP_ChaneRequest2].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
