USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusSelectByID]
  @LoginID NVarChar(8),
  @ClaimStatusID Int 
  AS
  SELECT
    [PRK_ClaimStatus].*  
  FROM [PRK_ClaimStatus] 
  WHERE
  [PRK_ClaimStatus].[ClaimStatusID] = @ClaimStatusID
GO
