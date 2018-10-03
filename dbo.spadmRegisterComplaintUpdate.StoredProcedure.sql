USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmRegisterComplaintUpdate]
  @Original_CallID Int, 
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_Complaints] SET 
   [EndUserID] = @EndUserID
  ,[CallTypeID] = @CallTypeID
  ,[Description] = @Description
  ,[AssignedTo] = @AssignedTo
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
