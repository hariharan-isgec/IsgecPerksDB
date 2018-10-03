USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredUpdate]
  @CardNo NVarChar(8),
  @NoPunch Bit,
  @OnePunch Bit,
  @RuleException Bit,
	@AllLocation Bit, 
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_PunchRequired] SET 
   [CardNo] = @CardNo
  ,[NoPunch] = @NoPunch
  ,[OnePunch] = @OnePunch
  ,[RuleException] = @RuleException 
	,[AllLocation] = @AllLocation   
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
