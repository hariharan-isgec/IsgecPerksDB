USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_LodgDAUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @RegionID NVarChar(10),
  @Lodging Decimal(10,2),
  @DA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_F_LodgDA] SET 
   [CategoryID] = @CategoryID
  ,[RegionID] = @RegionID
  ,[Lodging] = @Lodging
  ,[DA] = @DA
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
