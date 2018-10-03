USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectsUpdate]
  @Original_ProjectID NVarChar(6), 
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @CustomerOrderReference NVarChar(50),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(250),
  @ProjectSiteEMailID NVarChar(250),
  @ProjectSiteEMailPassword NVarChar(50),
  @LastNumber Int,
  @BusinessPartnerID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Projects] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[CustomerOrderReference] = @CustomerOrderReference
  ,[ContactPerson] = @ContactPerson
  ,[EmailID] = @EmailID
  ,[ContactNo] = @ContactNo
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[ToEMailID] = @ToEMailID
  ,[CCEmailID] = @CCEmailID
  ,[ProjectSiteEMailID] = @ProjectSiteEMailID
  ,[ProjectSiteEMailPassword] = @ProjectSiteEMailPassword
  ,[LastNumber] = @LastNumber
  ,[BusinessPartnerID] = @BusinessPartnerID
  WHERE
  [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
