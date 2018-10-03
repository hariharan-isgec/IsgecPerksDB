USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_DriverUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @DriverAmount Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_Driver] SET 
   [CategoryID] = @CategoryID
  ,[DriverAmount] = @DriverAmount
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
