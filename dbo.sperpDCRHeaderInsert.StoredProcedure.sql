USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderInsert]
  @DCRNo NVarChar(10),
  @DCRDate NVarChar(10),
  @DCRDescription NVarChar(100),
  @CreatedBy NVarChar(8),
  @CreatedName NVarChar(50),
  @CreatedEMail NVarChar(50),
  @ProjectID NVarChar(6),
  @ProjectDescription NVarChar(100),
  @Return_DCRNo NVarChar(10) = null OUTPUT 
  AS
  INSERT [ERP_DCRHeader]
  (
   [DCRNo]
  ,[DCRDate]
  ,[DCRDescription]
  ,[CreatedBy]
  ,[CreatedName]
  ,[CreatedEMail]
  ,[ProjectID]
  ,[ProjectDescription]
  )
  VALUES
  (
   UPPER(@DCRNo)
  ,@DCRDate
  ,@DCRDescription
  ,@CreatedBy
  ,@CreatedName
  ,@CreatedEMail
  ,@ProjectID
  ,@ProjectDescription
  )
  SET @Return_DCRNo = @DCRNo
GO
