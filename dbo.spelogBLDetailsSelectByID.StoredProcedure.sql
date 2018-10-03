USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsSelectByID]
  @LoginID NVarChar(8),
  @BLID NVarChar(9),
  @SerialNo Int 
  AS
  SELECT
    [ELOG_BLDetails].* ,
    [ELOG_BLHeader1].[BLNumber] AS ELOG_BLHeader1_BLNumber 
  FROM [ELOG_BLDetails] 
  INNER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader1]
    ON [ELOG_BLDetails].[BLID] = [ELOG_BLHeader1].[BLID]
  WHERE
  [ELOG_BLDetails].[BLID] = @BLID
  AND [ELOG_BLDetails].[SerialNo] = @SerialNo
GO
