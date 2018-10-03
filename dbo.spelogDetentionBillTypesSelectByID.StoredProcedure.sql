USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesSelectByID]
  @LoginID NVarChar(8),
  @BillTypeID Int 
  AS
  SELECT
    [ELOG_DetentionBillTypes].*  
  FROM [ELOG_DetentionBillTypes] 
  WHERE
  [ELOG_DetentionBillTypes].[BillTypeID] = @BillTypeID
GO
