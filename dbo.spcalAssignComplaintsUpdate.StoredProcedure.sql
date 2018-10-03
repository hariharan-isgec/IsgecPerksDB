USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAssignComplaintsUpdate]
  @Priority NVarChar(1),
  @ResponseTime Decimal(6,2),
  @AttenderID NVarChar(8),
  @AssignedOn DateTime,
  @CallStatusID Int,
  @Original_CallID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Register] SET 
   [Priority] = @Priority
  ,[ResponseTime] = @ResponseTime
  ,[AttenderID] = @AttenderID
  ,[AssignedOn] = @AssignedOn
  ,[CallStatusID] = @CallStatusID
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
