USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesInsert]
  @IsItUnitLevelCommittee Bit,
  @DivisionID NVarChar(6),
  @EmployeeID NVarChar(8),
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SC_Committees]
  (
   [IsItUnitLevelCommittee]
  ,[DivisionID]
  ,[EmployeeID]
  )
  VALUES
  (
   @IsItUnitLevelCommittee
  ,@DivisionID
  ,@EmployeeID
  )
  SET @Return_SerialNo = Scope_Identity()
GO
