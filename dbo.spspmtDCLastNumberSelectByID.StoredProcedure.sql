USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberSelectByID]
  @LoginID NVarChar(8),
  @NumberID Int 
  AS
  SELECT
    [SPMT_DCLastNumber].*  
  FROM [SPMT_DCLastNumber] 
  WHERE
  [SPMT_DCLastNumber].[NumberID] = @NumberID
GO
