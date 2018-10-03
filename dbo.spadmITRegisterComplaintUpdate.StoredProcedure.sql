USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmITRegisterComplaintUpdate]
  @Original_CallID Int, 
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @CallSubTypeID Int,
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
	@CallReceivedOn DateTime,
	@CallConverted Bit ,
	@ConvertedReference NVarChar(50) ,
	@ConvertedRemarks NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITComplaints] SET 
   [EndUserID] = @EndUserID
  ,[CallTypeID] = @CallTypeID
  ,[CallSubTypeID] = @CallSubTypeID
  ,[Description] = @Description
  ,[AssignedTo] = @AssignedTo
  ,[CallReceivedOn] =	@CallReceivedOn 
	,[CallConverted] = @CallConverted 
	,[ConvertedReference] = @ConvertedReference  
	,[ConvertedRemarks] = @ConvertedRemarks  
  WHERE
  [CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
