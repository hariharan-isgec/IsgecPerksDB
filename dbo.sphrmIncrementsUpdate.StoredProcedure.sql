USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmIncrementsUpdate]
  @C_BasicSalary Decimal(12,2),
  @U_UnderIncrement Bit,
  @U_NewBasicSalary Decimal(12,2),
  @C_IncrementOn DateTime,
  @C_IncrementRemark NVarChar(250),
  @ModifiedEvent NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [C_BasicSalary] = @C_BasicSalary
  ,[U_UnderIncrement] = @U_UnderIncrement
  ,[U_NewBasicSalary] = @U_NewBasicSalary
  ,[C_IncrementOn] = @C_IncrementOn
  ,[C_IncrementRemark] = @C_IncrementRemark
  ,[ModifiedEvent] = @ModifiedEvent
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
