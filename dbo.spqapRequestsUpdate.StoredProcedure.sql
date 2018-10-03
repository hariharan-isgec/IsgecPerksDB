USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsUpdate]
  @Original_RequestNo Int, 
  @DocumentTypeID Int,
  @QAPRevisionNo NVarChar(50),
  @QAPNo NVarChar(50),
  @ProjectID NVarChar(6),
  @SupplierID NVarChar(9),
  @SubSupplier NVarChar(250),
  @MainItem NVarChar(250),
  @SubItem NVarChar(250),
  @ClientApprovalRequired Bit,
  @Remarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @CreatersDivision NVarChar(6),
  @ReviewBy NVarChar(8),
  @ReviewOn DateTime,
  @ReviewerRemarks NVarChar(250),
  @ReviewerDivision NVarChar(6),
  @ApproveBy NVarChar(8),
  @ApproveOn DateTime,
  @ApproverRemarks NVarChar(250),
  @ApproverDivision NVarChar(6),
  @StatusID Int,
  @PurposeID Int,
  @Division NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_Requests] SET 
   [DocumentTypeID] = @DocumentTypeID
  ,[QAPRevisionNo] = @QAPRevisionNo
  ,[QAPNo] = @QAPNo
  ,[ProjectID] = @ProjectID
  ,[SupplierID] = @SupplierID
  ,[SubSupplier] = @SubSupplier
  ,[MainItem] = @MainItem
  ,[SubItem] = @SubItem
  ,[ClientApprovalRequired] = @ClientApprovalRequired
  ,[Remarks] = @Remarks
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[CreatersDivision] = @CreatersDivision
  ,[ReviewBy] = @ReviewBy
  ,[ReviewOn] = @ReviewOn
  ,[ReviewerRemarks] = @ReviewerRemarks
  ,[ReviewerDivision] = @ReviewerDivision
  ,[ApproveBy] = @ApproveBy
  ,[ApproveOn] = @ApproveOn
  ,[ApproverRemarks] = @ApproverRemarks
  ,[ApproverDivision] = @ApproverDivision
  ,[StatusID] = @StatusID
  ,[PurposeID] = @PurposeID
  ,[Division] = @Division
  WHERE
  [RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
