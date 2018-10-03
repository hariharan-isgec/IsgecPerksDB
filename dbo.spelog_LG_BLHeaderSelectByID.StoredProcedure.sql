USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelog_LG_BLHeaderSelectByID]
  @LoginID NVarChar(8),
  @BLID NVarChar(50) 
  AS
  SELECT TOP 1 
    [ELOG_BLHeader].* ,
    [ELOG_Ports1].[Description] AS ELOG_Ports1_Description 
  FROM [ELOG_BLHeader] 
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports1]
    ON [ELOG_BLHeader].[TransShipmentPortID] = [ELOG_Ports1].[PortID]
  WHERE
  [ELOG_BLHeader].[BLID] = @BLID OR [ELOG_BLHeader].[BLNumber] = @BLID
GO
