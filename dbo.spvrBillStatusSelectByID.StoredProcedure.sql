USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusSelectByID]
  @LoginID NVarChar(8),
  @BillStatusID Int 
  AS
  SELECT
		[VR_BillStatus].[BillStatusID] ,
		[VR_BillStatus].[Description]  
  FROM [VR_BillStatus] 
  WHERE
  [VR_BillStatus].[BillStatusID] = @BillStatusID
GO
