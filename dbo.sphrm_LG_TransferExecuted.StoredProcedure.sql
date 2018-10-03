USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sphrm_LG_TransferExecuted]
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @ActiveState Bit,
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @ActiveStateEventName NVarChar(20),

  @U_UnderTransfer Bit,
  @U_CompanyID NVarChar(6),
  @U_DivisionID NVarChar(6),
  @U_OfficeID Int,
  @U_DepartmentID NVarChar(6),
  @U_ProjectSiteID NVarChar(6),
  @U_ActiveState Bit,

  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[ActiveState] = @ActiveState
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  ,[ActiveStateEventName] = @ActiveStateEventName

  ,[U_UnderTransfer] = @U_UnderTransfer
  ,[U_CompanyID] = @U_CompanyID
  ,[U_DivisionID] = @U_DivisionID
  ,[U_OfficeID] = @U_OfficeID
  ,[U_DepartmentID] = @U_DepartmentID
  ,[U_ProjectSiteID] = @U_ProjectSiteID
  ,[U_ActiveState] = @U_ActiveState
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
