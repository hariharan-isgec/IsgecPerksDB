USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_RequestStatus]
  WHERE
  [ERP_RequestStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
