USE [master]
GO
/****** Object:  Database [mvc]    Script Date: 9/12/2018 5:46:53 PM ******/
CREATE DATABASE [mvc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mvc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mvc.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mvc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mvc_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mvc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvc] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mvc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mvc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mvc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mvc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvc] SET RECOVERY FULL 
GO
ALTER DATABASE [mvc] SET  MULTI_USER 
GO
ALTER DATABASE [mvc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mvc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mvc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [mvc]
GO
/****** Object:  StoredProcedure [dbo].[delete_employee]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_employee]
(

@emp_id int
)
as
begin 

delete from employees where emp_id=@emp_id

end


GO
/****** Object:  StoredProcedure [dbo].[insert_employees]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[insert_employees]
@emp_name nvarchar(20),
@emp_email nvarchar(20)
as
begin 

insert into EMPLOYEEs
values(@emp_name,@emp_email)

end




GO
/****** Object:  StoredProcedure [dbo].[showemployess]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[showemployess]

as
begin 
select * from EMPLOYEEs


end

GO
/****** Object:  StoredProcedure [dbo].[update_employee]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_employee]
(
@emp_name nvarchar(20),
@emp_email nvarchar(20),
@emp_id int
)
as
begin 

update employees 
set emp_name=@emp_name,emp_email=@emp_email where emp_id=@emp_id

end

GO
/****** Object:  Table [dbo].[departments]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[dep_id] [int] IDENTITY(1,1) NOT NULL,
	[dep_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [nvarchar](20) NOT NULL,
	[emp_fk_dep] [int] NULL,
	[emp_email] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [nvarchar](80) NOT NULL,
	[s_image] [nvarchar](max) NULL,
	[s_age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_department]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_department](
	[dep_id] [int] IDENTITY(1,1) NOT NULL,
	[dep_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_employee]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [nvarchar](30) NOT NULL,
	[emp_dob] [date] NOT NULL,
	[emp_hiredate] [date] NOT NULL,
	[emp_fk_id] [int] NULL,
	[emp_img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[video]    Script Date: 9/12/2018 5:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[v_id] [int] IDENTITY(1,1) NOT NULL,
	[v_path] [nvarchar](max) NOT NULL,
	[v_view] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[v_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (1, N'hr')
INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (2, N'Marketing')
INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (3, N'Finance')
INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (4, N'admin')
INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (5, N'faculty')
INSERT [dbo].[departments] ([dep_id], [dep_name]) VALUES (1005, N'accounts')
SET IDENTITY_INSERT [dbo].[departments] OFF
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2002, N'salmanmasood', 2, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2004, N'salmanmasood', 2, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2006, N'ggg', 1, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2007, N'ggg', 1, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2008, N'ttrrr', 1, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (2010, N'saad', 4, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (3002, N'salman masood', 4, N'test@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (4003, N'ahmad', 2, N'SA@YAHOO.COM')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (4006, N'ali ahmed', 1, N'SA@YAHdOO.COM')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (5003, N'usama', 5, N'usama5@gmail.com')
INSERT [dbo].[employees] ([emp_id], [emp_name], [emp_fk_dep], [emp_email]) VALUES (5004, N'waqas', 1005, N'waqas046gmail.com')
SET IDENTITY_INSERT [dbo].[employees] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (1, N'salman masood', N'~/Content/upload/351943582abc.jpg', 21)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2, N'ali', N'~/Content/upload/1753484785abc.jpg', 21)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (6, N'ahmed', N'~/Content/upload/194653133540707_1930811120271491_2928235425975762944_o.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (7, N'sunny', N'~/Content/upload/140046170033540707_1930811120271491_2928235425975762944_o.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (8, N'saleem', N'~/Content/upload/63885498xyz.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (9, N'fahad', N'~/Content/upload/545577361roll.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (10, N'sami', N'~/Content/upload/982799041xyz.jpg', 16)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (1002, N'saaqd', N'~/Content/upload/1951282160main.jpg', 16)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (1003, N'saaqdqweqw', N'~/Content/upload/1989881397Screen.jpg', 16)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2002, N'test', N'~/Content/upload/552415546HR-MANAGEMENT.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2003, N'abc', N'~/Content/upload/1834792107images.jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2004, N'Adeel', N'C:\Users\asp.APTECHNK\Desktop\Lecture-7\WebApplication1\WebApplication1\Content\upload\2054701340Capture.JPG', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2008, N'Adeel12', N'C:\Users\asp.APTECHNK\Desktop\Lecture-7\WebApplication1\WebApplication1\Content\upload\791297489download (2).jpg', 18)
INSERT [dbo].[student] ([s_id], [s_name], [s_image], [s_age]) VALUES (2009, N'Adeel1111', N'~/Content/upload/2117795500download.jpg', 18)
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[tbl_department] ON 

INSERT [dbo].[tbl_department] ([dep_id], [dep_name]) VALUES (4, N'ADMIN')
INSERT [dbo].[tbl_department] ([dep_id], [dep_name]) VALUES (2, N'HR')
INSERT [dbo].[tbl_department] ([dep_id], [dep_name]) VALUES (1, N'IT')
INSERT [dbo].[tbl_department] ([dep_id], [dep_name]) VALUES (3, N'MANAGEMENT')
INSERT [dbo].[tbl_department] ([dep_id], [dep_name]) VALUES (5, N'MARKETING')
SET IDENTITY_INSERT [dbo].[tbl_department] OFF
SET IDENTITY_INSERT [dbo].[tbl_employee] ON 

INSERT [dbo].[tbl_employee] ([emp_id], [emp_name], [emp_dob], [emp_hiredate], [emp_fk_id], [emp_img]) VALUES (1, N'salman', CAST(0x7E180B00 AS Date), CAST(0xB43E0B00 AS Date), 1, N'~/Content/img/default.png')
INSERT [dbo].[tbl_employee] ([emp_id], [emp_name], [emp_dob], [emp_hiredate], [emp_fk_id], [emp_img]) VALUES (2, N'ahmed ali', CAST(0x7E180B00 AS Date), CAST(0xB43E0B00 AS Date), 1, N'~/Content/img/65314466736256684714.jpg')
INSERT [dbo].[tbl_employee] ([emp_id], [emp_name], [emp_dob], [emp_hiredate], [emp_fk_id], [emp_img]) VALUES (3, N'kashif', CAST(0x591B0B00 AS Date), CAST(0xB43E0B00 AS Date), 3, N'~/Content/img/72896805070966720114.jpg')
INSERT [dbo].[tbl_employee] ([emp_id], [emp_name], [emp_dob], [emp_hiredate], [emp_fk_id], [emp_img]) VALUES (4, N'asim', CAST(0x30170B00 AS Date), CAST(0xB43E0B00 AS Date), 4, N'~/Content/img/134465210270966720114.jpg')
SET IDENTITY_INSERT [dbo].[tbl_employee] OFF
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([v_id], [v_path], [v_view]) VALUES (1, N'https://www.youtube.com/watch?v=eSz6KvK1Ev0', 0)
INSERT [dbo].[video] ([v_id], [v_path], [v_view]) VALUES (2, N'https://www.youtube.com/watch?v=Jor8zys3FZE&t=218s', 0)
INSERT [dbo].[video] ([v_id], [v_path], [v_view]) VALUES (3, N'https://www.youtube.com/watch?v=M1b1fIbHBAc&t=368s', 0)
INSERT [dbo].[video] ([v_id], [v_path], [v_view]) VALUES (4, N'https://www.youtube.com/watch?v=8d4-VzqpcDQ&t=9s', 0)
SET IDENTITY_INSERT [dbo].[video] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__student__8D00F45A67163215]    Script Date: 9/12/2018 5:46:53 PM ******/
ALTER TABLE [dbo].[student] ADD UNIQUE NONCLUSTERED 
(
	[s_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_depa__7BE5495046059035]    Script Date: 9/12/2018 5:46:53 PM ******/
ALTER TABLE [dbo].[tbl_department] ADD UNIQUE NONCLUSTERED 
(
	[dep_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[student] ADD  DEFAULT ((18)) FOR [s_age]
GO
ALTER TABLE [dbo].[tbl_employee] ADD  DEFAULT ('~/Content/img/default.png') FOR [emp_img]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [v_view]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([emp_fk_dep])
REFERENCES [dbo].[departments] ([dep_id])
GO
ALTER TABLE [dbo].[tbl_employee]  WITH CHECK ADD FOREIGN KEY([emp_fk_id])
REFERENCES [dbo].[tbl_department] ([dep_id])
GO
USE [master]
GO
ALTER DATABASE [mvc] SET  READ_WRITE 
GO
