USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINUpdate]
  @Original_GSTID Int, 
  @GSTID Int,
  @Description NVarChar(50),
  @State NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_IsgecGSTIN] SET 
   [GSTID] = @GSTID
  ,[Description] = @Description
  ,[State] = @State
  WHERE
  [GSTID] = @Original_GSTID
  SET @RowCount = @@RowCount
GO
