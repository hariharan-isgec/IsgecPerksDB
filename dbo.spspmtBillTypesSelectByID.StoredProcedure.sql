USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesSelectByID]
  @LoginID NVarChar(8),
  @BillType Int 
  AS
  SELECT
    [SPMT_BillTypes].*  
  FROM [SPMT_BillTypes] 
  WHERE
  [SPMT_BillTypes].[BillType] = @BillType
GO
