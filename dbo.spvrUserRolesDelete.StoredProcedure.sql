USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_UserRoles]
  WHERE
  [VR_UserRoles].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
