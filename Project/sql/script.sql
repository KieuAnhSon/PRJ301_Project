USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 7/8/2022 10:06:04 ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[StudentID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[AttendanceStatus] [bit] NOT NULL,
	[Comment] [nvarchar](150) NULL,
	[RecordTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [nvarchar](150) NOT NULL,
	[CourseName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
	[CourseID] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [nvarchar](150) NOT NULL,
	[LessonNo] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[RoomID] [nvarchar](150) NOT NULL,
	[InstructorID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[LessonDate] [date] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [nvarchar](150) NOT NULL,
	[RoomPlace] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](150) NOT NULL,
	[StudentEmail] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInGroup]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInGroup](
	[StudentID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_StudentInGroup] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/8/2022 10:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[TimeID] [int] IDENTITY(1,1) NOT NULL,
	[TimeBegin] [time](3) NOT NULL,
	[TimeEnd] [time](3) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'CEA201', N'Computer Organization and Architecture')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'LAB211', N'OOP with Java Lab')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'OSG202', N'Operating Systems')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRF192', N'Programming Fundamentals')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRO192', N'Object-Oriented Programming')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'WED201c', N'Web Design')
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupName], [CourseID]) VALUES (1, N'SE1623', N'PRJ301')
INSERT [dbo].[Group] ([GroupID], [GroupName], [CourseID]) VALUES (2, N'SE1623', N'WED201c')
INSERT [dbo].[Group] ([GroupID], [GroupName], [CourseID]) VALUES (3, N'SE1623', N'IOT102')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (1, N'Nguyễn Tân Ân')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (2, N'Phan Đăng Cầu')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (3, N'Lê Thanh Hải')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (4, N'Phạm Thị Thanh Hoa')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (5, N'Someya Keiichiro')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName]) VALUES (6, N'Ngô Tùng Sơn')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (1, N'IOT102-Slot1', 1, 1, N'2', 6, 3, CAST(N'2022-05-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (2, N'IOT102-Slot2', 2, 2, N'1', 4, 3, CAST(N'2022-06-07' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (3, N'IOT102-Slot3', 3, 8, N'1', 3, 3, CAST(N'2022-05-17' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (4, N'IOT102-Slot4', 4, 3, N'5', 5, 3, CAST(N'2022-07-01' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (5, N'IOT102-Slot5', 5, 5, N'4', 6, 3, CAST(N'2022-06-21' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (6, N'IOT102-Slot6', 6, 7, N'5', 2, 3, CAST(N'2022-07-31' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (7, N'IOT102-Slot7', 7, 5, N'4', 5, 3, CAST(N'2022-06-19' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (8, N'IOT102-Slot8', 8, 4, N'1', 2, 3, CAST(N'2022-07-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (9, N'IOT102-Slot9', 9, 7, N'1', 6, 3, CAST(N'2022-06-22' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (10, N'IOT102-Slot10', 10, 6, N'2', 3, 3, CAST(N'2022-07-03' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (11, N'IOT102-Slot11', 11, 1, N'1', 3, 3, CAST(N'2022-06-28' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (12, N'IOT102-Slot12', 12, 7, N'4', 6, 3, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (13, N'IOT102-Slot13', 13, 3, N'4', 4, 3, CAST(N'2022-07-19' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (14, N'IOT102-Slot14', 14, 8, N'2', 2, 3, CAST(N'2022-07-23' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (15, N'IOT102-Slot15', 15, 3, N'4', 4, 3, CAST(N'2022-05-01' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (16, N'IOT102-Slot16', 16, 4, N'4', 6, 3, CAST(N'2022-07-13' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (17, N'IOT102-Slot17', 17, 5, N'2', 6, 3, CAST(N'2022-07-21' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (18, N'IOT102-Slot18', 18, 4, N'4', 3, 3, CAST(N'2022-06-27' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (19, N'IOT102-Slot19', 19, 5, N'4', 1, 3, CAST(N'2022-05-01' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (20, N'IOT102-Slot20', 20, 7, N'1', 6, 3, CAST(N'2022-05-02' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (21, N'IOT102-Slot21', 21, 3, N'2', 4, 3, CAST(N'2022-06-27' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (22, N'IOT102-Slot22', 22, 5, N'5', 6, 3, CAST(N'2022-06-12' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (23, N'IOT102-Slot23', 23, 2, N'1', 2, 3, CAST(N'2022-07-22' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (24, N'IOT102-Slot24', 24, 8, N'4', 1, 3, CAST(N'2022-06-11' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (25, N'IOT102-Slot25', 25, 1, N'1', 1, 3, CAST(N'2022-05-12' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (26, N'IOT102-Slot26', 26, 2, N'2', 5, 3, CAST(N'2022-06-06' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (27, N'IOT102-Slot27', 27, 4, N'1', 4, 3, CAST(N'2022-07-27' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (28, N'IOT102-Slot28', 28, 2, N'2', 5, 3, CAST(N'2022-06-03' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (29, N'IOT102-Slot29', 29, 5, N'5', 1, 3, CAST(N'2022-06-23' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (30, N'IOT102-Slot30', 30, 7, N'2', 3, 3, CAST(N'2022-05-11' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (31, N'WED201c-Slot1', 1, 5, N'5', 5, 2, CAST(N'2022-07-07' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (32, N'WED201c-Slot2', 2, 3, N'3', 6, 2, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (33, N'WED201c-Slot3', 3, 7, N'2', 3, 2, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (34, N'WED201c-Slot4', 4, 2, N'2', 4, 2, CAST(N'2022-06-30' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (35, N'WED201c-Slot5', 5, 1, N'2', 4, 2, CAST(N'2022-07-04' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (36, N'WED201c-Slot6', 6, 3, N'1', 1, 2, CAST(N'2022-05-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (37, N'WED201c-Slot7', 7, 7, N'2', 3, 2, CAST(N'2022-07-06' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (38, N'WED201c-Slot8', 8, 1, N'5', 2, 2, CAST(N'2022-07-11' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (39, N'WED201c-Slot9', 9, 2, N'2', 3, 2, CAST(N'2022-06-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (40, N'WED201c-Slot10', 10, 2, N'3', 5, 2, CAST(N'2022-06-12' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (41, N'WED201c-Slot11', 11, 5, N'3', 6, 2, CAST(N'2022-06-13' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (42, N'WED201c-Slot12', 12, 8, N'5', 6, 2, CAST(N'2022-05-25' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (43, N'WED201c-Slot13', 13, 6, N'1', 3, 2, CAST(N'2022-05-28' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (44, N'WED201c-Slot14', 14, 3, N'2', 3, 2, CAST(N'2022-07-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (45, N'WED201c-Slot15', 15, 8, N'2', 2, 2, CAST(N'2022-07-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (46, N'WED201c-Slot16', 16, 4, N'2', 1, 2, CAST(N'2022-07-02' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (47, N'WED201c-Slot17', 17, 3, N'2', 4, 2, CAST(N'2022-07-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (48, N'WED201c-Slot18', 18, 6, N'1', 3, 2, CAST(N'2022-07-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (49, N'WED201c-Slot19', 19, 2, N'3', 6, 2, CAST(N'2022-05-07' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (50, N'WED201c-Slot20', 20, 4, N'4', 1, 2, CAST(N'2022-07-16' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (51, N'WED201c-Slot21', 21, 5, N'4', 1, 2, CAST(N'2022-07-11' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (52, N'WED201c-Slot22', 22, 1, N'4', 6, 2, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (53, N'WED201c-Slot23', 23, 7, N'4', 3, 2, CAST(N'2022-07-17' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (54, N'WED201c-Slot24', 24, 8, N'5', 4, 2, CAST(N'2022-06-02' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (55, N'WED201c-Slot25', 25, 5, N'5', 4, 2, CAST(N'2022-06-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (56, N'WED201c-Slot26', 26, 4, N'3', 6, 2, CAST(N'2022-06-17' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (57, N'WED201c-Slot27', 27, 1, N'3', 6, 2, CAST(N'2022-05-15' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (58, N'WED201c-Slot28', 28, 1, N'1', 5, 2, CAST(N'2022-06-24' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (59, N'WED201c-Slot29', 29, 1, N'1', 5, 2, CAST(N'2022-07-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (60, N'WED201c-Slot30', 30, 8, N'2', 5, 2, CAST(N'2022-06-12' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (61, N'PRJ301-Slot1', 1, 3, N'3', 5, 1, CAST(N'2022-05-02' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (62, N'PRJ301-Slot2', 2, 6, N'1', 6, 1, CAST(N'2022-06-16' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (63, N'PRJ301-Slot3', 3, 6, N'4', 2, 1, CAST(N'2022-06-10' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (64, N'PRJ301-Slot4', 4, 6, N'3', 2, 1, CAST(N'2022-05-12' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (65, N'PRJ301-Slot5', 5, 7, N'1', 3, 1, CAST(N'2022-06-15' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (66, N'PRJ301-Slot6', 6, 4, N'2', 5, 1, CAST(N'2022-06-22' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (67, N'PRJ301-Slot7', 7, 6, N'5', 4, 1, CAST(N'2022-06-25' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (68, N'PRJ301-Slot8', 8, 3, N'3', 5, 1, CAST(N'2022-05-15' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (69, N'PRJ301-Slot9', 9, 8, N'3', 2, 1, CAST(N'2022-05-27' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (70, N'PRJ301-Slot10', 10, 1, N'4', 3, 1, CAST(N'2022-06-15' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (71, N'PRJ301-Slot11', 11, 3, N'4', 1, 1, CAST(N'2022-05-05' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (72, N'PRJ301-Slot12', 12, 6, N'5', 4, 1, CAST(N'2022-05-15' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (73, N'PRJ301-Slot13', 13, 7, N'1', 1, 1, CAST(N'2022-06-13' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (74, N'PRJ301-Slot14', 14, 7, N'1', 5, 1, CAST(N'2022-07-20' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (75, N'PRJ301-Slot15', 15, 5, N'3', 1, 1, CAST(N'2022-05-07' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (76, N'PRJ301-Slot16', 16, 2, N'2', 1, 1, CAST(N'2022-07-01' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (77, N'PRJ301-Slot17', 17, 8, N'4', 5, 1, CAST(N'2022-07-18' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (78, N'PRJ301-Slot18', 18, 1, N'3', 6, 1, CAST(N'2022-06-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (79, N'PRJ301-Slot19', 19, 7, N'5', 3, 1, CAST(N'2022-05-14' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (80, N'PRJ301-Slot20', 20, 1, N'4', 5, 1, CAST(N'2022-05-19' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (81, N'PRJ301-Slot21', 21, 8, N'5', 5, 1, CAST(N'2022-05-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (82, N'PRJ301-Slot22', 22, 1, N'3', 4, 1, CAST(N'2022-05-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (83, N'PRJ301-Slot23', 23, 2, N'2', 5, 1, CAST(N'2022-05-23' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (84, N'PRJ301-Slot24', 24, 8, N'5', 3, 1, CAST(N'2022-05-17' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (85, N'PRJ301-Slot25', 25, 1, N'2', 2, 1, CAST(N'2022-07-06' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (86, N'PRJ301-Slot26', 26, 5, N'5', 5, 1, CAST(N'2022-07-09' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (87, N'PRJ301-Slot27', 27, 6, N'2', 1, 1, CAST(N'2022-06-29' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (88, N'PRJ301-Slot28', 28, 3, N'1', 3, 1, CAST(N'2022-07-26' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (89, N'PRJ301-Slot29', 29, 5, N'2', 3, 1, CAST(N'2022-06-17' AS Date), 0)
INSERT [dbo].[Lesson] ([LessonID], [LessonName], [LessonNo], [TimeID], [RoomID], [InstructorID], [GroupID], [LessonDate], [Checked]) VALUES (90, N'PRJ301-Slot30', 30, 6, N'2', 2, 1, CAST(N'2022-07-23' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
INSERT [dbo].[Room] ([RoomID], [RoomPlace]) VALUES (N'1', N'BE-315')
INSERT [dbo].[Room] ([RoomID], [RoomPlace]) VALUES (N'2', N'BE-219')
INSERT [dbo].[Room] ([RoomID], [RoomPlace]) VALUES (N'3', N'AL-R202')
INSERT [dbo].[Room] ([RoomID], [RoomPlace]) VALUES (N'4', N'DE-C206')
INSERT [dbo].[Room] ([RoomID], [RoomPlace]) VALUES (N'5', N'CI-420')
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (1, N'Hoàng Minh Huy', N'huyhmhe140954@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (2, N'Nguyễn Việt Anh', N'anhnvhe141491@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (3, N'Bùi Quốc Huy', N'huybqhe141683@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (4, N'Hoàng Xuân Bách', N'bachhxhe151297@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (5, N'Tạ Văn Hiếu', N'hieutvhe151321@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (6, N'Nguyễn Ngọc Sơn', N'sonnnhe151366@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (7, N'Phạm Hữu Việt Anh', N'AnhPHVHE151407@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (8, N'Lương Huy Anh', N'AnhLHHE153263@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (9, N'Phan Hữu Đông
', N'DongPHHE153306@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (10, N'Đinh Nghĩa Hiếu
', N'HieuDNHE153330@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (11, N'Cao Mạnh Hoàng
', N'HoangCMHE153602@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (12, N'Phùng Việt Anh
', N'AnhPVHE153711@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (13, N'Phan Kim Long
', N'LongPKHE161149@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (14, N'Lê Quang Huy
', N'HuyLQHE161499@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (15, N'Phạm Huy Hoàng
', N'HoangPHHE161574@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (16, N'Đỗ Trần Quang Huy
', N'HuyDTQHE161637@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (17, N'Đặng Nhật Minh
', N'MinhDNHE161697@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (18, N'Trần Quốc Hưng
', N'HungTQHE161699@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (19, N'Đoàn Tiến Đạt
', N'DatDTHE161701@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (20, N'Trương Quốc Khánh
', N'KhanhTQHE161722@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (21, N'Dương Công Sơn
', N'SonDCHE161827@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (22, N'Kieu Anh Son', N'sonkahe161888@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (23, N'Nguyễn Ngọc Bảo
', N'BaoNNHE161928@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (24, N'Nguyễn Doãn Đạt
', N'DatNDHE163390@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (25, N'Đỗ Như Mạnh
', N'ManhDNHE163519@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (26, N'Nguyễn Trung Vũ
', N'VuNTHE163585@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (27, N'Nguyễn Minh Hoàng
', N'HoangNMHE163884@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (28, N'Nguyễn Hoàng Minh
', N'MinhNHHE163937@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (29, N'Nguyễn Thế Duy
', N'DuyNTHE164001@fpt.edu.vn
')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail]) VALUES (30, N'Pham Danh Trung Nguyen', N'nguyenpdthe164016@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (1, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (1, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (1, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (2, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (3, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (3, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (3, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (4, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (5, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (5, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (5, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (6, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (6, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (7, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (7, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (8, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (8, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (9, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (9, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (9, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (10, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (10, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (11, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (11, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (12, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (12, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (13, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (13, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (13, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (14, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (15, 1)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (15, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (15, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (16, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (17, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (19, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (19, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (21, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (21, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (22, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (23, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (24, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (25, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (25, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (26, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (27, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (27, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (29, 2)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (29, 3)
INSERT [dbo].[StudentInGroup] ([StudentID], [GroupID]) VALUES (30, 3)
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (2, CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (3, CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (4, CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (5, CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (6, CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (7, CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeID], [TimeBegin], [TimeEnd]) VALUES (8, CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_AttendanceStatus]  DEFAULT ((0)) FOR [AttendanceStatus]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Lesson]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Group]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Instructor]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Room]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_TimeSlot] FOREIGN KEY([TimeID])
REFERENCES [dbo].[TimeSlot] ([TimeID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_TimeSlot]
GO
ALTER TABLE [dbo].[StudentInGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentInGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[StudentInGroup] CHECK CONSTRAINT [FK_StudentInGroup_Group]
GO
ALTER TABLE [dbo].[StudentInGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentInGroup_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentInGroup] CHECK CONSTRAINT [FK_StudentInGroup_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
