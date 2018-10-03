USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPerksUpdate]
  @Original_PerkID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Perks] SET 
   [PerkCode] = @PerkCode
  ,[Description] = @Description
  ,[AdvanceApplicable] = @AdvanceApplicable
  ,[AdvanceMonths] = @AdvanceMonths
  ,[LockedMonths] = @LockedMonths
  ,[NoOfPayments] = @NoOfPayments
  ,[CarryForward] = @CarryForward
  ,[UOM] = @UOM
  ,[Active] = @Active
  ,[BaaNGL] = @BaaNGL
  ,[BaaNReference] = @BaaNReference
  ,[CreditGLForCheque] = @CreditGLForCheque
  ,[CreditGLForCash24] = @CreditGLForCash24
  ,[CreditGLForImprest] = @CreditGLForImprest
  ,[CreditGLForCash63] = @CreditGLForCash63
  WHERE
  [PerkID] = @Original_PerkID
  SET @RowCount = @@RowCount
GO
