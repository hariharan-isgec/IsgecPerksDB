USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserUpdate]
  @Original_CardNo NVarChar(8), 
  @Original_AttenMonth Int, 
  @EmployeeName NVarChar(50),
  @SFinalValue Decimal(38,2),
  @Designation_Description NVarChar(30),
  @Department_Description NVarChar(30),
  @Office_Description NVarChar(50),
  @FinYear NVarChar(4),
  @EMailID NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATNv_PendingRegularization] SET 
   [EmployeeName] = @EmployeeName
  ,[SFinalValue] = @SFinalValue
  ,[Designation_Description] = @Designation_Description
  ,[Department_Description] = @Department_Description
  ,[Office_Description] = @Office_Description
  ,[FinYear] = @FinYear
  ,[EMailID] = @EMailID
  WHERE
  [CardNo] = @Original_CardNo
  AND [AttenMonth] = @Original_AttenMonth
  SET @RowCount = @@RowCount
GO
