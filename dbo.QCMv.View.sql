USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QCMv]
AS
SELECT     dbo.QCM_Requests.RequestID, dbo.QCM_Requests.ProjectID, dbo.IDM_Projects.Description AS ProjectDescription, dbo.QCM_Requests.SupplierID, 
                      dbo.IDM_Vendors.Description AS SupplierName, dbo.QCM_Requests.RequestedInspectionStartDate, 
                      dbo.QCM_Requests.RequestedInspectionFinishDate, dbo.QCM_Requests.AllotedStartDate, dbo.QCM_Requests.AllotedFinishDate, 
                      dbo.QCM_Requests.AllotedOn, dbo.QCM_Requests.CreatedOn, dbo.QCM_RequestStates.Description AS RequestStatus, 
                      dbo.aspnet_users.UserFullName AS CreatedByUser, aspnet_users_1.UserFullName AS AllotedTo, YEAR(dbo.QCM_Requests.CreatedOn) AS Expr1, 
                      dbo.aspnet_users.C_DivisionID, dbo.aspnet_users.LoginID
FROM         dbo.IDM_Projects RIGHT OUTER JOIN
                      dbo.IDM_Vendors RIGHT OUTER JOIN
                      dbo.QCM_RequestStates RIGHT OUTER JOIN
                      dbo.QCM_Requests LEFT OUTER JOIN
                      dbo.aspnet_users AS aspnet_users_1 ON dbo.QCM_Requests.AllotedTo = aspnet_users_1.LoginID LEFT OUTER JOIN
                      dbo.aspnet_users ON dbo.QCM_Requests.CreatedBy = dbo.aspnet_users.LoginID ON 
                      dbo.QCM_RequestStates.StateID = dbo.QCM_Requests.RequestStateID ON dbo.IDM_Vendors.VendorID = dbo.QCM_Requests.SupplierID ON 
                      dbo.IDM_Projects.ProjectID = dbo.QCM_Requests.ProjectID
WHERE     (YEAR(dbo.QCM_Requests.CreatedOn) = 2016)
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
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 6
               Left = 497
               Bottom = 114
               Right = 701
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Vendors"
            Begin Extent = 
               Top = 6
               Left = 308
               Bottom = 114
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_RequestStates"
            Begin Extent = 
               Top = 114
               Left = 246
               Bottom = 192
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_Requests"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "aspnet_users_1"
            Begin Extent = 
               Top = 6
               Left = 739
               Bottom = 114
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "aspnet_users"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1500
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
         Column = 3285
         Alias = 1980
         Table = 2280
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv'
GO
