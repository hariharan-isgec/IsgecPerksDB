USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusSelectByID]
  @StatusID NVarChar(1) 
  AS
  SELECT
		[DCM_TmtlStatus].[StatusID],
		[DCM_TmtlStatus].[Description] 
  FROM [DCM_TmtlStatus] 
  WHERE
  [DCM_TmtlStatus].[StatusID] = @StatusID
GO
