USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmUsersUpdate]
  @Original_UserName NVarChar(20), 
  @UserFullName NVarChar(50),
  @ExtnNo NVarChar(50),
  @MobileNo NVarChar(50),
  @EMailID NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [UserFullName] = @UserFullName
  ,[ExtnNo] = @ExtnNo
  ,[MobileNo] = @MobileNo
  ,[EMailID] = @EMailID
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO
