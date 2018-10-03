USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersDelete]
  @Original_GroupiD Int,
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_EmployeeGroupUsers]
  WHERE
  [QCM_EmployeeGroupUsers].[GroupiD] = @Original_GroupiD
  AND [QCM_EmployeeGroupUsers].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
