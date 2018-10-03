USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @ItemNo Int,
  @UploadNo Int 
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
  WHERE
  [PAK_POLineRec].[SerialNo] = @SerialNo
  AND [PAK_POLineRec].[ItemNo] = @ItemNo
  AND [PAK_POLineRec].[UploadNo] = @UploadNo
GO
