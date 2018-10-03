USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkLedgerInsert]
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
  @DocumentID Int = null OUTPUT
  AS
  INSERT [PRK_Ledger]
  (
   [EmployeeID]
  ,[PerkID]
  ,[TranType]
  ,[TranDate]
  ,[Value]
  ,[UOM]
  ,[Amount]
  ,[Remarks]
  ,[CreatedBy]
  ,[FinYear]
  ,[ApplicationID]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@TranType
  ,@TranDate
  ,@Value
  ,@UOM
  ,@Amount
  ,@Remarks
  ,@CreatedBy
  ,@FinYear
  ,@ApplicationID
  )
  SET @DocumentID = Scope_Identity()
GO
