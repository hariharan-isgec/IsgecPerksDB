USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkLedgerUpdate]
  @EmployeeID Int,
  @PerkID Int,
  @TranType NVarChar(3),
  @TranDate DateTime,
  @Value Decimal(10,2),
  @UOM NVarChar(5),
  @Amount Decimal(10,2),
  @Remarks NVarChar(500),
  @CreatedBy Int,
  @FinYear Int,
  @ApplicationID Int,
  @Original_DocumentID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Ledger] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[TranType] = @TranType
  ,[TranDate] = @TranDate
  ,[Value] = @Value
  ,[UOM] = @UOM
  ,[Amount] = @Amount
  ,[Remarks] = @Remarks
  ,[CreatedBy] = @CreatedBy
  ,[FinYear] = @FinYear
  ,[ApplicationID] = @ApplicationID
  WHERE
  [DocumentID] = @Original_DocumentID
  SET @RowCount = @@RowCount
GO
