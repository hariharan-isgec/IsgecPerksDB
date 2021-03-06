USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VPN_HRMIS]
AS
SELECT     TOP (100) PERCENT dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Employees.C_DepartmentID, 
                      dbo.HRM_Employees.C_ProjectSiteID, dbo.IDM_Projects.Description AS ProjectName, dbo.HRM_Employees.EMailID, 
                      dbo.HRM_Employees.ContactNumbers, desig.Description, vpn.email AS MobileNo
FROM         dbo.HRM_Employees LEFT OUTER JOIN
                      dbo.IDM_Projects ON dbo.HRM_Employees.C_ProjectSiteID = dbo.IDM_Projects.ProjectID LEFT OUTER JOIN
                      dbo.HRM_Designations AS desig ON dbo.HRM_Employees.C_DesignationID = desig.DesignationID LEFT OUTER JOIN
                      dbo.VPN_Users AS vpn ON dbo.HRM_Employees.CardNo = vpn.username
WHERE     (dbo.HRM_Employees.ActiveState = 1) AND (dbo.HRM_Employees.C_OfficeID = 6)
ORDER BY dbo.HRM_Employees.C_ProjectSiteID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[41] 2[20] 3) )"
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
               Top = 6
               Left = 38
               Bottom = 114
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "desig"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 114
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vpn"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 114
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 6
               Left = 645
               Bottom = 114
               Right = 849
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
      Begin ColumnWidths = 9
         Width = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VPN_HRMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VPN_HRMIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VPN_HRMIS'
GO
