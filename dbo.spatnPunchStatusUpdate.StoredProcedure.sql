USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusUpdate]
  @Description NVarChar(30),
  @PunchValue Decimal(6,2),
  @Original_PunchStatusID NVarChar(2), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_PunchStatus] SET 
   [Description] = @Description
  ,[PunchValue] = @PunchValue
  WHERE
  [PunchStatusID] = @Original_PunchStatusID
  SET @RowCount = @@RowCount
GO
