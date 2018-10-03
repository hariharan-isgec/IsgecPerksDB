USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmConfirmationsUpdate]
  @C_StatusID NVarChar(2),
  @Confirmed Bit,
  @C_ConfirmedOn DateTime,
  @C_ConfirmationRemark NVarChar(250),
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [C_StatusID] = @C_StatusID
  ,[Confirmed] = @Confirmed
  ,[C_ConfirmedOn] = @C_ConfirmedOn
  ,[C_ConfirmationRemark] = @C_ConfirmationRemark
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
