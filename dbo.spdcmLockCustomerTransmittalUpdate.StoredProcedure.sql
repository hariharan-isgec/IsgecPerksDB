USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmLockCustomerTransmittalUpdate]
  @Original_TmtlID Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_CustomerID NVarChar(6), 
  @TmtlStatusID NVarChar(1),
  @ApprovedOn DateTime,
  @ApprovedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_CustomerTmtlHeader] SET 
   [TmtlStatusID] = @TmtlStatusID
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovedBy] = @ApprovedBy
  WHERE
  [TmtlID] = @Original_TmtlID
  AND [ProjectID] = @Original_ProjectID
  AND [CustomerID] = @Original_CustomerID
  SET @RowCount = @@RowCount
GO
