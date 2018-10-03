USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesInsert]
  @Description NVarChar(50),
  @ValidateInPLM Bit,
  @BlockIfNotExists Bit,
  @OnceForApproval Bit,
  @WarnForApproval Bit,
  @ImplementReceiptLock Bit,
  @Return_DocumentTypeID Int = null OUTPUT
  AS
  INSERT [IDM_DocumentTypes]
  (
   [Description]
  ,[ValidateInPLM]
  ,[BlockIfNotExists]
  ,[OnceForApproval]
  ,[WarnForApproval]
  ,[ImplementReceiptLock]
  )
  VALUES
  (
   @Description
  ,@ValidateInPLM
  ,@BlockIfNotExists
  ,@OnceForApproval
  ,@WarnForApproval
  ,@ImplementReceiptLock
  )
  SET @Return_DocumentTypeID = Scope_Identity()
GO
