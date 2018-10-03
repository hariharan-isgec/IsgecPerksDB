USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spnPrk_LG_NetPayable]
  @EmployeeID Int,
  @PerkID Int,
  @FinYear Int,
  @NetValue Decimal = 0 OUTPUT  
  AS

  select @NetValue = sum(tot) from (
  select sum(ISNULL(value,0)) as tot from prk_entitlements where employeeid=@employeeid and perkid=@perkid and finyear=@finyear
  union all
  select sum(isnull(amount,0)) as tot from prk_ledger where employeeid=@employeeid and perkid=@perkid and finyear=@finyear
) as tmp


  if(@NetValue is NULL)
    set @NetValue = 0
GO
