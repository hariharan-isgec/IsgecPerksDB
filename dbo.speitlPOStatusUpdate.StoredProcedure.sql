USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusUpdate]
  @Original_StatusID Int, 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_POStatus] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
