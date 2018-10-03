USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkAdminApplicationsInsert]
  @EmployeeID Int,
  @PerkID Int,
  @Value Decimal(10,2),
  @UserRemark NVarChar(200),
  @AppliedOn DateTime,
  @StatusID Int,
  @FinYear Int,
  @ApplicationID Int = null OUTPUT
  AS
  INSERT [PRK_Applications]
  (
   [EmployeeID]
  ,[PerkID]
  ,[Value]
  ,[UserRemark]
  ,[AppliedOn]
  ,[StatusID]
  ,[FinYear]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@Value
  ,@UserRemark
  ,@AppliedOn
  ,@StatusID
  ,@FinYear
  )
  SET @ApplicationID = Scope_Identity()
GO
