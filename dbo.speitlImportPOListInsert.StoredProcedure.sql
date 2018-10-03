USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlImportPOListInsert]
  @PONumber NVarChar(10),
  @PORevision NVarChar(10),
  @PODate DateTime,
  @SupplierID NVarChar(9),
  @ProjectID NVarChar(6),
  @DivisionID NVarChar(10),
  @BuyerID NVarChar(8),
  @POStatusID Int,
  @IssuedBy NVarChar(8),
  @IssuedOn DateTime,
  @ClosedBy NVarChar(8),
  @ClosedOn DateTime,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [EITL_POList]
  (
   [PONumber]
  ,[PORevision]
  ,[PODate]
  ,[SupplierID]
  ,[ProjectID]
  ,[DivisionID]
  ,[BuyerID]
  ,[POStatusID]
  ,[IssuedBy]
  ,[IssuedOn]
  ,[ClosedBy]
  ,[ClosedOn]
  )
  VALUES
  (
   @PONumber
  ,@PORevision
  ,@PODate
  ,@SupplierID
  ,@ProjectID
  ,@DivisionID
  ,@BuyerID
  ,@POStatusID
  ,@IssuedBy
  ,@IssuedOn
  ,@ClosedBy
  ,@ClosedOn
  )
  SET @Return_SerialNo = Scope_Identity()
GO
