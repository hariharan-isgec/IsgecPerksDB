USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesUpdate]
  @Original_RequestTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_RequestTypes] SET 
   [Description] = @Description
  WHERE
  [RequestTypeID] = @Original_RequestTypeID
  SET @RowCount = @@RowCount
GO
