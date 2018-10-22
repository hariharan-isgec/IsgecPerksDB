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
  @ReceivedAtPortOn DateTime,
  @ReceivedAtPortBy NVarChar(8),
  @PortID Int,
  @ProjectID NVarChar(6),
  @SupplierRefNo NVarChar(50),
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @VRExecutionNo Int,
  @Remarks NVarChar(500),
  @Additional2Info NVarChar(50),
  @TotalWeight Decimal(18,2),
  @StatusID Int,
  @Additional1Info NVarChar(50),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @UOMTotalWeight Int,
  @VRRaised Bit,
  @VRRaisedOn DateTime,
  @VRConverted Bit,
  @VRConvertedOn DateTime,
  @VRConvertedBy NVarChar(8),
  @VRRequestNo Int,
  @VRExecuted Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PkgListH] SET 
   [SerialNo] = @SerialNo
  ,[ReceivedAtPortOn] = @ReceivedAtPortOn
  ,[ReceivedAtPortBy] = @ReceivedAtPortBy
  ,[PortID] = @PortID
  ,[ProjectID] = @ProjectID
  ,[SupplierRefNo] = @SupplierRefNo
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[VehicleNo] = @VehicleNo
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[VRExecutionNo] = @VRExecutionNo
  ,[Remarks] = @Remarks
  ,[Additional2Info] = @Additional2Info
  ,[TotalWeight] = @TotalWeight
  ,[StatusID] = @StatusID
  ,[Additional1Info] = @Additional1Info
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  ,[UOMTotalWeight] = @UOMTotalWeight
  ,[VRRaised] = @VRRaised
  ,[VRRaisedOn] = @VRRaisedOn
  ,[VRConverted] = @VRConverted
  ,[VRConvertedOn] = @VRConvertedOn
  ,[VRConvertedBy] = @VRConvertedBy
  ,[VRRequestNo] = @VRRequestNo
  ,[VRExecuted] = @VRExecuted
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [PkgNo] = @Original_PkgNo
  SET @RowCount = @@RowCount
GO
