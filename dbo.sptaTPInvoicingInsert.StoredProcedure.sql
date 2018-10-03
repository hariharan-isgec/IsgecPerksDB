USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingInsert]
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
  @Return_InvoiceNo NVarChar(15) = null OUTPUT 
  AS
  INSERT [TA_TPInvoicing]
  (
   [InvoiceNo]
  ,[InvoiceDate]
  ,[PAXName]
  ,[Sector]
  ,[BookingDate]
  ,[TravelDate]
  ,[AirlinesName]
  ,[TicketNo]
  ,[NetAmount]
  ,[EmployeeCode]
  ,[Sanction]
  ,[AirlineType]
  )
  VALUES
  (
   UPPER(@InvoiceNo)
  ,@InvoiceDate
  ,@PAXName
  ,@Sector
  ,@BookingDate
  ,@TravelDate
  ,@AirlinesName
  ,@TicketNo
  ,@NetAmount
  ,@EmployeeCode
  ,@Sanction
  ,@AirlineType
  )
  SET @Return_InvoiceNo = @InvoiceNo
GO
