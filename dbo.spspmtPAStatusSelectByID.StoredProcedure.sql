USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusSelectByID]
  @LoginID NVarChar(8),
  @AdviceStatusID Int 
  AS
  SELECT
    [SPMT_PAStatus].*  
  FROM [SPMT_PAStatus] 
  WHERE
  [SPMT_PAStatus].[AdviceStatusID] = @AdviceStatusID
GO
