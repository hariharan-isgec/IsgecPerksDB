USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesDelete]
  @Original_WFTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_ApprovalWFTypes]
  WHERE
  [TA_ApprovalWFTypes].[WFTypeID] = @Original_WFTypeID
  SET @RowCount = @@RowCount
GO
