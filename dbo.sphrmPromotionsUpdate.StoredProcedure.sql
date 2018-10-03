USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsUpdate]
  @C_DesignationID Int,
  @U_UnderPromotion Bit,
  @U_NewDesignationID Int,
  @C_PromotionOn DateTime,
  @C_PromotionRemark NVarChar(250),
  @ModifiedEvent NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [C_DesignationID] = @C_DesignationID
  ,[U_UnderPromotion] = @U_UnderPromotion
  ,[U_NewDesignationID] = @U_NewDesignationID
  ,[C_PromotionOn] = @C_PromotionOn
  ,[C_PromotionRemark] = @C_PromotionRemark
  ,[ModifiedEvent] = @ModifiedEvent
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
