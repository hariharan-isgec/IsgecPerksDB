USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_PunchConfigDetails]
  WHERE
  [ATN_PunchConfigDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
