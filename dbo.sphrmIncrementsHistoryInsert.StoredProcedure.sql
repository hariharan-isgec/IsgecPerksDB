USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmIncrementsHistoryInsert]
  @CardNo NVarChar(8),
  @IncrementOn DateTime,
  @BasicSalary Decimal(12,2),
  @Remarks NVarChar(250),
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Return_IncrementID Int = null OUTPUT
  AS
  INSERT [HRM_Increments]
  (
   [CardNo]
  ,[IncrementOn]
  ,[BasicSalary]
  ,[Remarks]
  ,[Executed]
  ,[Cancelled]
  ,[ProcessedBy]
  ,[ProcessedOn]
  )
  VALUES
  (
   @CardNo
  ,@IncrementOn
  ,@BasicSalary
  ,@Remarks
  ,@Executed
  ,@Cancelled
  ,@ProcessedBy
  ,@ProcessedOn
  )
  SET @Return_IncrementID = Scope_Identity()
GO
