USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomCompaniesDelete]
  @Original_CompanyID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Companies]
  WHERE
  [HRM_Companies].[CompanyID] = @Original_CompanyID
  SET @RowCount = @@RowCount
GO
