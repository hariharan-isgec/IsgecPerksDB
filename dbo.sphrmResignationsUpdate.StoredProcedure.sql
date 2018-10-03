USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsUpdate]
  @C_StatusID NVarChar(2),
  @Resigned Bit,
  @C_ResignedOn DateTime,
  @C_DateOfReleaving DateTime,
  @C_ResignedRemark NVarChar(250),
  @ActiveState Bit,
  @ActiveStateEventName NVarChar(20),
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [C_StatusID] = @C_StatusID
  ,[Resigned] = @Resigned
  ,[C_ResignedOn] = @C_ResignedOn
  ,[C_DateOfReleaving] = @C_DateOfReleaving
  ,[C_ResignedRemark] = @C_ResignedRemark
  ,[ActiveState] = @ActiveState
  ,[ActiveStateEventName] = @ActiveStateEventName
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
