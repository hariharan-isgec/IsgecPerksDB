USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LCModesUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @LCModeID Int,
  @EntitlementText NVarChar(250),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_LCModes] SET 
   [CategoryID] = @CategoryID
  ,[LCModeID] = @LCModeID
  ,[EntitlementText] = @EntitlementText
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
