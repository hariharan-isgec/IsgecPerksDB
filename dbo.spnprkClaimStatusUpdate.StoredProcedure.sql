USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusUpdate]
  @Original_ClaimStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_ClaimStatus] SET 
   [Description] = @Description
  WHERE
  [ClaimStatusID] = @Original_ClaimStatusID
  SET @RowCount = @@RowCount
GO
