USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesInsert]
  @WFTypeDescription NVarChar(50),
  @RequiredDivisionHeadApproval Bit,
  @RequiredMDApproval Bit,
  @Return_WFTypeID Int = null OUTPUT 
  AS
  INSERT [TA_ApprovalWFTypes]
  (
   [WFTypeDescription]
  ,[RequiredDivisionHeadApproval]
  ,[RequiredMDApproval]
  )
  VALUES
  (
   @WFTypeDescription
  ,@RequiredDivisionHeadApproval
  ,@RequiredMDApproval
  )
  SET @Return_WFTypeID = Scope_Identity()
GO
