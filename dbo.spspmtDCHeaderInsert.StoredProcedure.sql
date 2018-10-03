USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderInsert]
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
  @Return_ChallanID NVarChar(20) = null OUTPUT 
  AS
  INSERT [SPMT_DCHeader]
  (
   [ChallanID]
  ,[LinkedChallanID]
  ,[DestinationIsgecID]
  ,[DestinationBPID]
  ,[DestinationGSTIN]
  ,[DestinationName]
  ,[DestinationGSTINNo]
  ,[DestinationAddress1Line]
  ,[DestinationAddress2Line]
  ,[DestinationAddress3Line]
  ,[DestinationStateID]
  ,[ReceivedDate]
  ,[ReceivedRemarks]
  ,[ReceivedOn]
  ,[ReceivedBy]
  ,[ClosureRemarks]
  ,[ClosureDate]
  ,[ClosedBy]
  ,[ClosedOn]
  ,[IsgecInvoiceNo]
  ,[IsgecInvoiceDate]
  ,[ChallanDate]
  ,[IssuerID]
  ,[IssuerCompanyName]
  ,[IssuerAddress1Line]
  ,[IssuerAddress2Line]
  ,[IssuerPAN]
  ,[IssuerCIN]
  ,[ProjectID]
  ,[UnitID]
  ,[PONo]
  ,[PlaceOfSupply]
  ,[PlaceOfDelivery]
  ,[ConsignerIsgecID]
  ,[ConsigneeIsgecID]
  ,[ConsignerBPID]
  ,[ConsigneeBPID]
  ,[ConsignerGSTIN]
  ,[ConsigneeGSTIN]
  ,[ConsignerName]
  ,[ConsigneeName]
  ,[ConsignerGSTINNo]
  ,[ConsigneeGSTINNo]
  ,[ConsignerAddress1Line]
  ,[ConsigneeAddress1Line]
  ,[ConsignerAddress2Line]
  ,[ConsigneeAddress2Line]
  ,[ConsignerAddress3Line]
  ,[ConsigneeAddress3Line]
  ,[ConsignerStateID]
  ,[ConsigneeStateID]
  ,[Purpose]
  ,[ExpectedReturnDate]
  ,[ModeOfTransportID]
  ,[VehicleNo]
  ,[GRNo]
  ,[GRDate]
  ,[TransporterID]
  ,[TransporterName]
  ,[FromPlace]
  ,[ToPlace]
  ,[StatusID]
  ,[CreatedBy]
  ,[TotalAmount]
  ,[Declaration1Line]
  ,[CreatedOn]
  ,[TotalAmountInWords]
  ,[Declaration2Line]
  )
  VALUES
  (
   UPPER(@ChallanID)
  ,@LinkedChallanID
  ,@DestinationIsgecID
  ,@DestinationBPID
  ,@DestinationGSTIN
  ,@DestinationName
  ,@DestinationGSTINNo
  ,@DestinationAddress1Line
  ,@DestinationAddress2Line
  ,@DestinationAddress3Line
  ,@DestinationStateID
  ,@ReceivedDate
  ,@ReceivedRemarks
  ,@ReceivedOn
  ,@ReceivedBy
  ,@ClosureRemarks
  ,@ClosureDate
  ,@ClosedBy
  ,@ClosedOn
  ,@IsgecInvoiceNo
  ,@IsgecInvoiceDate
  ,@ChallanDate
  ,@IssuerID
  ,@IssuerCompanyName
  ,@IssuerAddress1Line
  ,@IssuerAddress2Line
  ,@IssuerPAN
  ,@IssuerCIN
  ,@ProjectID
  ,@UnitID
  ,@PONo
  ,@PlaceOfSupply
  ,@PlaceOfDelivery
  ,@ConsignerIsgecID
  ,@ConsigneeIsgecID
  ,@ConsignerBPID
  ,@ConsigneeBPID
  ,@ConsignerGSTIN
  ,@ConsigneeGSTIN
  ,@ConsignerName
  ,@ConsigneeName
  ,@ConsignerGSTINNo
  ,@ConsigneeGSTINNo
  ,@ConsignerAddress1Line
  ,@ConsigneeAddress1Line
  ,@ConsignerAddress2Line
  ,@ConsigneeAddress2Line
  ,@ConsignerAddress3Line
  ,@ConsigneeAddress3Line
  ,@ConsignerStateID
  ,@ConsigneeStateID
  ,@Purpose
  ,@ExpectedReturnDate
  ,@ModeOfTransportID
  ,@VehicleNo
  ,@GRNo
  ,@GRDate
  ,@TransporterID
  ,@TransporterName
  ,@FromPlace
  ,@ToPlace
  ,@StatusID
  ,@CreatedBy
  ,@TotalAmount
  ,@Declaration1Line
  ,@CreatedOn
  ,@TotalAmountInWords
  ,@Declaration2Line
  )
  SET @Return_ChallanID = @ChallanID
GO
