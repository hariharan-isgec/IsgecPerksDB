USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesSelectByID]
  @LoginID NVarChar(8),
  @TranTypeID NVarChar(3) 
  AS
  SELECT
    [SPMT_TranTypes].* ,
    [SYS_Groups1].[Description] AS SYS_Groups1_Description 
  FROM [SPMT_TranTypes] 
  LEFT OUTER JOIN [SYS_Groups] AS [SYS_Groups1]
    ON [SPMT_TranTypes].[GroupID] = [SYS_Groups1].[GroupID]
  WHERE
  [SPMT_TranTypes].[TranTypeID] = @TranTypeID
GO
