USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VRv_SiteReceiptDetails]
AS
SELECT distinct d.* 
	  ,h.createdon 
  FROM (
SELECT        dbo.VR_LorryReceiptDetails.ProjectID, dbo.VR_LorryReceiptDetails.MRNNo, dbo.VR_LorryReceiptDetails.SerialNo, dbo.VR_LorryReceiptDetails.GRorLRNo, dbo.VR_LorryReceiptDetails.GRorLRDate, 
                         dbo.VR_LorryReceiptDetails.SupplierID, dbo.VR_LorryReceiptDetails.SupplierName, dbo.VR_LorryReceiptDetails.SupplierInvoiceNo, dbo.VR_LorryReceiptDetails.SupplierInvoiceDate, 
                         dbo.VR_LorryReceiptDetails.WeightAsPerInvoiceInKG, dbo.VR_LorryReceiptDetails.WeightReceived, dbo.VR_LorryReceiptDetails.MaterialForm, dbo.VR_LorryReceiptDetails.NoOfPackagesAsPerInvoice, 
                         dbo.VR_LorryReceiptDetails.NoOfPackagesReceived, dbo.VR_LorryReceiptDetails.CenvatInvoiceReceived, replace(replace(dbo.VR_LorryReceiptDetails.Remarks,char(13),'-'),char(10),' ') as Remarks, IDM_Projects1.Description AS IDM_Projects1_Description, 
                         VR_BusinessPartner2.BPName AS VR_BusinessPartner2_BPName, VR_LorryReceipts3.WayBillFormNo AS VR_LorryReceipts3_WayBillFormNo
FROM            dbo.VR_LorryReceiptDetails INNER JOIN
                         dbo.IDM_Projects AS IDM_Projects1 ON dbo.VR_LorryReceiptDetails.ProjectID = IDM_Projects1.ProjectID INNER JOIN
                         dbo.VR_BusinessPartner AS VR_BusinessPartner2 ON dbo.VR_LorryReceiptDetails.SupplierID = VR_BusinessPartner2.BPID INNER JOIN
                         dbo.VR_LorryReceipts AS VR_LorryReceipts3 ON dbo.VR_LorryReceiptDetails.ProjectID = VR_LorryReceipts3.ProjectID AND dbo.VR_LorryReceiptDetails.MRNNo = VR_LorryReceipts3.MRNNo
) 
 as d
  inner join vrv_siteReceiptHeader as h on h.mrnno=d.mrnno and h.projectid=d.projectid
  where (h.createdon >= convert(datetime,'01/06/2017',103) and h.createdon < convert(datetime,'01/09/2017',103))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VR_LorryReceiptDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects1"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 136
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_BusinessPartner2"
            Begin Extent = 
               Top = 6
               Left = 573
               Bottom = 136
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceipts3"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_SiteReceiptDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_SiteReceiptDetails'
GO
