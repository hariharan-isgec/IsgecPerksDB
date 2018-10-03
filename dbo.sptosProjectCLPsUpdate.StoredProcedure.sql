USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_CLPID Int, 
  @ProjectID NVarChar(6),
  @Description NVarChar(250),
  @Quantity NVarChar(100),
  @Sequence Int,
  @DisplayType NVarChar(50),
  @engTaskID Int,
  @ordTaskID Int,
  @desTaskID Int,
  @ereTaskID Int,
  @ioTaskID Int,
  @recTaskID Int,
  @ad1TaskID Int,
  @ad2TaskID Int,
  @ad3TaskID Int,
  @ad4TaskID Int,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_CLPs] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[Quantity] = @Quantity
  ,[Sequence] = @Sequence
  ,[DisplayType] = @DisplayType
  ,[engTaskID] = @engTaskID
  ,[ordTaskID] = @ordTaskID
  ,[desTaskID] = @desTaskID
  ,[ereTaskID] = @ereTaskID
  ,[ioTaskID] = @ioTaskID
  ,[recTaskID] = @recTaskID
  ,[ad1TaskID] = @ad1TaskID
  ,[ad2TaskID] = @ad2TaskID
  ,[ad3TaskID] = @ad3TaskID
  ,[ad4TaskID] = @ad4TaskID
  ,[Active] = @Active
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO
