USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeSelectByID]
  @TranType NVarChar(3)
  AS
  SELECT
		[ATN_TranType].[TranType],
		[ATN_TranType].[Description] 
  FROM [ATN_TranType] 
  WHERE
  [ATN_TranType].[TranType] = @TranType
GO
