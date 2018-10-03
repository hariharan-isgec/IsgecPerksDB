USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesUpdate]
  @Original_ITServiceID NVarChar(15), 
  @Description NVarChar(50),
  @AlertAfterDays Int,
  @EMailGroup NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITServices] SET 
   [Description] = @Description
  ,[AlertAfterDays] = @AlertAfterDays
  ,[EMailGroup] = @EMailGroup
  WHERE
  [ITServiceID] = @Original_ITServiceID
  SET @RowCount = @@RowCount
GO
