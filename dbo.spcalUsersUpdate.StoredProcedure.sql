USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalUsersUpdate]
  @LocationID Int,
  @ExtnNo NVarChar(50),
  @MobileNo NVarChar(50),
  @EMailID NVarChar(50),
  @NetworkIP Nvarchar(15), 
  @Original_UserName NVarChar(20), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [LocationID] = @LocationID
  ,[ExtnNo] = @ExtnNo
  ,[MobileNo] = @MobileNo
  ,[EMailID] = @EMailID
	,[NetworkIP] = @NetworkIP 
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO
