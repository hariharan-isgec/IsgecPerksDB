USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderUpdate]
  @Original_DCRNo NVarChar(10), 
  @DCRNo NVarChar(10),
  @DCRDate NVarChar(10),
  @DCRDescription NVarChar(100),
  @CreatedBy NVarChar(8),
  @CreatedName NVarChar(50),
  @CreatedEMail NVarChar(50),
  @ProjectID NVarChar(6),
  @ProjectDescription NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_DCRHeader] SET 
   [DCRNo] = @DCRNo
  ,[DCRDate] = @DCRDate
  ,[DCRDescription] = @DCRDescription
  ,[CreatedBy] = @CreatedBy
  ,[CreatedName] = @CreatedName
  ,[CreatedEMail] = @CreatedEMail
  ,[ProjectID] = @ProjectID
  ,[ProjectDescription] = @ProjectDescription
  WHERE
  [DCRNo] = @Original_DCRNo
  SET @RowCount = @@RowCount
GO
