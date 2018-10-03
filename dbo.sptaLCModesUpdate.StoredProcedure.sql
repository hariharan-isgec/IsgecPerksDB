USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesUpdate]
  @Original_ModeID Int, 
  @ModeName NVarChar(50),
  @OutOfSequence Bit,
  @Sequence Int,
  @UnderMilageClaim Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_LCModes] SET 
   [ModeName] = @ModeName
  ,[OutOfSequence] = @OutOfSequence
  ,[Sequence] = @Sequence
  ,[UnderMilageClaim] = @UnderMilageClaim
  WHERE
  [ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
