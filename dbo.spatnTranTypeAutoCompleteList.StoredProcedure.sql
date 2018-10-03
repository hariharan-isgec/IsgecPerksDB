USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_TranType].[Description] + ' [' + 
        [ATN_TranType].[TranType]
        + ']', [ATN_TranType].[TranType] 
			FROM [ATN_TranType] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_TranType].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_TranType].[Description] + ' [' + 
        [ATN_TranType].[TranType]
        + ']', [ATN_TranType].[TranType] 
			FROM [ATN_TranType] 
      WHERE TranType >= @PREFIX 
			ORDER BY [ATN_TranType].[TranType] 
	  END
GO
