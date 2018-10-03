USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesUpdate]
  @Original_ModeID Int, 
  @ModeName NVarChar(50),
  @Sequence Int,
  @OutOfSequence Bit,
  @UnderMilageClaim Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_TravelModes] SET 
   [ModeName] = @ModeName
  ,[Sequence] = @Sequence
  ,[OutOfSequence] = @OutOfSequence
  ,[UnderMilageClaim] = @UnderMilageClaim
  WHERE
  [ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
