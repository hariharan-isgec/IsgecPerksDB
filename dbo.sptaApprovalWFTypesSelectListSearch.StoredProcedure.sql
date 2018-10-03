USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaApprovalWFTypesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,WFTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (WFTypeID)
  SELECT [TA_ApprovalWFTypes].[WFTypeID] FROM [TA_ApprovalWFTypes]
 WHERE  
   ( 
         STR(ISNULL([TA_ApprovalWFTypes].[WFTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_ApprovalWFTypes].[WFTypeDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'WFTypeID' THEN [TA_ApprovalWFTypes].[WFTypeID] END,
     CASE @OrderBy WHEN 'WFTypeID DESC' THEN [TA_ApprovalWFTypes].[WFTypeID] END DESC,
     CASE @OrderBy WHEN 'WFTypeDescription' THEN [TA_ApprovalWFTypes].[WFTypeDescription] END,
     CASE @OrderBy WHEN 'WFTypeDescription DESC' THEN [TA_ApprovalWFTypes].[WFTypeDescription] END DESC,
     CASE @OrderBy WHEN 'RequiredDivisionHeadApproval' THEN [TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] END,
     CASE @OrderBy WHEN 'RequiredDivisionHeadApproval DESC' THEN [TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] END DESC,
     CASE @OrderBy WHEN 'RequiredMDApproval' THEN [TA_ApprovalWFTypes].[RequiredMDApproval] END,
     CASE @OrderBy WHEN 'RequiredMDApproval DESC' THEN [TA_ApprovalWFTypes].[RequiredMDApproval] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_ApprovalWFTypes].[WFTypeID] ,
		[TA_ApprovalWFTypes].[WFTypeDescription] ,
		[TA_ApprovalWFTypes].[RequiredDivisionHeadApproval] ,
		[TA_ApprovalWFTypes].[RequiredMDApproval]  
  FROM [TA_ApprovalWFTypes] 
      INNER JOIN #PageIndex
          ON [TA_ApprovalWFTypes].[WFTypeID] = #PageIndex.WFTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
