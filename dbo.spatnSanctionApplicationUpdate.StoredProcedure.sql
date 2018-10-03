USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSanctionApplicationUpdate]
  @ApplStatusID Int,
  @SanctionRemark NVarChar(100),
  @SanctionOn DateTime,
  @Original_LeaveApplID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [ApplStatusID] = @ApplStatusID
  ,[SanctionRemark] = @SanctionRemark
  ,[SanctionOn] = @SanctionOn
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO
