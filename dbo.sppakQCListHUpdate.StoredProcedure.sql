USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListHUpdate]
  @Original_SerialNo Int, 
  @Original_QCLNo Int, 
  @SerialNo Int,
  @SupplierRef NVarChar(50),
  @ClearedOn DateTime,
  @ClearedBy NVarChar(8),
  @PkgNo Int,
  @Remarks NVarChar(500),
  @StatusID Int,
  @UOMTotalWeight Int,
  @TotalWeight Decimal(18,4),
  @QualityClearedWt Decimal(18,4),
  @QCRequestNo int,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_QCListH] SET 
   [SerialNo] = @SerialNo
  ,[SupplierRef] = @SupplierRef
  ,[ClearedOn] = @ClearedOn
  ,[ClearedBy] = @ClearedBy
  ,[PkgNo] = @PkgNo
  ,[Remarks] = @Remarks
  ,[StatusID] = @StatusID
  ,[UOMTotalWeight] = @UOMTotalWeight
  ,[TotalWeight] = @TotalWeight
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[QualityClearedWt] = @QualityClearedWt
  ,[QCRequestNo] = @QCRequestNo
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [QCLNo] = @Original_QCLNo
  SET @RowCount = @@RowCount
GO
