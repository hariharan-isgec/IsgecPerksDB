USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSTCPOLRSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_ItemNo Int,
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
 ,SerialNo Int NOT NULL
 ,ItemNo Int NOT NULL
 ,UploadNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ', UploadNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POLineRec].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLineRec].[ItemNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLineRec].[UploadNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POLineRec] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRec].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRec].[SerialNo] = [PAK_PO2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POLine] AS [PAK_POLine3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRec].[SerialNo] = [PAK_POLine3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POLineRec].[ItemNo] = [PAK_POLine3].[ItemNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POLineRecCategory] AS [PAK_POLineRecCategory4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRec].[DocumentCategoryID] = [PAK_POLineRecCategory4].[DocumentCategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POLineRecStatus] AS [PAK_POLineRecStatus5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRec].[UploadStatusID] = [PAK_POLineRecStatus5].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLineRec].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_ItemNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLineRec].[ItemNo] = ' + STR(@Filter_ItemNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POLineRec].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POLineRec].[SerialNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POLineRec].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POLineRec].[ItemNo] DESC'
                        WHEN 'UploadNo' THEN '[PAK_POLineRec].[UploadNo]'
                        WHEN 'UploadNo DESC' THEN '[PAK_POLineRec].[UploadNo] DESC'
                        WHEN 'DocumentCategoryID' THEN '[PAK_POLineRec].[DocumentCategoryID]'
                        WHEN 'DocumentCategoryID DESC' THEN '[PAK_POLineRec].[DocumentCategoryID] DESC'
                        WHEN 'UploadRemarks' THEN '[PAK_POLineRec].[UploadRemarks]'
                        WHEN 'UploadRemarks DESC' THEN '[PAK_POLineRec].[UploadRemarks] DESC'
                        WHEN 'UploadStatusID' THEN '[PAK_POLineRec].[UploadStatusID]'
                        WHEN 'UploadStatusID DESC' THEN '[PAK_POLineRec].[UploadStatusID] DESC'
                        WHEN 'RevisionNo' THEN '[PAK_POLineRec].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[PAK_POLineRec].[RevisionNo] DESC'
                        WHEN 'CreatedOn' THEN '[PAK_POLineRec].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[PAK_POLineRec].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[PAK_POLineRec].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PAK_POLineRec].[CreatedBy] DESC'
                        WHEN 'ReceiptNo' THEN '[PAK_POLineRec].[ReceiptNo]'
                        WHEN 'ReceiptNo DESC' THEN '[PAK_POLineRec].[ReceiptNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'PAK_PO2_PODescription' THEN '[PAK_PO2].[PODescription]'
                        WHEN 'PAK_PO2_PODescription DESC' THEN '[PAK_PO2].[PODescription] DESC'
                        WHEN 'PAK_POLine3_ItemCode' THEN '[PAK_POLine3].[ItemCode]'
                        WHEN 'PAK_POLine3_ItemCode DESC' THEN '[PAK_POLine3].[ItemCode] DESC'
                        WHEN 'PAK_POLineRecCategory4_Description' THEN '[PAK_POLineRecCategory4].[Description]'
                        WHEN 'PAK_POLineRecCategory4_Description DESC' THEN '[PAK_POLineRecCategory4].[Description] DESC'
                        WHEN 'PAK_POLineRecStatus5_Description' THEN '[PAK_POLineRecStatus5].[Description]'
                        WHEN 'PAK_POLineRecStatus5_Description DESC' THEN '[PAK_POLineRecStatus5].[Description] DESC'
                        ELSE '[PAK_POLineRec].[SerialNo],[PAK_POLineRec].[ItemNo],[PAK_POLineRec].[UploadNo] DESC'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POLineRec].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POLine3].[ItemCode] AS PAK_POLine3_ItemCode,
    [PAK_POLineRecCategory4].[Description] AS PAK_POLineRecCategory4_Description,
    [PAK_POLineRecStatus5].[Description] AS PAK_POLineRecStatus5_Description 
  FROM [PAK_POLineRec] 
      INNER JOIN #PageIndex
          ON [PAK_POLineRec].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POLineRec].[ItemNo] = #PageIndex.ItemNo
          AND [PAK_POLineRec].[UploadNo] = #PageIndex.UploadNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_POLineRec].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_POLineRec].[SerialNo] = [PAK_PO2].[SerialNo]
  INNER JOIN [PAK_POLine] AS [PAK_POLine3]
    ON [PAK_POLineRec].[SerialNo] = [PAK_POLine3].[SerialNo]
    AND [PAK_POLineRec].[ItemNo] = [PAK_POLine3].[ItemNo]
  LEFT OUTER JOIN [PAK_POLineRecCategory] AS [PAK_POLineRecCategory4]
    ON [PAK_POLineRec].[DocumentCategoryID] = [PAK_POLineRecCategory4].[DocumentCategoryID]
  LEFT OUTER JOIN [PAK_POLineRecStatus] AS [PAK_POLineRecStatus5]
    ON [PAK_POLineRec].[UploadStatusID] = [PAK_POLineRecStatus5].[StatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
