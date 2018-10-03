USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersUpdate]
  @Original_UserID NVarChar(20), 
  @UserName NVarChar(40),
  @CreatedBy NVarChar(8),
  @ActivateOn DateTime,
  @TillDays Decimal(3),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_WebUsers] SET 
   [UserName] = @UserName
  ,[CreatedBy] = @CreatedBy
  ,[ActivateOn] = @ActivateOn
  ,[TillDays] = @TillDays
  WHERE
  [UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
