USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SPMT_DC_Report]
AS
SELECT        dbo.SPMT_DCHeader.ChallanID, dbo.SPMT_DCHeader.ChallanDate, dbo.SPMT_DCHeader.ConsignerAddress3Line AS BillNODate, dbo.SPMT_DCDetails.UOM AS UnitOfMeasurement, dbo.SPMT_DCDetails.Quantity, 
                         dbo.SPMT_DCHeader.PONo, dbo.SPMT_DCHeader.ProjectID, dbo.IDM_Projects.Description AS ProjectName, dbo.SPMT_DCHeader.ConsignerName, dbo.SPMT_DCHeader.ConsigneeName, 
                         dbo.SPMT_DCHeader.ConsigneeGSTINNo, dbo.SPMT_DCHeader.ConsigneeGSTIN, dbo.SPMT_DCHeader.ConsigneeAddress1Line, dbo.SPMT_DCHeader.ConsigneeAddress2Line, dbo.SPMT_DCHeader.ConsigneeAddress3Line, 
                         dbo.SPMT_DCHeader.ConsigneeStateID, dbo.SPMT_DCHeader.Purpose, dbo.SPMT_DCDetails.AssessableValue, dbo.SPMT_DCDetails.IGSTAmount, dbo.SPMT_DCDetails.SGSTAmount, dbo.SPMT_DCDetails.CGSTAmount, 
                         dbo.SPMT_DCDetails.TotalGST, dbo.SPMT_DCDetails.TotalAmount, dbo.SPMT_DCHeader.TotalAmount AS TotalAmountonHeader, dbo.SPMT_DCHeader.IsgecInvoiceNo, dbo.SPMT_DCHeader.IsgecInvoiceDate, 
                         dbo.SPMT_ERPStates.Description AS StateDescription, dbo.SPMT_DCStates.Description AS StatusDescription, dbo.SPMT_DCDetails.SerialNo, dbo.SPMT_DCDetails.ItemDescription
FROM            dbo.SPMT_DCDetails INNER JOIN
                         dbo.SPMT_DCHeader ON dbo.SPMT_DCDetails.ChallanID = dbo.SPMT_DCHeader.ChallanID INNER JOIN
                         dbo.SPMT_DCStates ON dbo.SPMT_DCHeader.StatusID = dbo.SPMT_DCStates.StatusID INNER JOIN
                         dbo.IDM_Projects ON dbo.SPMT_DCHeader.ProjectID = dbo.IDM_Projects.ProjectID INNER JOIN
                         dbo.SPMT_ERPStates ON dbo.SPMT_DCHeader.ConsigneeStateID = dbo.SPMT_ERPStates.StateID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[13] 2[8] 3) )"
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
         Begin Table = "SPMT_DCDetails"
            Begin Extent = 
               Top = 13
               Left = 592
               Bottom = 143
               Right = 766
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "SPMT_DCHeader"
            Begin Extent = 
               Top = 10
               Left = 39
               Bottom = 140
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "SPMT_DCStates"
            Begin Extent = 
               Top = 21
               Left = 854
               Bottom = 117
               Right = 1024
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 102
               Left = 307
               Bottom = 232
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SPMT_ERPStates"
            Begin Extent = 
               Top = 181
               Left = 70
               Bottom = 277
               Right = 240
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
      Begin ColumnWidths = 95
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3210
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMT_DC_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Width = 1500
         Width = 1500
         Width = 1500
         Width = 1590
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
         Column = 1305
         Alias = 4275
         Table = 1530
         Output = 765
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMT_DC_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMT_DC_Report'
GO
