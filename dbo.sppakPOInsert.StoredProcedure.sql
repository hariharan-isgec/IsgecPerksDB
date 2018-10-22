USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOInsert]
  @POConsignee NVarChar(100),
  @POOtherDetails NVarChar(500),
  @IssueReasonID Int,
  @PONumber NVarChar(10),
  @PORevision NVarChar(10),
  @PODate DateTime,
  @PODescription NVarChar(100),
  @POTypeID Int,
  @SupplierID NVarChar(9),
  @ProjectID NVarChar(6),
  @BuyerID NVarChar(8),
  @POStatusID Int,
  @ISGECRemarks NVarChar(500),
  @SupplierRemarks NVarChar(500),
  @IssuedBy NVarChar(8),
  @IssuedOn DateTime,
  @ClosedBy NVarChar(8),
  @ClosedOn DateTime,
  @DivisionID Int,
  @POFOR NVarChar(2), 
  @QCRequired Bit = 0,
  @AcceptedBySupplier Bit = 0,
  @AcceptedBySupplierOn DateTime = NULL,
  @POWeight as Decimal(18,4) = 0,
  @PortRequired Bit = 0,
  @PortID Int,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [PAK_PO]
  (
   [POConsignee]
  ,[POOtherDetails]
  ,[IssueReasonID]
  ,[PONumber]
  ,[PORevision]
  ,[PODate]
  ,[PODescription]
  ,[POTypeID]
  ,[SupplierID]
  ,[ProjectID]
  ,[BuyerID]
  ,[POStatusID]
  ,[ISGECRemarks]
  ,[SupplierRemarks]
  ,[IssuedBy]
  ,[IssuedOn]
  ,[ClosedBy]
  ,[ClosedOn]
  ,[DivisionID]
  ,[POFOR] 
  ,[QCRequired]
  ,[AcceptedBySupplier]
  ,[AcceptedBySupplierOn]
  ,[POWeight]
  ,[PortRequired]
  ,[PortID]
  )
  VALUES
  (
   @POConsignee
  ,@POOtherDetails
  ,@IssueReasonID
  ,@PONumber
  ,@PORevision
  ,@PODate
  ,@PODescription
  ,@POTypeID
  ,@SupplierID
  ,@ProjectID
  ,@BuyerID
  ,@POStatusID
  ,@ISGECRemarks
  ,@SupplierRemarks
  ,@IssuedBy
  ,@IssuedOn
  ,@ClosedBy
  ,@ClosedOn
  ,@DivisionID
  ,@POFOR 
  ,@QCRequired 
  ,@AcceptedBySupplier
  ,@AcceptedBySupplierOn
  ,@POWeight
  ,@PortRequired
  ,@PortID
  )
  SET @Return_SerialNo = Scope_Identity()
GO
