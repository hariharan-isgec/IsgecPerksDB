USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [ELOG_DetentionBillStatus].*  
  FROM [ELOG_DetentionBillStatus] 
  WHERE
  [ELOG_DetentionBillStatus].[StatusID] = @StatusID
GO
