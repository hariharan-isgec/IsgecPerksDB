USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysUpdate]
  @Description NVarChar(50),
  @AnsTag1 NVarChar(50),
  @AnsTag2 NVarChar(50),
  @AnsTag3 NVarChar(50),
  @AnsTag4 NVarChar(50),
  @AnsTag5 NVarChar(50),
  @AnsTag6 NVarChar(50),
  @AnsTag7 NVarChar(50),
  @AnsTag8 NVarChar(50),
  @AnsTag9 NVarChar(50),
  @AnsTag10 NVarChar(50),
  @Original_ServeyID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Serveys] SET 
   [Description] = @Description
  ,[AnsTag1] = @AnsTag1
  ,[AnsTag2] = @AnsTag2
  ,[AnsTag3] = @AnsTag3
  ,[AnsTag4] = @AnsTag4
  ,[AnsTag5] = @AnsTag5
  ,[AnsTag6] = @AnsTag6
  ,[AnsTag7] = @AnsTag7
  ,[AnsTag8] = @AnsTag8
  ,[AnsTag9] = @AnsTag9
  ,[AnsTag10] = @AnsTag10
  WHERE
  [ServeyID] = @Original_ServeyID
  SET @RowCount = @@RowCount
GO
