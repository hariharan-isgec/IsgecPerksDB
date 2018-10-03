USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalLocationsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[AST_Locations].[Descriptions] + ' [' + 
        STR([AST_Locations].[LocationID])
        + ']', [AST_Locations].[LocationID] 
			FROM [AST_Locations] 
      WHERE LOWER(Descriptions) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [AST_Locations].[Descriptions] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[AST_Locations].[Descriptions] + ' [' + 
        STR([AST_Locations].[LocationID])
        + ']', [AST_Locations].[LocationID] 
			FROM [AST_Locations] 
      WHERE LocationID >= @PREFIX 
			ORDER BY [AST_Locations].[LocationID] 
	  END
GO
