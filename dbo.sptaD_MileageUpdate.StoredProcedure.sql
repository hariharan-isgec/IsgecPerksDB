USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_MileageUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @CityID NVarChar(30),
  @OtherCity Bit,
  @AmountPerKM Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_Mileage] SET 
   [CategoryID] = @CategoryID
  ,[CityID] = @CityID
  ,[OtherCity] = @OtherCity
  ,[AmountPerKM] = @AmountPerKM
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
