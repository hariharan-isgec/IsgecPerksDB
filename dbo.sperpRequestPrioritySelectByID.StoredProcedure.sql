USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPrioritySelectByID]
  @LoginID NVarChar(8),
  @PriorityID Int 
  AS
  SELECT
		[ERP_RequestPriority].[PriorityID] ,
		[ERP_RequestPriority].[Description]  
  FROM [ERP_RequestPriority] 
  WHERE
  [ERP_RequestPriority].[PriorityID] = @PriorityID
GO
