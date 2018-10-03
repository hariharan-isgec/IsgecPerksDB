USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaUpdate]
  @Original_FunctionalAreaID NVarChar(6), 
  @FunctionalAreaID NVarChar(6),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_FunctionalArea] SET 
   [FunctionalAreaID] = @FunctionalAreaID
  ,[Description] = @Description
  WHERE
  [FunctionalAreaID] = @Original_FunctionalAreaID
  SET @RowCount = @@RowCount
GO
