USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsUpdate]
  @Original_DivisionID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Divisions] SET 
   [Description] = @Description
  WHERE
  [DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
