USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsSelectByID]
  @LoginID NVarChar(8),
  @PortID Int 
  AS
  SELECT
    [ELOG_Ports].*  
  FROM [ELOG_Ports] 
  WHERE
  [ELOG_Ports].[PortID] = @PortID
GO
