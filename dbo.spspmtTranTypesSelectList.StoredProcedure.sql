USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_TranTypes].* ,
    [SYS_Groups1].[Description] AS SYS_Groups1_Description 
  FROM [SPMT_TranTypes] 
  LEFT OUTER JOIN [SYS_Groups] AS [SYS_Groups1]
    ON [SPMT_TranTypes].[GroupID] = [SYS_Groups1].[GroupID]
  WHERE 1 = 1  
  ORDER BY [SPMT_TranTypes].[Description]
     --CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_TranTypes].[TranTypeID] END,
     --CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_TranTypes].[TranTypeID] END DESC,
     --CASE @OrderBy WHEN 'Description' THEN [SPMT_TranTypes].[Description] END,
     --CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_TranTypes].[Description] END DESC,
     --CASE @OrderBy WHEN 'GroupID' THEN [SPMT_TranTypes].[GroupID] END,
     --CASE @OrderBy WHEN 'GroupID DESC' THEN [SPMT_TranTypes].[GroupID] END DESC,
     --CASE @OrderBy WHEN 'BaaNCompany' THEN [SPMT_TranTypes].[BaaNCompany] END,
     --CASE @OrderBy WHEN 'BaaNCompany DESC' THEN [SPMT_TranTypes].[BaaNCompany] END DESC,
     --CASE @OrderBy WHEN 'BaaNLedger' THEN [SPMT_TranTypes].[BaaNLedger] END,
     --CASE @OrderBy WHEN 'BaaNLedger DESC' THEN [SPMT_TranTypes].[BaaNLedger] END DESC,
     --CASE @OrderBy WHEN 'SYS_Groups1_Description' THEN [SYS_Groups1].[Description] END,
     --CASE @OrderBy WHEN 'SYS_Groups1_Description DESC' THEN [SYS_Groups1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
