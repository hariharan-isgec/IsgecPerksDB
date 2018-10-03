USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesSelectByID]
  @LoginID NVarChar(8),
  @LocationTypeID Int 
  AS
  SELECT
    [PAK_SiteLocationTypes].*  
  FROM [PAK_SiteLocationTypes] 
  WHERE
  [PAK_SiteLocationTypes].[LocationTypeID] = @LocationTypeID
GO
