USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventStatusUpdate]
  @Original_EventID Int, 
  @Original_ITServiceID NVarChar(15), 
  @ActionNotRequired Bit,
  @ActionTaken Bit,
  @Responded Bit,
  @RespondedBy NVarChar(8),
  @RespondedOn DateTime,
  @AlertedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITEventStatus] SET 
   [ActionNotRequired] = @ActionNotRequired
  ,[ActionTaken] = @ActionTaken
  ,[Responded] = @Responded
  ,[RespondedBy] = @RespondedBy
  ,[RespondedOn] = @RespondedOn
  ,[AlertedOn] = @AlertedOn
  WHERE
  [EventID] = @Original_EventID
  AND [ITServiceID] = @Original_ITServiceID
  SET @RowCount = @@RowCount
GO
