USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomersDelete]
  @Original_CustomerID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Customers]
  WHERE
  [IDM_Customers].[CustomerID] = @Original_CustomerID
  SET @RowCount = @@RowCount
GO
