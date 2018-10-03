USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListHSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_QCListH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_QCListStatus3].[Description] AS PAK_QCListStatus3_Description,
    [PAK_Units4].[Description] AS PAK_Units4_Description,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName 
  FROM [PAK_QCListH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListH].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_QCListStatus] AS [PAK_QCListStatus3]
    ON [PAK_QCListH].[StatusID] = [PAK_QCListStatus3].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]
    ON [PAK_QCListH].[UOMTotalWeight] = [PAK_Units4].[UnitID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [PAK_QCListH].[ClearedBy] = [aspnet_users5].[LoginID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'QCLNo' THEN [PAK_QCListH].[QCLNo] END,
     CASE @OrderBy WHEN 'QCLNo DESC' THEN [PAK_QCListH].[QCLNo] END DESC,
     CASE @OrderBy WHEN 'SupplierRef' THEN [PAK_QCListH].[SupplierRef] END,
     CASE @OrderBy WHEN 'SupplierRef DESC' THEN [PAK_QCListH].[SupplierRef] END DESC,
     CASE @OrderBy WHEN 'TotalWeight' THEN [PAK_QCListH].[TotalWeight] END,
     CASE @OrderBy WHEN 'TotalWeight DESC' THEN [PAK_QCListH].[TotalWeight] END DESC,
     CASE @OrderBy WHEN 'UOMTotalWeight' THEN [PAK_QCListH].[UOMTotalWeight] END,
     CASE @OrderBy WHEN 'UOMTotalWeight DESC' THEN [PAK_QCListH].[UOMTotalWeight] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_QCListH].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_QCListH].[StatusID] END DESC,
     CASE @OrderBy WHEN 'ClearedBy' THEN [PAK_QCListH].[ClearedBy] END,
     CASE @OrderBy WHEN 'ClearedBy DESC' THEN [PAK_QCListH].[ClearedBy] END DESC,
     CASE @OrderBy WHEN 'ClearedOn' THEN [PAK_QCListH].[ClearedOn] END,
     CASE @OrderBy WHEN 'ClearedOn DESC' THEN [PAK_QCListH].[ClearedOn] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_QCListH].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_QCListH].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [PAK_QCListH].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [PAK_QCListH].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_QCListH].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_QCListH].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PAK_QCListH].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PAK_QCListH].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription' THEN [PAK_PO2].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription DESC' THEN [PAK_PO2].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_QCListStatus3_Description' THEN [PAK_QCListStatus3].[Description] END,
     CASE @OrderBy WHEN 'PAK_QCListStatus3_Description DESC' THEN [PAK_QCListStatus3].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units4_Description' THEN [PAK_Units4].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units4_Description DESC' THEN [PAK_Units4].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
