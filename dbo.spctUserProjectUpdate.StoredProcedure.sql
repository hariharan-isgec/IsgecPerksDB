USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserProjectUpdate]
  @Original_UserID NVarChar(8), 
  @Original_ProjectID NVarChar(6), 
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @IsActive Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [CT_UserProject] SET 
   [UserID] = @UserID
  ,[ProjectID] = @ProjectID
  ,[IsActive] = @IsActive
  WHERE
  [UserID] = @Original_UserID
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
