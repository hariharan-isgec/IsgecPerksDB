USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsHistoryDelete]
  @Original_PromotionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Promotions]
  WHERE
  [HRM_Promotions].[PromotionID] = @Original_PromotionID
  SET @RowCount = @@RowCount
GO
