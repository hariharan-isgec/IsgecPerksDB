USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQlfUpdateDelete]
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_QlfUpdate]
  WHERE
  [HRM_QlfUpdate].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
