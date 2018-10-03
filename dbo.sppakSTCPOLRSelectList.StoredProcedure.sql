USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSTCPOLRSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLineRec].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POLine3].[ItemCode] AS PAK_POLine3_ItemCode,
    [PAK_POLineRecCategory4].[Description] AS PAK_POLineRecCategory4_Description,
    [PAK_POLineRecStatus5].[Description] AS PAK_POLineRecStatus5_Description 
  FROM [PAK_POLineRec] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_POLineRec].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_POLineRec].[SerialNo] = [PAK_PO2].[SerialNo]
  INNER JOIN [PAK_POLine] AS [PAK_POLine3]
    ON [PAK_POLineRec].[SerialNo] = [PAK_POLine3].[SerialNo]
    AND [PAK_POLineRec].[ItemNo] = [PAK_POLine3].[ItemNo]
  LEFT OUTER JOIN [PAK_POLineRecCategory] AS [PAK_POLineRecCategory4]
    ON [PAK_POLineRec].[DocumentCategoryID] = [PAK_POLineRecCategory4].[DocumentCategoryID]
  LEFT OUTER JOIN [PAK_POLineRecStatus] AS [PAK_POLineRecStatus5]
    ON [PAK_POLineRec].[UploadStatusID] = [PAK_POLineRecStatus5].[StatusID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POLineRec].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POLineRec].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POLineRec].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POLineRec].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'UploadNo' THEN [PAK_POLineRec].[UploadNo] END,
     CASE @OrderBy WHEN 'UploadNo DESC' THEN [PAK_POLineRec].[UploadNo] END DESC,
     CASE @OrderBy WHEN 'DocumentCategoryID' THEN [PAK_POLineRec].[DocumentCategoryID] END,
     CASE @OrderBy WHEN 'DocumentCategoryID DESC' THEN [PAK_POLineRec].[DocumentCategoryID] END DESC,
     CASE @OrderBy WHEN 'UploadRemarks' THEN [PAK_POLineRec].[UploadRemarks] END,
     CASE @OrderBy WHEN 'UploadRemarks DESC' THEN [PAK_POLineRec].[UploadRemarks] END DESC,
     CASE @OrderBy WHEN 'UploadStatusID' THEN [PAK_POLineRec].[UploadStatusID] END,
     CASE @OrderBy WHEN 'UploadStatusID DESC' THEN [PAK_POLineRec].[UploadStatusID] END DESC,
     CASE @OrderBy WHEN 'RevisionNo' THEN [PAK_POLineRec].[RevisionNo] END,
     CASE @OrderBy WHEN 'RevisionNo DESC' THEN [PAK_POLineRec].[RevisionNo] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [PAK_POLineRec].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [PAK_POLineRec].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PAK_POLineRec].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PAK_POLineRec].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'ReceiptNo' THEN [PAK_POLineRec].[ReceiptNo] END,
     CASE @OrderBy WHEN 'ReceiptNo DESC' THEN [PAK_POLineRec].[ReceiptNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription' THEN [PAK_PO2].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription DESC' THEN [PAK_PO2].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POLine3_ItemCode' THEN [PAK_POLine3].[ItemCode] END,
     CASE @OrderBy WHEN 'PAK_POLine3_ItemCode DESC' THEN [PAK_POLine3].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'PAK_POLineRecCategory4_Description' THEN [PAK_POLineRecCategory4].[Description] END,
     CASE @OrderBy WHEN 'PAK_POLineRecCategory4_Description DESC' THEN [PAK_POLineRecCategory4].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_POLineRecStatus5_Description' THEN [PAK_POLineRecStatus5].[Description] END,
     CASE @OrderBy WHEN 'PAK_POLineRecStatus5_Description DESC' THEN [PAK_POLineRecStatus5].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
