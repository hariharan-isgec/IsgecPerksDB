USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesUpdate]
  @Original_StateID NVarChar(10), 
  @StateID NVarChar(10),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_RequestStates] SET 
   [StateID] = @StateID
  ,[Description] = @Description
  WHERE
  [StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
