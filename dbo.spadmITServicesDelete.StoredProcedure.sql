USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesDelete]
  @Original_ITServiceID NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITServices]
  WHERE
  [ADM_ITServices].[ITServiceID] = @Original_ITServiceID
  SET @RowCount = @@RowCount
GO
