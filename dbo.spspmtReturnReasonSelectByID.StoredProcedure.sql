USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
    [SPMT_ReturnReason].*  
  FROM [SPMT_ReturnReason] 
  WHERE
  [SPMT_ReturnReason].[ReasonID] = @ReasonID
GO
