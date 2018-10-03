USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberDelete]
  @Original_NumberID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_DCLastNumber]
  WHERE
  [SPMT_DCLastNumber].[NumberID] = @Original_NumberID
  SET @RowCount = @@RowCount
GO
