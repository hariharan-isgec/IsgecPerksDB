USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_AlertToApproverSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplStatusID Int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'

  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL,
  ApplicationCount Int NOT NULL
  )
  
  INSERT INTO #PageIndex (CardNo,ApplicationCount)
  SELECT [ATN_ApplHeader].[ApprovedBy], COUNT([ATN_ApplHeader].[LeaveApplID]) AS ApplicationCount 
  FROM [ATN_ApplHeader] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees1].[CardNo]
  WHERE [ATN_ApplHeader].[ApplStatusID] = @ApplStatusID
  AND [ATN_ApplHeader].[FinYear] = @FinYear  
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
   ) 

  GROUP BY [ATN_ApplHeader].[ApprovedBy] 
  ORDER BY [ATN_ApplHeader].[ApprovedBy] 

  SET @RecordCount = @@RowCount

  SELECT
		#PageIndex.CardNo As ApprovedBy,
		#PageIndex.ApplicationCount,
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName, 
    [aspnet_Users].[EMailID]   
  FROM #PageIndex 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON #PageIndex.CardNo = [HRM_Employees1].[CardNo] 
  LEFT OUTER JOIN [aspnet_Users]
    ON #PageIndex.CardNo = [aspnet_Users].[UserName] 
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
