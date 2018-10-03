USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPerksSelectByID]
  @LoginID NVarChar(8),
  @PerkID Int 
  AS
  SELECT
    [PRK_Perks].*  
  FROM [PRK_Perks] 
  WHERE
  [PRK_Perks].[PerkID] = @PerkID
GO
