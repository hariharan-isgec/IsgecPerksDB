USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PivotPreOrderDocTracking]
AS
select  * FROM (SELECT [WFID],[Parent_WFID],[Project],[Element],[SpecificationNo],
                                          [Buyer],[Manager],[SupplierName],[PMDLDocNo],[WF_Status],[DateTime]  from 
                                          [WF1_PreOrder_History]) as SourceTable
                                          PIVOT
                                        ( Max([DateTime]) for [WF_Status] in 
                                            ( [Created],
                                            [Technical Specification Released],
                                            [Enquiry in progress],
                                            [Enquiry Raised],
                                            [Technical offer Received],
                                            [Commercial offer Received],
                                            [Commercial offer Finalized] )
                                            ) as PivotTable
GO
