USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcost_LG_UpdateCSDataWOnGLGroup]  
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int   
  AS  
  BEGIN
	  DELETE [COST_CSDataWOnGLGroup] 
	  WHERE 1 = 1 
	   AND [COST_CSDataWOnGLGroup].[ProjectGroupID] = @ProjectGroupID 
	   AND [COST_CSDataWOnGLGroup].[FinYear] = @FinYear
	   AND [COST_CSDataWOnGLGroup].[Quarter] = @Quarter
	   AND [COST_CSDataWOnGLGroup].[Revision] = @Revision

      INSERT INTO [COST_CSDataWOnGLGroup]
		   ([ProjectGroupID]
		  ,[FinYear]
		  ,[Quarter]
		  ,[Revision]
		  ,[WorkOrderTypeID]
		  ,[GLGroupID]
		  ,[CrAmount]
		  ,[DrAmount]
		  ,[Amount]  
		  ,[CrFC]
		  ,[DrFC]
		  ,[NetFC]
		  )  
	   SELECT                                                                                  
		[COST_CostSheetData].[ProjectGroupID],                                                      
		[COST_CostSheetData].[FinYear],                                                             
		[COST_CostSheetData].[Quarter],                                                             
		[COST_CostSheetData].[Revision],                                                            
		[COST_Projects].[WorkOrderTypeID],                                                           
		[COST_GLGroupGLs].[GLGroupID],                                                              
		SUM([COST_CostSheetData].[CrAmount]) AS CrAmount,                                           
		SUM([COST_CostSheetData].[DrAmount]) AS DrAmount,                                           
		SUM([COST_CostSheetData].[Amount]) AS Amount,                                                
		SUM([COST_CostSheetData].[CrFC]) AS CrFC,                                           
		SUM([COST_CostSheetData].[DrFC]) AS DrFC,                                           
		SUM([COST_CostSheetData].[NetFC]) AS NetFC                                                 
	  FROM (
			SELECT 
				[COST_CostSheetData].[ProjectGroupID],                                                      
				[COST_CostSheetData].[FinYear],                                                             
				[COST_CostSheetData].[Quarter],                                                             
				[COST_CostSheetData].[Revision],
				[COST_CostSheetData].[ProjectID],                                                            
				[COST_CostSheetData].[CrAmount],                                           
				[COST_CostSheetData].[DrAmount],                                           
				[COST_CostSheetData].[Amount], 
				[COST_CostSheetData].[CrFC],                                           
				[COST_CostSheetData].[DrFC],                                           
				[COST_CostSheetData].[NetFC], 
				[COST_CostSheetData].[GLCode]  
			FROM [COST_CostSheetData] 
			  INNER JOIN [COST_Projects]  ON [COST_Projects].[ProjectID] = [COST_CostSheetData].[ProjectID]
			                             AND [COST_Projects].[FinYear] = [COST_CostSheetData].[FinYear]
										 AND [COST_Projects].[Quarter] = [COST_CostSheetData].[Quarter]
			WHERE 1 = 1 
			  AND [COST_CostSheetData].[ProjectGroupID] = @ProjectGroupID
			  AND [COST_CostSheetData].[FinYear] = @FinYear
			  AND [COST_CostSheetData].[Quarter] = @Quarter
			  AND [COST_CostSheetData].[Revision] = @Revision 

	  ) AS  [COST_CostSheetData]                                                                      
		INNER JOIN [COST_Projects]  ON [COST_Projects].[ProjectID] = [COST_CostSheetData].[ProjectID]
			                             AND [COST_Projects].[FinYear] = [COST_CostSheetData].[FinYear]
										 AND [COST_Projects].[Quarter] = [COST_CostSheetData].[Quarter]
		INNER JOIN [COST_GLGroupGLs] ON [COST_CostSheetData].[GLCode] = [COST_GLGroupGLs].[GLCode]      
	  WHERE 1 = 1 
	   AND [COST_CostSheetData].[ProjectGroupID] = @ProjectGroupID
	   AND [COST_CostSheetData].[FinYear] = @FinYear
	   AND [COST_CostSheetData].[Quarter] = @Quarter
	   AND [COST_CostSheetData].[Revision] = @Revision
	  GROUP BY [COST_CostSheetData].[ProjectGroupID],                                             
		[COST_CostSheetData].[FinYear],                                                           
		[COST_CostSheetData].[Quarter],                                                           
		[COST_CostSheetData].[Revision],                                                          
		[COST_Projects].[WorkOrderTypeID],                                                         
		[COST_GLGroupGLs].[GLGroupID]                                                             

  END
GO
