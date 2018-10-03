USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsR1HSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_FormStatusID NVarChar(30),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_FormsH].[FinYear]'
  SET @LGSQL = @LGSQL + ', [PMS_FormsH].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_FormsH] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsH].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsH].[ApprovedBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '    AND [PMS_FormsH].[CardNo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_Approvers] AS [PMS_Approvers3]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsH].[FinYear] = [PMS_Approvers3].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [PMS_FormsH].[CardNo] = [PMS_Approvers3].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_FinYear] AS [PMS_FinYear4]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsH].[FinYear] = [PMS_FinYear4].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_FormStatus] AS [PMS_FormStatus5]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsH].[FormStatusID] = [PMS_FormStatus5].[FormStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PMS_FormsH].[FinYear] = (''' + @FinYear + ''')'
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [PMS_FormsH].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_FormStatusID > '') 
    SET @LGSQL = @LGSQL + ' AND [PMS_FormsH].[FormStatusID] = ''' + @Filter_FormStatusID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PMS_FormsH].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PMS_FormsH].[FinYear] DESC'
                        WHEN 'CardNo' THEN '[PMS_FormsH].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[PMS_FormsH].[CardNo] DESC'
                        WHEN 'FormStatusID' THEN '[PMS_FormsH].[FormStatusID]'
                        WHEN 'FormStatusID DESC' THEN '[PMS_FormsH].[FormStatusID] DESC'
                        WHEN 'SubmittedOn' THEN '[PMS_FormsH].[SubmittedOn]'
                        WHEN 'SubmittedOn DESC' THEN '[PMS_FormsH].[SubmittedOn] DESC'
                        WHEN 'ApprovedOn' THEN '[PMS_FormsH].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[PMS_FormsH].[ApprovedOn] DESC'
                        WHEN 'ApprovedBy' THEN '[PMS_FormsH].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[PMS_FormsH].[ApprovedBy] DESC'
                        WHEN 'SubmittedToHROn' THEN '[PMS_FormsH].[SubmittedToHROn]'
                        WHEN 'SubmittedToHROn DESC' THEN '[PMS_FormsH].[SubmittedToHROn] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'PMS_FinYear4_Description' THEN '[PMS_FinYear4].[Description]'
                        WHEN 'PMS_FinYear4_Description DESC' THEN '[PMS_FinYear4].[Description] DESC'
                        WHEN 'PMS_FormStatus5_Description' THEN '[PMS_FormStatus5].[Description]'
                        WHEN 'PMS_FormStatus5_Description DESC' THEN '[PMS_FormStatus5].[Description] DESC'
                        ELSE '[PMS_FormsH].[FinYear],[PMS_FormsH].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormsH].[FinYear] ,
		[PMS_FormsH].[CardNo] ,
		[PMS_FormsH].[FormStatusID] ,
		[PMS_FormsH].[SubmittedOn] ,
		[PMS_FormsH].[ApprovedOn] ,
		[PMS_FormsH].[ApprovedBy] ,
		[PMS_FormsH].[SubmittedToHROn] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[PMS_FinYear4].[Description] AS PMS_FinYear4_Description,
		[PMS_FormStatus5].[Description] AS PMS_FormStatus5_Description 
  FROM [PMS_FormsH] 
    	INNER JOIN #PageIndex
          ON [PMS_FormsH].[FinYear] = #PageIndex.FinYear
          AND [PMS_FormsH].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsH].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_FormsH].[ApprovedBy] = [HRM_Employees2].[CardNo]
    AND [PMS_FormsH].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [PMS_Approvers] AS [PMS_Approvers3]
    ON [PMS_FormsH].[FinYear] = [PMS_Approvers3].[FinYear]
    AND [PMS_FormsH].[CardNo] = [PMS_Approvers3].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear4]
    ON [PMS_FormsH].[FinYear] = [PMS_FinYear4].[FinYear]
  INNER JOIN [PMS_FormStatus] AS [PMS_FormStatus5]
    ON [PMS_FormsH].[FormStatusID] = [PMS_FormStatus5].[FormStatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
