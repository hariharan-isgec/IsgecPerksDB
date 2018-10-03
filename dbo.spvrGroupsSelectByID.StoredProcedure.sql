USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsSelectByID]
  @LoginID NVarChar(8),
  @GroupID Int 
  AS
  SELECT
		[VR_Groups].[GroupID] ,
		[VR_Groups].[GroupName]  
  FROM [VR_Groups] 
  WHERE
  [VR_Groups].[GroupID] = @GroupID
GO
