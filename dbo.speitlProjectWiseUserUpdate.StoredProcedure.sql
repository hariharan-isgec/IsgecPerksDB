USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserUpdate]
  @Original_SerialNo BigInt, 
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_ProjectWiseUser] SET 
   [UserID] = @UserID
  ,[ProjectID] = @ProjectID
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
