USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_UserRoles]
  WHERE
  [ERP_UserRoles].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
