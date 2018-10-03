USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesSelectByID]
  @LoginID NVarChar(8),
  @WFTypeID Int 
  AS
  SELECT
		[TA_ApprovalWFTypes].[WFTypeID] ,
		[TA_ApprovalWFTypes].[WFTypeDescription] ,
		[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] ,
		[TA_ApprovalWFTypes].[RequiredMDApproval]  
  FROM [TA_ApprovalWFTypes] 
  WHERE
  [TA_ApprovalWFTypes].[WFTypeID] = @WFTypeID
GO
