USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistorySelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,WFID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'WFID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF1_PreOrder_History].[WFID]'
  SET @LGSQL = @LGSQL + ' FROM [WF1_PreOrder_History] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [WF1_PreOrder_History].[UserId] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [WF1_PreOrder_History].[Buyer] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WFID' THEN '[WF1_PreOrder_History].[WFID]'
                        WHEN 'WFID DESC' THEN '[WF1_PreOrder_History].[WFID] DESC'
                        WHEN 'Project' THEN '[WF1_PreOrder_History].[Project]'
                        WHEN 'Project DESC' THEN '[WF1_PreOrder_History].[Project] DESC'
                        WHEN 'Element' THEN '[WF1_PreOrder_History].[Element]'
                        WHEN 'Element DESC' THEN '[WF1_PreOrder_History].[Element] DESC'
                        WHEN 'SpecificationNo' THEN '[WF1_PreOrder_History].[SpecificationNo]'
                        WHEN 'SpecificationNo DESC' THEN '[WF1_PreOrder_History].[SpecificationNo] DESC'
                        WHEN 'Buyer' THEN '[WF1_PreOrder_History].[Buyer]'
                        WHEN 'Buyer DESC' THEN '[WF1_PreOrder_History].[Buyer] DESC'
                        WHEN 'SupplierName' THEN '[WF1_PreOrder_History].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[WF1_PreOrder_History].[SupplierName] DESC'
                        WHEN 'Supplier' THEN '[WF1_PreOrder_History].[Supplier]'
                        WHEN 'Supplier DESC' THEN '[WF1_PreOrder_History].[Supplier] DESC'
                        WHEN 'Notes' THEN '[WF1_PreOrder_History].[Notes]'
                        WHEN 'Notes DESC' THEN '[WF1_PreOrder_History].[Notes] DESC'
                        WHEN 'DateTime' THEN '[WF1_PreOrder_History].[DateTime]'
                        WHEN 'DateTime DESC' THEN '[WF1_PreOrder_History].[DateTime] DESC'
                        WHEN 'UserId' THEN '[WF1_PreOrder_History].[UserId]'
                        WHEN 'UserId DESC' THEN '[WF1_PreOrder_History].[UserId] DESC'
                        WHEN 'Parent_WFID' THEN '[WF1_PreOrder_History].[Parent_WFID]'
                        WHEN 'Parent_WFID DESC' THEN '[WF1_PreOrder_History].[Parent_WFID] DESC'
                        WHEN 'WFID_SlNo' THEN '[WF1_PreOrder_History].[WFID_SlNo]'
                        WHEN 'WFID_SlNo DESC' THEN '[WF1_PreOrder_History].[WFID_SlNo] DESC'
                        WHEN 'WF_Status' THEN '[WF1_PreOrder_History].[WF_Status]'
                        WHEN 'WF_Status DESC' THEN '[WF1_PreOrder_History].[WF_Status] DESC'
                        WHEN 'WF_HistoryID' THEN '[WF1_PreOrder_History].[WF_HistoryID]'
                        WHEN 'WF_HistoryID DESC' THEN '[WF1_PreOrder_History].[WF_HistoryID] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        ELSE '[WF1_PreOrder_History].[WFID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF1_PreOrder_History].* ,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName 
  FROM [WF1_PreOrder_History] 
      INNER JOIN #PageIndex
          ON [WF1_PreOrder_History].[WFID] = #PageIndex.WFID
  INNER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [WF1_PreOrder_History].[UserId] = [aspnet_Users3].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [WF1_PreOrder_History].[Buyer] = [aspnet_Users2].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
