USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsHDelete]
  @Original_FinYear NVarChar(4),
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_FormsH]
  WHERE
  [PMS_FormsH].[FinYear] = @Original_FinYear
  AND [PMS_FormsH].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
