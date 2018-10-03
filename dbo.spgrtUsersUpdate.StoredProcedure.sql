USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersUpdate]
  @Original_UserID NVarChar(8), 
  @UserID NVarChar(8),
  @Designation NVarChar(100),
  @Department NVarChar(100),
  @DirectNo NVarChar(100),
  @CellNo NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [GRT_Users] SET 
   [UserID] = @UserID
  ,[Designation] = @Designation
  ,[Department] = @Department
  ,[DirectNo] = @DirectNo
  ,[CellNo] = @CellNo
  WHERE
  [UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
