USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsDDelete]
  @Original_FinYear NVarChar(4),
  @Original_CardNo NVarChar(8),
  @Original_SrNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_FormsD]
  WHERE
  [PMS_FormsD].[FinYear] = @Original_FinYear
  AND [PMS_FormsD].[CardNo] = @Original_CardNo
  AND [PMS_FormsD].[SrNo] = @Original_SrNo
  SET @RowCount = @@RowCount
GO
