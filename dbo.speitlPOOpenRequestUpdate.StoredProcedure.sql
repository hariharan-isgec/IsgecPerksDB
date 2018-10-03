USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOOpenRequestUpdate]
  @Original_RequestNo Int, 
  @SerialNo Int,
  @PORevision NVarChar(10),
  @SupplierID NVarChar(9),
  @Remarks NVarChar(500),
  @RequestedOn DateTime,
  @ExecutedBy NVarChar(8),
  @ExecutedOn DateTime,
  @ExecuterRemarks NVarChar(500),
  @ExecutedToOpen Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_POOpenRequest] SET 
   [SerialNo] = @SerialNo
  ,[PORevision] = @PORevision
  ,[SupplierID] = @SupplierID
  ,[Remarks] = @Remarks
  ,[RequestedOn] = @RequestedOn
  ,[ExecutedBy] = @ExecutedBy
  ,[ExecutedOn] = @ExecutedOn
  ,[ExecuterRemarks] = @ExecuterRemarks
  ,[ExecutedToOpen] = @ExecutedToOpen
  WHERE
  [RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
