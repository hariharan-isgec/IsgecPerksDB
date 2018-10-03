USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorDelete]
  @Original_OriginatorID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Originator]
  WHERE
  [IDM_Originator].[OriginatorID] = @Original_OriginatorID
  SET @RowCount = @@RowCount
GO
