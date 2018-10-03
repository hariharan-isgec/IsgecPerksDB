USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @CityTypeID NVarChar(6),
  @LodgingAmount Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_Lodging] SET 
   [CategoryID] = @CategoryID
  ,[CityTypeID] = @CityTypeID
  ,[LodgingAmount] = @LodgingAmount
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
