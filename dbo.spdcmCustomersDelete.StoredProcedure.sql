USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersDelete]
  @Original_CustomerID NVarChar(6),
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_Customers]
  WHERE
  [DCM_Customers].[CustomerID] = @Original_CustomerID
  AND [DCM_Customers].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
