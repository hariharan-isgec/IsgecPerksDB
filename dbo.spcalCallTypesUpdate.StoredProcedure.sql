USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesUpdate]
  @Description NVarChar(30),
  @Priority NVarChar(1),
  @ResponseTime Decimal(6,2),
  @Original_CallTypeID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_CallTypes] SET 
   [Description] = @Description
  ,[Priority] = @Priority
  ,[ResponseTime] = @ResponseTime
  WHERE
  [CallTypeID] = @Original_CallTypeID
  SET @RowCount = @@RowCount
GO
