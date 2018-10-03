USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPerksInsert]
  @PerkCode NVarChar(3),
  @Description NVarChar(50),
  @AdvanceApplicable Bit,
  @AdvanceMonths Int,
  @LockedMonths Int,
  @NoOfPayments Int,
  @CarryForward Bit,
  @UOM NVarChar(5),
  @Active Bit,
  @BaaNGL NVarChar(7),
  @BaaNReference NVarChar(30),
  @CreditGLForCheque NVarChar(7),
  @CreditGLForCash24 NVarChar(7),
  @CreditGLForImprest NVarChar(7),
  @CreditGLForCash63 NVarChar(7),
  @Return_PerkID Int = null OUTPUT 
  AS
  INSERT [PRK_Perks]
  (
   [PerkCode]
  ,[Description]
  ,[AdvanceApplicable]
  ,[AdvanceMonths]
  ,[LockedMonths]
  ,[NoOfPayments]
  ,[CarryForward]
  ,[UOM]
  ,[Active]
  ,[BaaNGL]
  ,[BaaNReference]
  ,[CreditGLForCheque]
  ,[CreditGLForCash24]
  ,[CreditGLForImprest]
  ,[CreditGLForCash63]
  )
  VALUES
  (
   @PerkCode
  ,@Description
  ,@AdvanceApplicable
  ,@AdvanceMonths
  ,@LockedMonths
  ,@NoOfPayments
  ,@CarryForward
  ,@UOM
  ,@Active
  ,@BaaNGL
  ,@BaaNReference
  ,@CreditGLForCheque
  ,@CreditGLForCash24
  ,@CreditGLForImprest
  ,@CreditGLForCash63
  )
  SET @Return_PerkID = Scope_Identity()
GO
