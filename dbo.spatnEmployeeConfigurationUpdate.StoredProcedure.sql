USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeeConfigurationUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @SendVerifyMail Bit,
  @SendApproveMail Bit,
  @AttendanceThroughExcel Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_EmployeeConfiguration] SET 
   [CardNo] = @CardNo
  ,[SendVerifyMail] = @SendVerifyMail
  ,[SendApproveMail] = @SendApproveMail
  ,[AttendanceThroughExcel] = @AttendanceThroughExcel
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
