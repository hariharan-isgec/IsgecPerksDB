USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrk_LG_DeleteEntitlementsByEmployeePerk]
  @EmployeeID	  Int,
  @PerkID       Int,
  @FDate NVarChar(10),
  @TDate NVarChar(10)
AS
  DELETE FROM PRK_Entitlements 
  WHERE EmployeeID = @EmployeeID 
  AND   PerkID = @PerkID 
  AND EffectiveDate BETWEEN @FDate AND @TDate
GO
