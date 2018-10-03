USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEmployeeEMailGroupDelete]
  @Original_CardNo NVarChar(8),
  @Original_EMailGroup NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_EmployeeEMailGroup]
  WHERE
  [HRM_EmployeeEMailGroup].[CardNo] = @Original_CardNo
  AND [HRM_EmployeeEMailGroup].[EMailGroup] = @Original_EMailGroup
  SET @RowCount = @@RowCount
GO
