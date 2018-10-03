USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_CLPID Int, 
  @ProjectID NVarChar(6),
  @Description NVarChar(100),
  @Sequence Int,
  @DisplayType NVarChar(50),
  @engTaskID Int,
  @ordTaskID Int,
  @desTaskID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_CLPs] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[Sequence] = @Sequence
  ,[DisplayType] = @DisplayType
  ,[engTaskID] = @engTaskID
  ,[ordTaskID] = @ordTaskID
  ,[desTaskID] = @desTaskID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO
