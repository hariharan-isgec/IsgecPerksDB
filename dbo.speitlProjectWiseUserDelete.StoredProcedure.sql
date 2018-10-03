USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserDelete]
  @Original_SerialNo BigInt,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_ProjectWiseUser]
  WHERE
  [EITL_ProjectWiseUser].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
