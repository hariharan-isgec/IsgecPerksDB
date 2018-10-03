USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesUpdate]
  @Original_WFTypeID Int, 
  @WFTypeDescription NVarChar(50),
  @RequiredDivisionHeadApproval Bit,
  @RequiredMDApproval Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_ApprovalWFTypes] SET 
   [WFTypeDescription] = @WFTypeDescription
  ,[RequiredDivisionHeadApproval] = @RequiredDivisionHeadApproval
  ,[RequiredMDApproval] = @RequiredMDApproval
  WHERE
  [WFTypeID] = @Original_WFTypeID
  SET @RowCount = @@RowCount
GO
