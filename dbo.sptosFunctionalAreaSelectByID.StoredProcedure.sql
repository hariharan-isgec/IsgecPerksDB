USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaSelectByID]
  @FunctionalAreaID NVarChar(6) 
  AS
  SELECT
		[TOS_FunctionalArea].[FunctionalAreaID] ,
		[TOS_FunctionalArea].[Description]  
  FROM [TOS_FunctionalArea] 
  WHERE
  [TOS_FunctionalArea].[FunctionalAreaID] = @FunctionalAreaID
GO
