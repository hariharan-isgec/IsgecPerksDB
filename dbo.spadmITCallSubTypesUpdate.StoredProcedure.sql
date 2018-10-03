USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesUpdate]
  @Original_CallTypeID NVarChar(20), 
  @Original_CallSubTypeID Int, 
  @CallTypeID NVarChar(20),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITCallSubTypes] SET 
   [CallTypeID] = @CallTypeID
  ,[Description] = @Description
  WHERE
  [CallTypeID] = @Original_CallTypeID
  AND [CallSubTypeID] = @Original_CallSubTypeID
  SET @RowCount = @@RowCount
GO
