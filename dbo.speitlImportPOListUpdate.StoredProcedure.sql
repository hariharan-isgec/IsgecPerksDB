USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlImportPOListUpdate]
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_POList] SET 
   [PONumber] = @PONumber
  ,[PORevision] = @PORevision
  ,[PODate] = @PODate
  ,[SupplierID] = @SupplierID
  ,[ProjectID] = @ProjectID
  ,[DivisionID] = @DivisionID
  ,[BuyerID] = @BuyerID
  ,[POStatusID] = @POStatusID
  ,[IssuedBy] = @IssuedBy
  ,[IssuedOn] = @IssuedOn
  ,[ClosedBy] = @ClosedBy
  ,[ClosedOn] = @ClosedOn
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
