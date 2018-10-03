USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWComplaintsUpdate]
  @Original_CallID Int, 
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
  @CallStatusID NVarChar(20),
  @LoggedOn DateTime,
  @LoggedBy NVarChar(8),
  @FirstAttendedOn DateTime,
  @ClosedOn DateTime,
  @FirstAttended Bit,
  @Closed Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_Complaints] SET 
   [EndUserID] = @EndUserID
  ,[CallTypeID] = @CallTypeID
  ,[Description] = @Description
  ,[AssignedTo] = @AssignedTo
  ,[CallStatusID] = @CallStatusID
  ,[LoggedOn] = @LoggedOn
  ,[LoggedBy] = @LoggedBy
  ,[FirstAttendedOn] = @FirstAttendedOn
  ,[ClosedOn] = @ClosedOn
  ,[FirstAttended] = @FirstAttended
  ,[Closed] = @Closed
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
