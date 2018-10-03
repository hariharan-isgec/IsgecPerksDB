USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusSelectByID]
  @LoginID NVarChar(8),
  @BillStatusID Int 
  AS
  SELECT
		[ERP_TPTBillStatus].[BillStatusID] ,
		[ERP_TPTBillStatus].[Description]  
  FROM [ERP_TPTBillStatus] 
  WHERE
  [ERP_TPTBillStatus].[BillStatusID] = @BillStatusID
GO
