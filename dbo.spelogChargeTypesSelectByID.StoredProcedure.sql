USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesSelectByID]
  @LoginID NVarChar(8),
  @ChargeTypeID Int 
  AS
  SELECT
    [ELOG_ChargeTypes].*  
  FROM [ELOG_ChargeTypes] 
  WHERE
  [ELOG_ChargeTypes].[ChargeTypeID] = @ChargeTypeID
GO
