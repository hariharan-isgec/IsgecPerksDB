USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmITRegisterComplaintDelete]
  @Original_CallID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITComplaints]
  WHERE
  [ADM_ITComplaints].[CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
