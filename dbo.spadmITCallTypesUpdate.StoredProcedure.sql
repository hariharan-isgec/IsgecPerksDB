USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesUpdate]
  @Original_CallTypeID NVarChar(20), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITCallTypes] SET 
   [Description] = @Description
  WHERE
  [CallTypeID] = @Original_CallTypeID
  SET @RowCount = @@RowCount
GO
