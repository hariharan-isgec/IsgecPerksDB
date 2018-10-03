USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDAUpdate]
  @Original_SerialNo Int, 
  @Perm_Bord_DA Decimal(10,2),
  @Cont_NonT_Bord_DA Decimal(10,2),
  @Cont_Tech_Bord_DA Decimal(10,2),
  @CategoryID Int,
  @Cont_Tech_DA Decimal(10,2),
  @Cont_NonT_DA Decimal(10,2),
  @Perm_DA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_F_SiteDA] SET 
   [Perm_Bord_DA] = @Perm_Bord_DA
  ,[Cont_NonT_Bord_DA] = @Cont_NonT_Bord_DA
  ,[Cont_Tech_Bord_DA] = @Cont_Tech_Bord_DA
  ,[CategoryID] = @CategoryID
  ,[Cont_Tech_DA] = @Cont_Tech_DA
  ,[Cont_NonT_DA] = @Cont_NonT_DA
  ,[Perm_DA] = @Perm_DA
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
