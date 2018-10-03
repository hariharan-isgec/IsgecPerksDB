USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_ProgressID Int, 
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @AsOn DateTime,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_CLPData] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[AsOn] = @AsOn
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [ProgressID] = @Original_ProgressID
  SET @RowCount = @@RowCount
GO
