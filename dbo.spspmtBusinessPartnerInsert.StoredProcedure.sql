USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBusinessPartnerInsert]
  @BPID NVarChar(9),
  @BPName NVarChar(100),
  @Address1Line NVarChar(100),
  @Address2Line NVarChar(100),
  @City NVarChar(50),
  @EMailID NVarChar(200),
  @Return_BPID NVarChar(9) = null OUTPUT 
  AS
  INSERT [VR_BusinessPartner]
  (
   [BPID]
  ,[BPName]
  ,[Address1Line]
  ,[Address2Line]
  ,[City]
  ,[EMailID]
  )
  VALUES
  (
   UPPER(@BPID)
  ,@BPName
  ,@Address1Line
  ,@Address2Line
  ,@City
  ,@EMailID
  )
  SET @Return_BPID = @BPID
GO
