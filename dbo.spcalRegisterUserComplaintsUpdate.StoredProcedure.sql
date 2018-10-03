USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterUserComplaintsUpdate]
  @UserID NVarChar(8),
  @CallTypeID Int,
  @CallDescription NVarChar(500),
  @FileAttached NVarChar(250),
  @FileExtention NVarChar(10),
  @Original_CallID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Register] SET 
   [UserID] = @UserID
  ,[CallTypeID] = @CallTypeID
  ,[CallDescription] = @CallDescription
	,[FileAttached] = @FileAttached
	,[FileExtention] = @FileExtention    
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
