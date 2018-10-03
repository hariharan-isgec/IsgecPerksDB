USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserGroupDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_UserGroup]
  WHERE
  [VR_UserGroup].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
