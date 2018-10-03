USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnPrk_LG_PaidMedBenfitWithADJinBalMed]
  @EmployeeID Int,
  @FinYear Int,
  @NetValue Decimal = 0 OUTPUT  
  AS
  SELECT @NetValue = SUM(Value)
  FROM (select sum(isnull(value,0) * -1)  as value from PRK_Ledger where finyear=@finyear and perkid=1 and trantype='JVR' and employeeid=@employeeid
        union all
		select sum(isnull(value,0)) as value from PRK_Ledger where finyear=@finyear and perkid=19 and trantype='ADJ' and Remarks='Migrated Clubbed OPB'
		and employeeid=@employeeid 
  ) as tmp

  if(@NetValue is NULL)
    set @NetValue = 0
GO
