USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDASelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_F_SiteDA].[Perm_Bord_DA] ,
		[TA_F_SiteDA].[Cont_NonT_Bord_DA] ,
		[TA_F_SiteDA].[Cont_Tech_Bord_DA] ,
		[TA_F_SiteDA].[SerialNo] ,
		[TA_F_SiteDA].[CategoryID] ,
		[TA_F_SiteDA].[Cont_Tech_DA] ,
		[TA_F_SiteDA].[Cont_NonT_DA] ,
		[TA_F_SiteDA].[Perm_DA] ,
		[TA_F_SiteDA].[FromDate] ,
		[TA_F_SiteDA].[TillDate] ,
		[TA_F_SiteDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_F_SiteDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_SiteDA].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
  [TA_F_SiteDA].[CategoryID] = @CategoryID
  ORDER BY
     CASE @OrderBy WHEN 'Perm_Bord_DA' THEN [TA_F_SiteDA].[Perm_Bord_DA] END,
     CASE @OrderBy WHEN 'Perm_Bord_DA DESC' THEN [TA_F_SiteDA].[Perm_Bord_DA] END DESC,
     CASE @OrderBy WHEN 'Cont_NonT_Bord_DA' THEN [TA_F_SiteDA].[Cont_NonT_Bord_DA] END,
     CASE @OrderBy WHEN 'Cont_NonT_Bord_DA DESC' THEN [TA_F_SiteDA].[Cont_NonT_Bord_DA] END DESC,
     CASE @OrderBy WHEN 'Cont_Tech_Bord_DA' THEN [TA_F_SiteDA].[Cont_Tech_Bord_DA] END,
     CASE @OrderBy WHEN 'Cont_Tech_Bord_DA DESC' THEN [TA_F_SiteDA].[Cont_Tech_Bord_DA] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_F_SiteDA].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_F_SiteDA].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_F_SiteDA].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_F_SiteDA].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'Cont_Tech_DA' THEN [TA_F_SiteDA].[Cont_Tech_DA] END,
     CASE @OrderBy WHEN 'Cont_Tech_DA DESC' THEN [TA_F_SiteDA].[Cont_Tech_DA] END DESC,
     CASE @OrderBy WHEN 'Cont_NonT_DA' THEN [TA_F_SiteDA].[Cont_NonT_DA] END,
     CASE @OrderBy WHEN 'Cont_NonT_DA DESC' THEN [TA_F_SiteDA].[Cont_NonT_DA] END DESC,
     CASE @OrderBy WHEN 'Perm_DA' THEN [TA_F_SiteDA].[Perm_DA] END,
     CASE @OrderBy WHEN 'Perm_DA DESC' THEN [TA_F_SiteDA].[Perm_DA] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [TA_F_SiteDA].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [TA_F_SiteDA].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [TA_F_SiteDA].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [TA_F_SiteDA].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TA_F_SiteDA].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TA_F_SiteDA].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
