USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversDelete]
  @Original_FinYear NVarChar(4),
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_Approvers]
  WHERE
  [PMS_Approvers].[FinYear] = @Original_FinYear
  AND [PMS_Approvers].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
