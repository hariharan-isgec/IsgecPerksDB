USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesUpdate]
  @Original_SerialNo Int, 
  @IsItUnitLevelCommittee Bit,
  @DivisionID NVarChar(6),
  @EmployeeID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SC_Committees] SET 
   [IsItUnitLevelCommittee] = @IsItUnitLevelCommittee
  ,[DivisionID] = @DivisionID
  ,[EmployeeID] = @EmployeeID
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
