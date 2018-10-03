USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysDelete]
  @Original_ServeyID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Serveys]
  WHERE
  [HRM_Serveys].[ServeyID] = @Original_ServeyID
  SET @RowCount = @@RowCount
GO
