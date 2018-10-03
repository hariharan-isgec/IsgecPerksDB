USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsHistoryInsert]
  @CardNo NVarChar(8),
  @PromotionOn DateTime,
  @DesignationID Int,
  @Remarks NVarChar(250),
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Return_PromotionID Int = null OUTPUT
  AS
  INSERT [HRM_Promotions]
  (
   [CardNo]
  ,[PromotionOn]
  ,[DesignationID]
  ,[Remarks]
  ,[Executed]
  ,[Cancelled]
  ,[ProcessedBy]
  ,[ProcessedOn]
  )
  VALUES
  (
   @CardNo
  ,@PromotionOn
  ,@DesignationID
  ,@Remarks
  ,@Executed
  ,@Cancelled
  ,@ProcessedBy
  ,@ProcessedOn
  )
  SET @Return_PromotionID = Scope_Identity()
GO
