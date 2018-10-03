USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderUpdate]
  @Original_ChallanID NVarChar(20), 
  @ChallanID NVarChar(20),
  @LinkedChallanID NVarChar(20),
  @DestinationIsgecID Int,
  @DestinationBPID NVarChar(9),
  @DestinationGSTIN Int,
  @DestinationName NVarChar(50),
  @DestinationGSTINNo NVarChar(50),
  @DestinationAddress1Line NVarChar(100),
  @DestinationAddress2Line NVarChar(100),
  @DestinationAddress3Line NVarChar(100),
  @DestinationStateID NVarChar(2),
  @ReceivedDate DateTime,
  @ReceivedRemarks NVarChar(500),
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @ClosureRemarks NVarChar(500),
  @ClosureDate DateTime,
  @ClosedBy NVarChar(8),
  @ClosedOn DateTime,
  @IsgecInvoiceNo NVarChar(50),
  @IsgecInvoiceDate DateTime,
  @ChallanDate DateTime,
  @IssuerID Int,
  @IssuerCompanyName NVarChar(50),
  @IssuerAddress1Line NVarChar(200),
  @IssuerAddress2Line NVarChar(200),
  @IssuerPAN NVarChar(50),
  @IssuerCIN NVarChar(50),
  @ProjectID NVarChar(6),
  @UnitID NVarChar(6),
  @PONo NVarChar(9),
  @PlaceOfSupply NVarChar(2),
  @PlaceOfDelivery NVarChar(2),
  @ConsignerIsgecID Int,
  @ConsigneeIsgecID Int,
  @ConsignerBPID NVarChar(9),
  @ConsigneeBPID NVarChar(9),
  @ConsignerGSTIN Int,
  @ConsigneeGSTIN Int,
  @ConsignerName NVarChar(50),
  @ConsigneeName NVarChar(50),
  @ConsignerGSTINNo NVarChar(50),
  @ConsigneeGSTINNo NVarChar(50),
  @ConsignerAddress1Line NVarChar(100),
  @ConsigneeAddress1Line NVarChar(100),
  @ConsignerAddress2Line NVarChar(100),
  @ConsigneeAddress2Line NVarChar(100),
  @ConsignerAddress3Line NVarChar(100),
  @ConsigneeAddress3Line NVarChar(100),
  @ConsignerStateID NVarChar(2),
  @ConsigneeStateID NVarChar(2),
  @Purpose NVarChar(250),
  @ExpectedReturnDate DateTime,
  @ModeOfTransportID Int,
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @FromPlace NVarChar(50),
  @ToPlace NVarChar(50),
  @StatusID Int,
  @CreatedBy NVarChar(8),
  @TotalAmount Decimal(18,2),
  @Declaration1Line NVarChar(250),
  @CreatedOn DateTime,
  @TotalAmountInWords NVarChar(500),
  @Declaration2Line NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_DCHeader] SET 
   [ChallanID] = @ChallanID
  ,[LinkedChallanID] = @LinkedChallanID
  ,[DestinationIsgecID] = @DestinationIsgecID
  ,[DestinationBPID] = @DestinationBPID
  ,[DestinationGSTIN] = @DestinationGSTIN
  ,[DestinationName] = @DestinationName
  ,[DestinationGSTINNo] = @DestinationGSTINNo
  ,[DestinationAddress1Line] = @DestinationAddress1Line
  ,[DestinationAddress2Line] = @DestinationAddress2Line
  ,[DestinationAddress3Line] = @DestinationAddress3Line
  ,[DestinationStateID] = @DestinationStateID
  ,[ReceivedDate] = @ReceivedDate
  ,[ReceivedRemarks] = @ReceivedRemarks
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  ,[ClosureRemarks] = @ClosureRemarks
  ,[ClosureDate] = @ClosureDate
  ,[ClosedBy] = @ClosedBy
  ,[ClosedOn] = @ClosedOn
  ,[IsgecInvoiceNo] = @IsgecInvoiceNo
  ,[IsgecInvoiceDate] = @IsgecInvoiceDate
  ,[ChallanDate] = @ChallanDate
  ,[IssuerID] = @IssuerID
  ,[IssuerCompanyName] = @IssuerCompanyName
  ,[IssuerAddress1Line] = @IssuerAddress1Line
  ,[IssuerAddress2Line] = @IssuerAddress2Line
  ,[IssuerPAN] = @IssuerPAN
  ,[IssuerCIN] = @IssuerCIN
  ,[ProjectID] = @ProjectID
  ,[UnitID] = @UnitID
  ,[PONo] = @PONo
  ,[PlaceOfSupply] = @PlaceOfSupply
  ,[PlaceOfDelivery] = @PlaceOfDelivery
  ,[ConsignerIsgecID] = @ConsignerIsgecID
  ,[ConsigneeIsgecID] = @ConsigneeIsgecID
  ,[ConsignerBPID] = @ConsignerBPID
  ,[ConsigneeBPID] = @ConsigneeBPID
  ,[ConsignerGSTIN] = @ConsignerGSTIN
  ,[ConsigneeGSTIN] = @ConsigneeGSTIN
  ,[ConsignerName] = @ConsignerName
  ,[ConsigneeName] = @ConsigneeName
  ,[ConsignerGSTINNo] = @ConsignerGSTINNo
  ,[ConsigneeGSTINNo] = @ConsigneeGSTINNo
  ,[ConsignerAddress1Line] = @ConsignerAddress1Line
  ,[ConsigneeAddress1Line] = @ConsigneeAddress1Line
  ,[ConsignerAddress2Line] = @ConsignerAddress2Line
  ,[ConsigneeAddress2Line] = @ConsigneeAddress2Line
  ,[ConsignerAddress3Line] = @ConsignerAddress3Line
  ,[ConsigneeAddress3Line] = @ConsigneeAddress3Line
  ,[ConsignerStateID] = @ConsignerStateID
  ,[ConsigneeStateID] = @ConsigneeStateID
  ,[Purpose] = @Purpose
  ,[ExpectedReturnDate] = @ExpectedReturnDate
  ,[ModeOfTransportID] = @ModeOfTransportID
  ,[VehicleNo] = @VehicleNo
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[FromPlace] = @FromPlace
  ,[ToPlace] = @ToPlace
  ,[StatusID] = @StatusID
  ,[CreatedBy] = @CreatedBy
  ,[TotalAmount] = @TotalAmount
  ,[Declaration1Line] = @Declaration1Line
  ,[CreatedOn] = @CreatedOn
  ,[TotalAmountInWords] = @TotalAmountInWords
  ,[Declaration2Line] = @Declaration2Line
  WHERE
  [ChallanID] = @Original_ChallanID
  SET @RowCount = @@RowCount
GO
