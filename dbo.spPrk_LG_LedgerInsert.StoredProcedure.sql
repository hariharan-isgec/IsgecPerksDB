USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrk_LG_LedgerInsert]
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
  @ParentDocumentID Int,
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
  ,[ParentDocumentID]
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
  ,@ParentDocumentID
  )
  SET @DocumentID = Scope_Identity()
GO
