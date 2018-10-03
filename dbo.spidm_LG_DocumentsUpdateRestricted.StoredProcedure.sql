USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[spidm_LG_DocumentsUpdateRestricted]
  @Original_ProjectID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Documents] SET 
   [Description] = @Description
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
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
