USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCashPaymentInsert]
  @UpdatedInLedger Bit,
  @UpdatedOn DateTime,
  @UpdatedBy Int,
  @StatusID Int,
  @FinYear Int,
  @ApplicationID Int = null OUTPUT
  AS
  INSERT [PRK_Applications]
  (
   [UpdatedInLedger]
  ,[UpdatedOn]
  ,[UpdatedBy]
  ,[StatusID]
  ,[FinYear]
  )
  VALUES
  (
   @UpdatedInLedger
  ,@UpdatedOn
  ,@UpdatedBy
  ,@StatusID
  ,@FinYear
  )
  SET @ApplicationID = Scope_Identity()
GO
