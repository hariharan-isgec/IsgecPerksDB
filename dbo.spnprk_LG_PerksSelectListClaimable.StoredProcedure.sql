USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_PerksSelectListClaimable]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  DECLARE @VEH NVarchar(10) 

  SELECT @VEH = VehicleType from PRK_Employees where cardno=@loginid
  if (@VEH='None')
  SELECT
    [PRK_Perks].*  
  FROM [PRK_Perks] 
  WHERE PerkID in (1,5,6,8,9,11,12,15) 
  ORDER BY Sequence
  else
  SELECT
    [PRK_Perks].*  
  FROM [PRK_Perks] 
  WHERE PerkID in (5,7,9,10,12,15,17,19)  
  ORDER BY Sequence


  SET @RecordCount = @@RowCount
GO
