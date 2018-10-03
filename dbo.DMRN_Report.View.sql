USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DMRN_Report]
AS
SELECT        dbo.VR_LorryReceiptDetails.SerialNo, dbo.VR_LorryReceiptDetails.GRorLRNo, dbo.VR_LorryReceiptDetails.GRorLRDate, dbo.VR_LorryReceiptDetails.SupplierID, dbo.VR_LorryReceiptDetails.SupplierName, 
                         dbo.VR_LorryReceiptDetails.SupplierInvoiceNo, dbo.VR_LorryReceiptDetails.SupplierInvoiceDate, dbo.VR_LorryReceiptDetails.WeightAsPerInvoiceInKG, dbo.VR_LorryReceiptDetails.WeightReceived, 
                         dbo.VR_LorryReceiptDetails.MaterialForm, dbo.VR_LorryReceiptDetails.NoOfPackagesAsPerInvoice, dbo.VR_LorryReceiptDetails.NoOfPackagesReceived, dbo.VR_LorryReceiptDetails.CenvatInvoiceReceived, 
                         dbo.VR_LorryReceiptDetails.Remarks, dbo.VR_LorryReceipts.MRNDate, dbo.VR_LorryReceipts.RequestExecutionNo, dbo.VR_LorryReceipts.CustomerID, dbo.VR_LorryReceipts.VehicleInDate, 
                         dbo.VR_LorryReceipts.VehicleOutDate, dbo.VR_LorryReceipts.TransporterID, dbo.VR_LorryReceipts.TransporterName, dbo.VR_LorryReceipts.VehicleRegistrationNo, dbo.VR_LorryReceipts.WayBillFormNo, 
                         dbo.VR_LorryReceipts.PaymentMadeAtSite, dbo.VR_LorryReceipts.AmountPaid, dbo.VR_LorryReceipts.CreatedBy, dbo.VR_LorryReceipts.CreatedOn, dbo.VR_LorryReceipts.LRStatusID, dbo.VR_LorryReceipts.VehicleTypeID, 
                         dbo.VR_LorryReceipts.VehicleType, dbo.VR_LorryReceipts.VehicleLengthInFt, dbo.VR_LorryReceipts.VechicleWidthInFt, dbo.VR_LorryReceipts.VehicleHeightInFt, dbo.VR_LorryReceipts.OverDimensionConsignment, 
                         dbo.VR_LorryReceipts.DetentionAtSite, dbo.VR_LorryReceipts.ReasonForDetention, dbo.VR_LorryReceipts.OtherRemarks, dbo.VR_LorryReceipts.MaterialStateID, dbo.VR_LorryReceipts.RemarksForDamageOrShortage, 
                         dbo.VR_LorryReceipts.DriverNameAndContactNo, dbo.VR_LorryReceipts.TempMRNNo, dbo.IDM_Projects.Description, dbo.HRM_Employees.EmployeeName, dbo.VR_LorryReceiptStatus.Description AS MRN_Status, 
                         dbo.VR_BusinessPartner.BPName, dbo.VR_LorryReceipts.MRNNo AS MRN_NO, dbo.VR_LorryReceipts.ProjectID AS PROJECTID
FROM            dbo.VR_LorryReceiptDetails INNER JOIN
                         dbo.IDM_Projects ON dbo.VR_LorryReceiptDetails.ProjectID = dbo.IDM_Projects.ProjectID LEFT OUTER JOIN
                         dbo.VR_BusinessPartner ON dbo.VR_LorryReceiptDetails.SupplierID = dbo.VR_BusinessPartner.BPID FULL OUTER JOIN
                         dbo.VR_LorryReceipts INNER JOIN
                         dbo.VR_LorryReceiptStatus ON dbo.VR_LorryReceipts.LRStatusID = dbo.VR_LorryReceiptStatus.LRStatusID INNER JOIN
                         dbo.HRM_Employees ON dbo.VR_LorryReceipts.CreatedBy = dbo.HRM_Employees.CardNo ON dbo.VR_LorryReceiptDetails.ProjectID = dbo.VR_LorryReceipts.ProjectID AND 
                         dbo.VR_LorryReceiptDetails.MRNNo = dbo.VR_LorryReceipts.MRNNo
WHERE        (dbo.VR_LorryReceipts.ProjectID = 'JB0963')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[22] 2[22] 3) )"
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
               Top = 9
               Left = 592
               Bottom = 139
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceiptStatus"
            Begin Extent = 
               Top = 226
               Left = 603
               Bottom = 416
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_BusinessPartner"
            Begin Extent = 
               Top = 181
               Left = 811
               Bottom = 311
               Right = 993
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 183
               Left = 343
               Bottom = 313
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 158
               Left = 17
               Bottom = 288
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceiptDetails"
            Begin Extent = 
               Top = 5
               Left = 25
               Bottom = 135
               Right = 260
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
      Begin ColumnWidths = 50
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DMRN_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1905
         Width = 1980
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
         Alias = 2775
         Table = 2025
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DMRN_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DMRN_Report'
GO
