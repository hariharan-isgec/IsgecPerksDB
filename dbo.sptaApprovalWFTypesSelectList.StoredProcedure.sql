USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_ApprovalWFTypes].[WFTypeID] ,
		[TA_ApprovalWFTypes].[WFTypeDescription] ,
		[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] ,
		[TA_ApprovalWFTypes].[RequiredMDApproval]  
  FROM [TA_ApprovalWFTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'WFTypeID' THEN [TA_ApprovalWFTypes].[WFTypeID] END,
     CASE @OrderBy WHEN 'WFTypeID DESC' THEN [TA_ApprovalWFTypes].[WFTypeID] END DESC,
     CASE @OrderBy WHEN 'WFTypeDescription' THEN [TA_ApprovalWFTypes].[WFTypeDescription] END,
     CASE @OrderBy WHEN 'WFTypeDescription DESC' THEN [TA_ApprovalWFTypes].[WFTypeDescription] END DESC,
     CASE @OrderBy WHEN 'RequiredDivisionHeadApproval' THEN [TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] END,
     CASE @OrderBy WHEN 'RequiredDivisionHeadApproval DESC' THEN [TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] END DESC,
     CASE @OrderBy WHEN 'RequiredMDApproval' THEN [TA_ApprovalWFTypes].[RequiredMDApproval] END,
     CASE @OrderBy WHEN 'RequiredMDApproval DESC' THEN [TA_ApprovalWFTypes].[RequiredMDApproval] END DESC 
  SET @RecordCount = @@RowCount
GO
