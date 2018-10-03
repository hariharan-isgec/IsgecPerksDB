USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaUpdate]
  @Original_IssuedViaID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_IssuedVia] SET 
   [Description] = @Description
  WHERE
  [IssuedViaID] = @Original_IssuedViaID
  SET @RowCount = @@RowCount
GO
