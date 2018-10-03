USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VR_vSiteReceiptReport]
AS
SELECT        dbo.VR_LorryReceipts.ProjectID, dbo.IDM_Projects.Description AS ProjectName, dbo.VR_LorryReceipts.MRNNo, dbo.VR_LorryReceipts.MRNDate, dbo.VR_LorryReceipts.TransporterID, 
                         dbo.VR_LorryReceipts.TransporterName, dbo.VR_LorryReceiptDetails.SerialNo, dbo.VR_LorryReceiptDetails.GRorLRNo, dbo.VR_LorryReceiptDetails.GRorLRDate, dbo.VR_LorryReceiptDetails.SupplierID, 
                         dbo.VR_BusinessPartner.BPName AS SupplierName, dbo.VR_LorryReceiptDetails.SupplierName AS SuppName, dbo.VR_LorryReceiptDetails.SupplierInvoiceNo, 
                         dbo.VR_LorryReceiptDetails.SupplierInvoiceDate
FROM            dbo.VR_LorryReceiptDetails LEFT OUTER JOIN
                         dbo.VR_BusinessPartner ON dbo.VR_LorryReceiptDetails.SupplierID = dbo.VR_BusinessPartner.BPID RIGHT OUTER JOIN
                         dbo.IDM_Projects RIGHT OUTER JOIN
                         dbo.VR_LorryReceipts ON dbo.IDM_Projects.ProjectID = dbo.VR_LorryReceipts.ProjectID ON dbo.VR_LorryReceiptDetails.ProjectID = dbo.VR_LorryReceipts.ProjectID AND 
                         dbo.VR_LorryReceiptDetails.MRNNo = dbo.VR_LorryReceipts.MRNNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[13] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[46] 4[38] 3) )"
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
         Configuration = "(H (1[37] 4) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 154
               Left = 346
               Bottom = 284
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceipts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "VR_LorryReceiptDetails"
            Begin Extent = 
               Top = 132
               Left = 683
               Bottom = 262
               Right = 918
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "VR_BusinessPartner"
            Begin Extent = 
               Top = 6
               Left = 604
               Bottom = 136
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2190
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_vSiteReceiptReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Append = 1400
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_vSiteReceiptReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_vSiteReceiptReport'
GO
