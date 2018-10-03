USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsUpdate]
  @Original_LinkID Int, 
  @Original_SRNNo Int, 
  @LinkID Int,
  @SRNNo Int,
  @LinkedBy NVarChar(8),
  @LinkedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_LinkExecutions] SET 
   [LinkID] = @LinkID
  ,[SRNNo] = @SRNNo
  ,[LinkedBy] = @LinkedBy
  ,[LinkedOn] = @LinkedOn
  WHERE
  [LinkID] = @Original_LinkID
  AND [SRNNo] = @Original_SRNNo
  SET @RowCount = @@RowCount
GO
