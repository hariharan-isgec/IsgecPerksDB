USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QCMv_Inspections]
AS
SELECT     dbo.QCM_Inspections.RequestID, dbo.QCM_Inspections.InspectionID, dbo.QCM_Inspections.ProjectID, dbo.QCM_Inspections.SupplierID, 
                      dbo.QCM_Inspections.InspectedBy, dbo.QCM_Inspections.InspectedOn, dbo.QCM_Inspections.InspectionStatusID, 
                      dbo.QCM_Inspections.InspectionRemarks, dbo.QCM_Inspections.RequestStateID, dbo.HRM_Employees.EmployeeName AS InspectorName, 
                      dbo.QCM_RequestStates.Description AS RequestStatus, dbo.IDM_Projects.Description AS Project, dbo.IDM_Vendors.Description AS Vendor, 
                      dbo.QCM_Requests.TotalRequestedQuantity, dbo.QCM_Requests.Description AS Item
FROM         dbo.QCM_Requests RIGHT OUTER JOIN
                      dbo.QCM_Inspections ON dbo.QCM_Requests.RequestID = dbo.QCM_Inspections.RequestID LEFT OUTER JOIN
                      dbo.HRM_Employees ON dbo.QCM_Inspections.InspectedBy = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                      dbo.QCM_RequestStates ON dbo.QCM_Inspections.RequestStateID = dbo.QCM_RequestStates.StateID LEFT OUTER JOIN
                      dbo.IDM_Vendors ON dbo.QCM_Inspections.SupplierID = dbo.IDM_Vendors.VendorID LEFT OUTER JOIN
                      dbo.IDM_Projects ON dbo.QCM_Inspections.ProjectID = dbo.IDM_Projects.ProjectID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
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
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 137
               Left = 0
               Bottom = 245
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_Inspections"
            Begin Extent = 
               Top = 1
               Left = 275
               Bottom = 226
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 4
               Left = 524
               Bottom = 112
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Vendors"
            Begin Extent = 
               Top = 113
               Left = 562
               Bottom = 221
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_RequestStates"
            Begin Extent = 
               Top = 19
               Left = 11
               Bottom = 97
               Right = 162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_Requests"
            Begin Extent = 
               Top = 91
               Left = 740
               Bottom = 199
               Right = 972
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Inspections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Inspections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Inspections'
GO
