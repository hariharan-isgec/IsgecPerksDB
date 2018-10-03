USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesUpdate]
  @Original_StateID NVarChar(2), 
  @StateID NVarChar(2),
  @Description NVarChar(50),
  @ISGECCentralGSTGL NVarChar(7) = NULL,
  @ISGECStateGSTGL NVarChar(7) = NULL,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ERPStates] SET 
   [StateID] = @StateID
  ,[Description] = @Description
  ,[ISGECCentralGSTGL] = @ISGECCentralGSTGL
  WHERE
  [StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
