USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINUpdate]
  @Original_BPID NVarChar(9), 
  @Original_GSTIN Int, 
  @BPID NVarChar(9),
  @GSTIN Int,
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_BPGSTIN] SET 
   [BPID] = @BPID
  ,[GSTIN] = @GSTIN
  ,[Description] = @Description
  WHERE
  [BPID] = @Original_BPID
  AND [GSTIN] = @Original_GSTIN
  SET @RowCount = @@RowCount
GO
