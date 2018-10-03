USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsInsert]
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
  @Return_RequestNo Int = null OUTPUT 
  AS
  INSERT [QAP_Requests]
  (
   [DocumentTypeID]
  ,[QAPRevisionNo]
  ,[QAPNo]
  ,[ProjectID]
  ,[SupplierID]
  ,[SubSupplier]
  ,[MainItem]
  ,[SubItem]
  ,[ClientApprovalRequired]
  ,[Remarks]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[CreatersDivision]
  ,[ReviewBy]
  ,[ReviewOn]
  ,[ReviewerRemarks]
  ,[ReviewerDivision]
  ,[ApproveBy]
  ,[ApproveOn]
  ,[ApproverRemarks]
  ,[ApproverDivision]
  ,[StatusID]
  ,[PurposeID]
  ,[Division]
  )
  VALUES
  (
   @DocumentTypeID
  ,@QAPRevisionNo
  ,@QAPNo
  ,@ProjectID
  ,@SupplierID
  ,@SubSupplier
  ,@MainItem
  ,@SubItem
  ,@ClientApprovalRequired
  ,@Remarks
  ,@CreatedBy
  ,@CreatedOn
  ,@CreatersDivision
  ,@ReviewBy
  ,@ReviewOn
  ,@ReviewerRemarks
  ,@ReviewerDivision
  ,@ApproveBy
  ,@ApproveOn
  ,@ApproverRemarks
  ,@ApproverDivision
  ,@StatusID
  ,@PurposeID
  ,@Division
  )
  SET @Return_RequestNo = Scope_Identity()
GO
