USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusUpdate]
  @Original_AdviceStatusID Int, 
  @Description NVarChar(30),
  @NextStatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_PAStatus] SET 
   [Description] = @Description
  ,[NextStatusID] = @NextStatusID
  WHERE
  [AdviceStatusID] = @Original_AdviceStatusID
  SET @RowCount = @@RowCount
GO
