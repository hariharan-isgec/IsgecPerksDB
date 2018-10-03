USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Documents] SET 
   [ProjectID] = @ProjectID
  ,[DocumentID] = @DocumentID
  ,[RevisionNo] = @RevisionNo
  ,[Description] = @Description
  ,[AlternateDocumentID] = @AlternateDocumentID
  ,[WBSID] = @WBSID
  ,[DocumentTypeID] = @DocumentTypeID
  ,[DocumentSizeID] = @DocumentSizeID
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  ,[OriginatorID] = @OriginatorID
  ,[ForCustomerSubmission] = @ForCustomerSubmission
  ,[ForInternalUse] = @ForInternalUse
  ,[ForProduction] = @ForProduction
  ,[ForErection] = @ForErection
  ,[Remarks] = @Remarks
  ,[PlannedReleaseDate] = @PlannedReleaseDate
  ,[ActualReleaseDate] = @ActualReleaseDate
  ,[ReleasedInPLM] = @ReleasedInPLM
  ,[ValidateInPLM] = @ValidateInPLM
  ,[BlockIfNotExists] = @BlockIfNotExists
  ,[OnceForApproval] = @OnceForApproval
  ,[WarnForApproval] = @WarnForApproval
  ,[ImplementReceiptLock] = @ImplementReceiptLock
  ,[VendorDocument] = @VendorDocument
  ,[VDReceived] = @VDReceived
  ,[VendorID] = @VendorID
  ,[VDReceiveRemarks] = @VDReceiveRemarks
  ,[VDReceivedBy] = @VDReceivedBy
  ,[VDReceivedOn] = @VDReceivedOn
  ,[ReceiveDate] = @ReceiveDate
  ,[ReceiveStatusID] = @ReceiveStatusID
  ,[ReceiveRemarks] = @ReceiveRemarks
  ,[ReceivedBy] = @ReceivedBy
  ,[ReceivedLocked] = @ReceivedLocked
  ,[Locked] = @Locked
  ,[TmtlTypeID] = @TmtlTypeID
  ,[TmtlID] = @TmtlID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
