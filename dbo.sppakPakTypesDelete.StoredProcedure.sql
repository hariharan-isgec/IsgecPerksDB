USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesDelete]
  @Original_PackTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PakTypes]
  WHERE
  [PAK_PakTypes].[PackTypeID] = @Original_PackTypeID
  SET @RowCount = @@RowCount
GO
