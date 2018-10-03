USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearDelete]
  @Original_FinYear NVarChar(4),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_FinYear]
  WHERE
  [PMS_FinYear].[FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO
