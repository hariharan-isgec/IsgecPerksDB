USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkAdminApplicationsUpdate]
  @EmployeeID Int,
  @PerkID Int,
  @Value Decimal(10,2),
  @UserRemark NVarChar(200),
  @StatusID Int,
  @FinYear Int,
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[Value] = @Value
  ,[UserRemark] = @UserRemark
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
