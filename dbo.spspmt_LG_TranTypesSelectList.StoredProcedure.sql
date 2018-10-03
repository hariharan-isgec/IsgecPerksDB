USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_TranTypesSelectList]
  @LoginID NVarChar(8), 
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SPMT_TranTypes].[TranTypeID] ,
		[SPMT_TranTypes].[Description] ,
		[SPMT_TranTypes].[GroupID] ,
		[SPMT_TranTypes].[BaaNCompany] ,
		[SPMT_TranTypes].[BaaNLedger] ,
		[SYS_Groups1].[Description] AS SYS_Groups1_Description 
  FROM [SPMT_TranTypes] 
  LEFT OUTER JOIN [SYS_Groups] AS [SYS_Groups1]
    ON [SPMT_TranTypes].[GroupID] = [SYS_Groups1].[GroupID]
  WHERE [SPMT_TranTypes].[GroupID] IN (SELECT GroupID FROM SYS_GroupLogins WHERE LoginID = @LoginID) 
  and [SPMT_TranTypes].[GroupID] <> 'Z'
      
  ORDER BY [SPMT_TranTypes].[Description]
     --CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_TranTypes].[TranTypeID] END,
     --CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_TranTypes].[TranTypeID] END DESC,
     --CASE @orderBy WHEN 'Description' THEN [SPMT_TranTypes].[Description] END,
     --CASE @orderBy WHEN 'Description DESC' THEN [SPMT_TranTypes].[Description] END DESC,
     --CASE @orderBy WHEN 'GroupID' THEN [SPMT_TranTypes].[GroupID] END,
     --CASE @orderBy WHEN 'GroupID DESC' THEN [SPMT_TranTypes].[GroupID] END DESC,
     --CASE @orderBy WHEN 'BaaNCompany' THEN [SPMT_TranTypes].[BaaNCompany] END,
     --CASE @orderBy WHEN 'BaaNCompany DESC' THEN [SPMT_TranTypes].[BaaNCompany] END DESC,
     --CASE @orderBy WHEN 'BaaNLedger' THEN [SPMT_TranTypes].[BaaNLedger] END,
     --CASE @orderBy WHEN 'BaaNLedger DESC' THEN [SPMT_TranTypes].[BaaNLedger] END DESC,
     --CASE @orderBy WHEN 'SYS_Groups1_Description' THEN [SYS_Groups1].[Description] END,
     --CASE @orderBy WHEN 'SYS_Groups1_Description DESC' THEN [SYS_Groups1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
