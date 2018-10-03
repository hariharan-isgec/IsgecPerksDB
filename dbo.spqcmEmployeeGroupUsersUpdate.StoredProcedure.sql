USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersUpdate]
  @Original_GroupiD Int, 
  @Original_CardNo NVarChar(8), 
  @GroupiD Int,
  @CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_EmployeeGroupUsers] SET 
   [GroupiD] = @GroupiD
  ,[CardNo] = @CardNo
  WHERE
  [GroupiD] = @Original_GroupiD
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
