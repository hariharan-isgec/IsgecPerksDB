USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_F_SiteDASelectByCategoryID]
  @CategoryID Int,
  @LoginID NVarChar(8),
	@FromDateTime Datetime,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT TOP 1 
		[TA_F_SiteDA].* ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_F_SiteDA] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_SiteDA].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
    [TA_F_SiteDA].[CategoryID] = @CategoryID
		AND @FromDateTime Between [TA_F_SiteDA].[FromDate] AND  [TA_F_SiteDA].[TillDate] 
		AND [TA_F_SiteDA].[Active] = 1

  SET @RecordCount = @@RowCount
GO
