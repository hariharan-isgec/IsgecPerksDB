USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusDelete]
  @Original_ReceiveStatusID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_ReceiveStatus]
  WHERE
  [IDM_ReceiveStatus].[ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
