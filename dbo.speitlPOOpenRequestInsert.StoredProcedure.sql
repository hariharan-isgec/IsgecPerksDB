USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOOpenRequestInsert]
  @SerialNo Int,
  @PORevision NVarChar(10),
  @SupplierID NVarChar(9),
  @Remarks NVarChar(500),
  @RequestedOn DateTime,
  @ExecutedBy NVarChar(8),
  @ExecutedOn DateTime,
  @ExecuterRemarks NVarChar(500),
  @ExecutedToOpen Bit,
  @Return_RequestNo Int = null OUTPUT 
  AS
  INSERT [EITL_POOpenRequest]
  (
   [SerialNo]
  ,[PORevision]
  ,[SupplierID]
  ,[Remarks]
  ,[RequestedOn]
  ,[ExecutedBy]
  ,[ExecutedOn]
  ,[ExecuterRemarks]
  ,[ExecutedToOpen]
  )
  VALUES
  (
   @SerialNo
  ,@PORevision
  ,@SupplierID
  ,@Remarks
  ,@RequestedOn
  ,@ExecutedBy
  ,@ExecutedOn
  ,@ExecuterRemarks
  ,@ExecutedToOpen
  )
  SET @Return_RequestNo = Scope_Identity()
GO
