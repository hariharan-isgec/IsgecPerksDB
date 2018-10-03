USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersUpdate]
  @U_UnderTransfer Bit,
  @U_CompanyID NVarChar(6),
  @U_DivisionID NVarChar(6),
  @U_OfficeID Int,
  @U_DepartmentID NVarChar(6),
  @U_ProjectSiteID NVarChar(6),
  @U_ActiveState Bit,
  @C_TransferedOn DateTime,
  @C_TransferRemark NVarChar(250),
  @ActiveState Bit,
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @ActiveStateEventName NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [U_UnderTransfer] = @U_UnderTransfer
  ,[U_CompanyID] = @U_CompanyID
  ,[U_DivisionID] = @U_DivisionID
  ,[U_OfficeID] = @U_OfficeID
  ,[U_DepartmentID] = @U_DepartmentID
  ,[U_ProjectSiteID] = @U_ProjectSiteID
  ,[U_ActiveState] = @U_ActiveState
  ,[C_TransferedOn] = @C_TransferedOn
  ,[C_TransferRemark] = @C_TransferRemark
  ,[ActiveState] = @ActiveState
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  ,[ActiveStateEventName] = @ActiveStateEventName
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
