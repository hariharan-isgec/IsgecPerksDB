USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportSelectByID]
  @LoginID NVarChar(8),
  @ModeID Int 
  AS
  SELECT
    [SPMT_ModeOfTransport].*  
  FROM [SPMT_ModeOfTransport] 
  WHERE
  [SPMT_ModeOfTransport].[ModeID] = @ModeID
GO
