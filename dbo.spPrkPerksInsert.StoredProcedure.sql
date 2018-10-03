USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkPerksInsert]
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
  @PerkID Int = null OUTPUT
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
  )
  SET @PerkID = Scope_Identity()
GO
