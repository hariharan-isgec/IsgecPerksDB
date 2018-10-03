USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListHUpdate]
  @Original_SerialNo Int, 
  @Original_PkgNo Int, 
  @SerialNo Int,
  @SupplierRefNo NVarChar(50),
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @VRExecutionNo Int,
  @Remarks NVarChar(500),
  @UOMTotalWeight Int,
  @TotalWeight Decimal(18,2),
  @StatusID Int,
  @CreatedOn DateTime,
  @Additional2Info NVarChar(50),
  @Additional1Info NVarChar(50),
  @CreatedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PkgListH] SET 
   [SerialNo] = @SerialNo
  ,[SupplierRefNo] = @SupplierRefNo
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[VehicleNo] = @VehicleNo
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[VRExecutionNo] = @VRExecutionNo
  ,[Remarks] = @Remarks
  ,[UOMTotalWeight] = @UOMTotalWeight
  ,[TotalWeight] = @TotalWeight
  ,[StatusID] = @StatusID
  ,[CreatedOn] = @CreatedOn
  ,[Additional2Info] = @Additional2Info
  ,[Additional1Info] = @Additional1Info
  ,[CreatedBy] = @CreatedBy
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [PkgNo] = @Original_PkgNo
  SET @RowCount = @@RowCount
GO
