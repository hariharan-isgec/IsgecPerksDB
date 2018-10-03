USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesUpdate]
  @Original_DocumentTypeID Int, 
  @Description NVarChar(50),
  @ValidateInPLM Bit,
  @BlockIfNotExists Bit,
  @OnceForApproval Bit,
  @WarnForApproval Bit,
  @ImplementReceiptLock Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_DocumentTypes] SET 
   [Description] = @Description
  ,[ValidateInPLM] = @ValidateInPLM
  ,[BlockIfNotExists] = @BlockIfNotExists
  ,[OnceForApproval] = @OnceForApproval
  ,[WarnForApproval] = @WarnForApproval
  ,[ImplementReceiptLock] = @ImplementReceiptLock
  WHERE
  [DocumentTypeID] = @Original_DocumentTypeID
  SET @RowCount = @@RowCount
GO
