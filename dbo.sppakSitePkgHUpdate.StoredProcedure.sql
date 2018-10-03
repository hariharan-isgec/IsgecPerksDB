USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_RecNo Int, 
  @ProjectID NVarChar(6),
  @SerialNo Int,
  @PkgNo Int,
  @MRNNo Int,
  @SupplierID NVarChar(9),
  @SupplierName NVarChar(50),
  @SupplierRefNo NVarChar(50),
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @UOMTotalWeight Int,
  @TotalWeight Decimal(18,2),
  @ODC Bit,
  @MaterialStatusID Int,
  @Remarks NVarChar(500),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @ReceiveStatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SitePkgH] SET 
   [ProjectID] = @ProjectID
  ,[SerialNo] = @SerialNo
  ,[PkgNo] = @PkgNo
  ,[MRNNo] = @MRNNo
  ,[SupplierID] = @SupplierID
  ,[SupplierName] = @SupplierName
  ,[SupplierRefNo] = @SupplierRefNo
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[VehicleNo] = @VehicleNo
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[UOMTotalWeight] = @UOMTotalWeight
  ,[TotalWeight] = @TotalWeight
  ,[ODC] = @ODC
  ,[MaterialStatusID] = @MaterialStatusID
  ,[Remarks] = @Remarks
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  ,[ReceiveStatusID] = @ReceiveStatusID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [RecNo] = @Original_RecNo
  SET @RowCount = @@RowCount
GO
