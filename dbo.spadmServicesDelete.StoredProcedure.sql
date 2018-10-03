USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesDelete]
  @Original_ServiceID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Services]
  WHERE
  [ADM_Services].[ServiceID] = @Original_ServiceID
  SET @RowCount = @@RowCount
GO
