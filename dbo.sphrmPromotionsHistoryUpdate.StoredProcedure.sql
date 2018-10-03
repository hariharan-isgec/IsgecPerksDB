USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsHistoryUpdate]
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Original_PromotionID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Promotions] SET 
   [Executed] = @Executed
  ,[Cancelled] = @Cancelled
  ,[ProcessedBy] = @ProcessedBy
  ,[ProcessedOn] = @ProcessedOn
  WHERE
  [PromotionID] = @Original_PromotionID
  SET @RowCount = @@RowCount
GO
