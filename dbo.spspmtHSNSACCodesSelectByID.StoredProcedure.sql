USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesSelectByID]
  @LoginID NVarChar(8),
  @BillType Int,
  @HSNSACCode NVarChar(20) 
  AS
  SELECT
    [SPMT_HSNSACCodes].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description 
  FROM [SPMT_HSNSACCodes] 
  INNER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_HSNSACCodes].[BillType] = [SPMT_BillTypes1].[BillType]
  WHERE
  [SPMT_HSNSACCodes].[BillType] = @BillType
  AND [SPMT_HSNSACCodes].[HSNSACCode] = @HSNSACCode
GO
