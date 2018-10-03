USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentsInsert]
  @ProjectID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2),
  @Description NVarChar(100),
  @AlternateDocumentID NVarChar(30),
  @WBSID NVarChar(8),
  @DocumentTypeID Int,
  @DocumentSizeID NVarChar(2),
  @ResponsibleAgencyID Int,
  @OriginatorID NVarChar(3),
  @ForCustomerSubmission Bit,
  @ForInternalUse Bit,
  @ForProduction Bit,
  @ForErection Bit,
  @Remarks NVarChar(250),
  @PlannedReleaseDate DateTime,
  @ActualReleaseDate DateTime,
  @ReleasedInPLM Bit,
  @ValidateInPLM Bit,
  @BlockIfNotExists Bit,
  @OnceForApproval Bit,
  @WarnForApproval Bit,
  @ImplementReceiptLock Bit,
  @VendorDocument Bit,
  @VDReceived Bit,
  @VendorID NVarChar(6),
  @VDReceiveRemarks NVarChar(250),
  @VDReceivedBy NVarChar(8),
  @VDReceivedOn DateTime,
  @ReceiveDate DateTime,
  @ReceiveStatusID NVarChar(3),
  @ReceiveRemarks NVarChar(250),
  @ReceivedBy NVarChar(8),
  @ReceivedLocked Bit,
  @Locked Bit,
  @TmtlTypeID NVarChar(2),
  @TmtlID Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [IDM_Documents]
  (
   [ProjectID]
  ,[DocumentID]
  ,[RevisionNo]
  ,[Description]
  ,[AlternateDocumentID]
  ,[WBSID]
  ,[DocumentTypeID]
  ,[DocumentSizeID]
  ,[ResponsibleAgencyID]
  ,[OriginatorID]
  ,[ForCustomerSubmission]
  ,[ForInternalUse]
  ,[ForProduction]
  ,[ForErection]
  ,[Remarks]
  ,[PlannedReleaseDate]
  ,[ActualReleaseDate]
  ,[ReleasedInPLM]
  ,[ValidateInPLM]
  ,[BlockIfNotExists]
  ,[OnceForApproval]
  ,[WarnForApproval]
  ,[ImplementReceiptLock]
  ,[VendorDocument]
  ,[VDReceived]
  ,[VendorID]
  ,[VDReceiveRemarks]
  ,[VDReceivedBy]
  ,[VDReceivedOn]
  ,[ReceiveDate]
  ,[ReceiveStatusID]
  ,[ReceiveRemarks]
  ,[ReceivedBy]
  ,[ReceivedLocked]
  ,[Locked]
  ,[TmtlTypeID]
  ,[TmtlID]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,UPPER(@DocumentID)
  ,UPPER(@RevisionNo)
  ,@Description
  ,@AlternateDocumentID
  ,@WBSID
  ,@DocumentTypeID
  ,@DocumentSizeID
  ,@ResponsibleAgencyID
  ,@OriginatorID
  ,@ForCustomerSubmission
  ,@ForInternalUse
  ,@ForProduction
  ,@ForErection
  ,@Remarks
  ,@PlannedReleaseDate
  ,@ActualReleaseDate
  ,@ReleasedInPLM
  ,@ValidateInPLM
  ,@BlockIfNotExists
  ,@OnceForApproval
  ,@WarnForApproval
  ,@ImplementReceiptLock
  ,@VendorDocument
  ,@VDReceived
  ,@VendorID
  ,@VDReceiveRemarks
  ,@VDReceivedBy
  ,@VDReceivedOn
  ,@ReceiveDate
  ,@ReceiveStatusID
  ,@ReceiveRemarks
  ,@ReceivedBy
  ,@ReceivedLocked
  ,@Locked
  ,@TmtlTypeID
  ,@TmtlID
  )
  SET @Return_ProjectID = @ProjectID
GO
