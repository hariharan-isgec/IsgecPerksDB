USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesDelete]
  @Original_BillType Int,
  @Original_HSNSACCode NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_HSNSACCodes]
  WHERE
  [SPMT_HSNSACCodes].[BillType] = @Original_BillType
  AND [SPMT_HSNSACCodes].[HSNSACCode] = @Original_HSNSACCode
  SET @RowCount = @@RowCount
GO
