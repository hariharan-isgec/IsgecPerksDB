USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_SerialNo Int, 
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @SerialNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ProjectInputFiles] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[SerialNo] = @SerialNo
  ,[Description] = @Description
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
