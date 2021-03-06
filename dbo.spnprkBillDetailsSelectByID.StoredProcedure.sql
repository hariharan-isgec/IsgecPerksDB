USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsSelectByID]
  @LoginID NVarChar(8),
  @ClaimID Int,
  @ApplicationID Int,
  @AttachmentID Int 
  AS
  SELECT
    [PRK_BillDetails].* ,
    [PRK_Applications2].[UserRemark] AS PRK_Applications2_UserRemark,
    [PRK_UserClaims1].[Description] AS PRK_UserClaims1_Description 
  FROM [PRK_BillDetails] 
  LEFT OUTER JOIN [PRK_Applications] AS [PRK_Applications2]
    ON [PRK_BillDetails].[ClaimID] = [PRK_Applications2].[ClaimID]
    AND [PRK_BillDetails].[ApplicationID] = [PRK_Applications2].[ApplicationID]
  LEFT OUTER JOIN [PRK_UserClaims] AS [PRK_UserClaims1]
    ON [PRK_BillDetails].[ClaimID] = [PRK_UserClaims1].[ClaimID]
  WHERE
  [PRK_BillDetails].[ClaimID] = @ClaimID
  AND [PRK_BillDetails].[ApplicationID] = @ApplicationID
  AND [PRK_BillDetails].[AttachmentID] = @AttachmentID
GO
