USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOUpdate]
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PO] SET 
   [POConsignee] = @POConsignee
  ,[POOtherDetails] = @POOtherDetails
  ,[IssueReasonID] = @IssueReasonID
  ,[PONumber] = @PONumber
  ,[PORevision] = @PORevision
  ,[PODate] = @PODate
  ,[PODescription] = @PODescription
  ,[POTypeID] = @POTypeID
  ,[SupplierID] = @SupplierID
  ,[ProjectID] = @ProjectID
  ,[BuyerID] = @BuyerID
  ,[POStatusID] = @POStatusID
  ,[ISGECRemarks] = @ISGECRemarks
  ,[SupplierRemarks] = @SupplierRemarks
  ,[IssuedBy] = @IssuedBy
  ,[IssuedOn] = @IssuedOn
  ,[ClosedBy] = @ClosedBy
  ,[ClosedOn] = @ClosedOn
  ,[DivisionID] = @DivisionID
  ,[POFOR] = @POFOR 
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
