USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBIDocumentsSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @BOMNo Int,
  @ItemNo Int,
  @DocNo Int 
  AS
  SELECT
    [PAK_POBIDocuments].* ,
    [PAK_PO1].[PODescription] AS PAK_PO1_PODescription,
    [PAK_POBItems2].[ItemDescription] AS PAK_POBItems2_ItemDescription,
    [PAK_POBOM3].[ItemDescription] AS PAK_POBOM3_ItemDescription 
  FROM [PAK_POBIDocuments] 
  INNER JOIN [PAK_PO] AS [PAK_PO1]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_PO1].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems2]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBItems2].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBItems2].[BOMNo]
    AND [PAK_POBIDocuments].[ItemNo] = [PAK_POBItems2].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM3]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBOM3].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBOM3].[BOMNo]
  WHERE
  [PAK_POBIDocuments].[SerialNo] = @SerialNo
  AND [PAK_POBIDocuments].[BOMNo] = @BOMNo
  AND [PAK_POBIDocuments].[ItemNo] = @ItemNo
  AND [PAK_POBIDocuments].[DocNo] = @DocNo
GO
