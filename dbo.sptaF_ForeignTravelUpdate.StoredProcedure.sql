USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_ForeignTravelUpdate]
  @Original_SerialNo Int, 
  @Bord_Lodg_DA_Percent Decimal(10,2),
  @Lodg_DA_Percent Decimal(10,2),
  @DA_Adjested_LC_Percent Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_F_ForeignTravel] SET 
   [Bord_Lodg_DA_Percent] = @Bord_Lodg_DA_Percent
  ,[Lodg_DA_Percent] = @Lodg_DA_Percent
  ,[DA_Adjested_LC_Percent] = @DA_Adjested_LC_Percent
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
