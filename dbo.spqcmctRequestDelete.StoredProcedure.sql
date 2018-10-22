USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmctRequestDelete]
  @Original_QCRequestNo Int,
  @Original_SerialNo Int,
  @Original_PONumber NVarChar(9),
  @Original_ItemReference VarChar(200),
  @Original_ActivityID VarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_CT_Request]
  WHERE
  [QCM_CT_Request].[QCRequestNo] = @Original_QCRequestNo
  AND [QCM_CT_Request].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
