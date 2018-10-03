USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmRegisterComplaintDelete]
  @Original_CallID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Complaints]
  WHERE
  [ADM_Complaints].[CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
