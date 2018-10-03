USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlDetailsDelete]
  @Original_TmtlID Int,
  @Original_ProjectID NVarChar(6),
  @Original_CustomerID NVarChar(6),
  @Original_DocumentID NVarChar(30),
  @Original_RevisionNo NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_CustomerTmtlDetails]
  WHERE
  [DCM_CustomerTmtlDetails].[TmtlID] = @Original_TmtlID
  AND [DCM_CustomerTmtlDetails].[ProjectID] = @Original_ProjectID
  AND [DCM_CustomerTmtlDetails].[CustomerID] = @Original_CustomerID
  AND [DCM_CustomerTmtlDetails].[DocumentID] = @Original_DocumentID
  AND [DCM_CustomerTmtlDetails].[RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
