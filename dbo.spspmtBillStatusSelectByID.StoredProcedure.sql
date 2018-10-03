USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusSelectByID]
  @LoginID NVarChar(8),
  @BillStatusID Int 
  AS
  SELECT
    [SPMT_BillStatus].*  
  FROM [SPMT_BillStatus] 
  WHERE
  [SPMT_BillStatus].[BillStatusID] = @BillStatusID
GO
