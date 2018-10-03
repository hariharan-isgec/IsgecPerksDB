USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_SwrDAUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @CityTypeID NVarChar(6),
  @HotelStayDA Decimal(10,2),
  @SwrDA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_SwrDA] SET 
   [CategoryID] = @CategoryID
  ,[CityTypeID] = @CityTypeID
  ,[HotelStayDA] = @HotelStayDA
  ,[SwrDA] = @SwrDA
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
