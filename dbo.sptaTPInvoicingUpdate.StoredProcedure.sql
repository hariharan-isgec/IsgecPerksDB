USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingUpdate]
  @Original_InvoiceNo NVarChar(15), 
  @InvoiceNo NVarChar(15),
  @InvoiceDate DateTime,
  @PAXName NVarChar(50),
  @Sector NVarChar(50),
  @BookingDate DateTime,
  @TravelDate DateTime,
  @AirlinesName NVarChar(50),
  @TicketNo NVarChar(50),
  @NetAmount Decimal(8),
  @EmployeeCode NVarChar(8),
  @Sanction NVarChar(50),
  @AirlineType NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_TPInvoicing] SET 
   [InvoiceNo] = @InvoiceNo
  ,[InvoiceDate] = @InvoiceDate
  ,[PAXName] = @PAXName
  ,[Sector] = @Sector
  ,[BookingDate] = @BookingDate
  ,[TravelDate] = @TravelDate
  ,[AirlinesName] = @AirlinesName
  ,[TicketNo] = @TicketNo
  ,[NetAmount] = @NetAmount
  ,[EmployeeCode] = @EmployeeCode
  ,[Sanction] = @Sanction
  ,[AirlineType] = @AirlineType
  WHERE
  [InvoiceNo] = @Original_InvoiceNo
  SET @RowCount = @@RowCount
GO
