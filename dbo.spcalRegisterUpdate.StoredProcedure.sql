USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterUpdate]
  @UserID NVarChar(8),
  @CallTypeID Int,
  @CallDescription NVarChar(500),
  @LoggedOn DateTime,
  @AttenderID NVarChar(8),
  @AttendedOn DateTime,
  @AttenderDescription NVarChar(500),
  @CallStatusID Int,
  @ClosedOn DateTime,
  @SignedOffOn DateTime,
  @FileAttached NvarChar(250), 
  @FileExtention NvarChar(10), 
  @Original_CallID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Register] SET 
   [UserID] = @UserID
  ,[CallTypeID] = @CallTypeID
  ,[CallDescription] = @CallDescription
  ,[LoggedOn] = @LoggedOn
  ,[AttenderID] = @AttenderID
  ,[AttendedOn] = @AttendedOn
  ,[AttenderDescription] = @AttenderDescription
  ,[CallStatusID] = @CallStatusID
  ,[ClosedOn] = @ClosedOn
  ,[SignedOffOn] = @SignedOffOn
	,[FileAttached] = @FileAttached
	,[FileExtention] = @FileExtention    
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
