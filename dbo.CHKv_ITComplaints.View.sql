USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CHKv_ITComplaints]
AS
SELECT     dbo.ADM_ITComplaints.CallID AS ComplaintID, dbo.ADM_ITCallTypes.Description AS ComplaintType, 
                      dbo.ADM_ITComplaints.Description AS ComplaintDetails, dbo.aspnet_users.UserFullName AS AssignedTo, 
                      dbo.ADM_ITCallStatus.Description AS ComplaintStatus, dbo.ADM_ITComplaints.LoggedOn, aspnet_Users_2.UserFullName AS LoggedBy, 
                      dbo.ADM_ITComplaints.FirstAttendedOn, dbo.ADM_ITComplaints.ClosedOn, dbo.ADM_ITComplaints.FirstAttended, dbo.ADM_ITComplaints.Closed, 
                      aspnet_Users_1.UserFullName AS EndUser, dbo.ADM_ITComplaints.CallReceivedOn, DATEDIFF(mi, dbo.ADM_ITComplaints.CallReceivedOn, 
                      dbo.ADM_ITComplaints.LoggedOn) AS Responsetime, DATEDIFF(mi, dbo.ADM_ITComplaints.CallReceivedOn, dbo.ADM_ITComplaints.ClosedOn) 
                      AS Resolvetime, dbo.ADM_ITComplaints.CallConverted, dbo.ADM_ITComplaints.EndUserID AS CardNo
FROM         dbo.ADM_ITComplaints LEFT OUTER JOIN
                      dbo.aspnet_users ON dbo.ADM_ITComplaints.AssignedTo = dbo.aspnet_users.LoginID LEFT OUTER JOIN
                      dbo.aspnet_users AS aspnet_Users_2 ON dbo.ADM_ITComplaints.LoggedBy = aspnet_Users_2.LoginID LEFT OUTER JOIN
                      dbo.ADM_ITCallStatus ON dbo.ADM_ITComplaints.CallStatusID = dbo.ADM_ITCallStatus.CallStatusID LEFT OUTER JOIN
                      dbo.ADM_ITCallTypes ON dbo.ADM_ITComplaints.CallTypeID = dbo.ADM_ITCallTypes.CallTypeID LEFT OUTER JOIN
                      dbo.aspnet_users AS aspnet_Users_1 ON dbo.ADM_ITComplaints.EndUserID = aspnet_Users_1.LoginID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[9] 2[18] 3) )"
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
         Begin Table = "ADM_ITComplaints"
            Begin Extent = 
               Top = 21
               Left = 322
               Bottom = 257
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users_2"
            Begin Extent = 
               Top = 183
               Left = 582
               Bottom = 291
               Right = 752
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "ADM_ITCallStatus"
            Begin Extent = 
               Top = 220
               Left = 49
               Bottom = 298
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITCallTypes"
            Begin Extent = 
               Top = 0
               Left = 51
               Bottom = 78
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users_1"
            Begin Extent = 
               Top = 1
               Left = 592
               Bottom = 109
               Right = 762
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Wi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_ITComplaints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'dth = 1500
         Width = 1500
         Width = 1500
         Width = 525
         Width = 495
         Width = 2085
         Width = 510
         Width = 885
         Width = 675
         Width = 690
         Width = 1500
         Width = 1500
         Width = 2100
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_ITComplaints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_ITComplaints'
GO
