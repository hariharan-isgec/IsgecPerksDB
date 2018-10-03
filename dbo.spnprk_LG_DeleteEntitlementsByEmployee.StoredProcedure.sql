USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_DeleteEntitlementsByEmployee]
  @EmployeeID	Int,
  @FDate NVarChar(10),
  @TDate NVarChar(10)
AS
  DELETE FROM PRK_Entitlements
  WHERE EmployeeID = @EmployeeID  
  AND  EffectiveDate BETWEEN @FDate AND @TDate
GO
