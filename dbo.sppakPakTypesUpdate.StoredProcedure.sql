USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesUpdate]
  @Original_PackTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PakTypes] SET 
   [Description] = @Description
  WHERE
  [PackTypeID] = @Original_PackTypeID
  SET @RowCount = @@RowCount
GO
