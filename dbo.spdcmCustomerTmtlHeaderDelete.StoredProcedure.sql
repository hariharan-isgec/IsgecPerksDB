USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderDelete]
  @Original_TmtlID Int,
  @Original_ProjectID NVarChar(6),
  @Original_CustomerID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_CustomerTmtlHeader]
  WHERE
  [DCM_CustomerTmtlHeader].[TmtlID] = @Original_TmtlID
  AND [DCM_CustomerTmtlHeader].[ProjectID] = @Original_ProjectID
  AND [DCM_CustomerTmtlHeader].[CustomerID] = @Original_CustomerID
  SET @RowCount = @@RowCount
GO
