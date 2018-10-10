USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VR_MRN_Report]
AS
SELECT        dbo.VR_LorryReceipts.ProjectID, dbo.IDM_Projects.Description, dbo.VR_LorryReceipts.MRNNo, dbo.VR_LorryReceiptDetails.SerialNo, dbo.VR_LorryReceipts.MRNDate, dbo.VR_LorryReceipts.LRStatusID, 
                         dbo.VR_LorryReceiptStatus.Description AS MRNStatus, dbo.VR_LorryReceiptDetails.GRorLRNo, dbo.VR_LorryReceiptDetails.GRorLRDate, dbo.VR_LorryReceipts.VehicleRegistrationNo, dbo.VR_LorryReceipts.TransporterID, 
                         dbo.VR_LorryReceipts.TransporterName, dbo.VR_LorryReceipts.RemarksForDamageOrShortage, dbo.VR_LorryReceipts.MaterialStateID, dbo.VR_LorryReceiptDetails.WeightAsPerInvoiceInKG, 
                         dbo.VR_LorryReceiptDetails.WeightReceived, dbo.VR_MaterialStates.Description AS MaterialStatus, dbo.VR_LorryReceiptDetails.SupplierInvoiceNo, dbo.VR_LorryReceiptDetails.SupplierInvoiceDate, 
                         dbo.VR_LorryReceiptDetails.SupplierID, dbo.VR_LorryReceiptDetails.SupplierName
FROM            dbo.VR_LorryReceipts INNER JOIN
                         dbo.VR_LorryReceiptStatus ON dbo.VR_LorryReceipts.LRStatusID = dbo.VR_LorryReceiptStatus.LRStatusID INNER JOIN
                         dbo.IDM_Projects ON dbo.VR_LorryReceipts.ProjectID = dbo.IDM_Projects.ProjectID INNER JOIN
                         dbo.VR_MaterialStates ON dbo.VR_LorryReceipts.MaterialStateID = dbo.VR_MaterialStates.MaterialStateID FULL OUTER JOIN
                         dbo.VR_LorryReceiptDetails ON dbo.VR_LorryReceipts.ProjectID = dbo.VR_LorryReceiptDetails.ProjectID AND dbo.VR_LorryReceipts.MRNNo = dbo.VR_LorryReceiptDetails.MRNNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[20] 2[39] 3) )"
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
         Begin Table = "VR_LorryReceipts"
            Begin Extent = 
               Top = 6
               Left = 573
               Bottom = 252
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceiptDetails"
            Begin Extent = 
               Top = 7
               Left = 41
               Bottom = 266
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "VR_LorryReceiptStatus"
            Begin Extent = 
               Top = 75
               Left = 325
               Bottom = 262
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 128
               Left = 927
               Bottom = 258
               Right = 1151
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_MaterialStates"
            Begin Extent = 
               Top = 172
               Left = 370
               Bottom = 268
               Right = 540
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
      Begin ColumnWidths = 22
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_MRN_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_MRN_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VR_MRN_Report'
GO
