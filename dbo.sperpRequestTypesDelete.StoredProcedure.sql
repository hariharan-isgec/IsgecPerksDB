USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesDelete]
  @Original_RequestTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_RequestTypes]
  WHERE
  [ERP_RequestTypes].[RequestTypeID] = @Original_RequestTypeID
  SET @RowCount = @@RowCount
GO
