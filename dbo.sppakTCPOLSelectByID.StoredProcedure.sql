USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @ItemNo Int 
  AS
  SELECT
    [PAK_POLine].* ,
    [IDM_WBS1].[Description] AS IDM_WBS1_Description,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POLineStatus3].[Description] AS PAK_POLineStatus3_Description 
  FROM [PAK_POLine] 
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS1]
    ON [PAK_POLine].[ItemElement] = [IDM_WBS1].[WBSID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_POLine].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_POLineStatus] AS [PAK_POLineStatus3]
    ON [PAK_POLine].[ItemStatusID] = [PAK_POLineStatus3].[ItemStatusID]
  WHERE
  [PAK_POLine].[SerialNo] = @SerialNo
  AND [PAK_POLine].[ItemNo] = @ItemNo
GO
