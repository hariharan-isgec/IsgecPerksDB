USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesUpdate]
  @Original_TaskTypeID NVarChar(2), 
  @TaskTypeID NVarChar(2),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_TaskTypes] SET 
   [TaskTypeID] = @TaskTypeID
  ,[Description] = @Description
  WHERE
  [TaskTypeID] = @Original_TaskTypeID
  SET @RowCount = @@RowCount
GO
