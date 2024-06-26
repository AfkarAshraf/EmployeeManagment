USE [master]
GO
/****** Object:  Database [EmployeeRegister]    Script Date: 23-03-2024 17:08:37 ******/
CREATE DATABASE [EmployeeRegister]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeRegister', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeRegister.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeRegister_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeRegister_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EmployeeRegister] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeRegister].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeRegister] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeRegister] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeRegister] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeRegister] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeRegister] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeRegister] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeRegister] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeRegister] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeRegister] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeRegister] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeRegister] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeRegister] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeRegister] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeRegister] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeRegister] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeRegister] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeRegister] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeRegister] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeRegister] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeRegister] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeRegister] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeRegister] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeRegister] SET RECOVERY FULL 
GO
ALTER DATABASE [EmployeeRegister] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeRegister] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeRegister] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeRegister] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeRegister] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeRegister] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeRegister] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EmployeeRegister', N'ON'
GO
ALTER DATABASE [EmployeeRegister] SET QUERY_STORE = ON
GO
ALTER DATABASE [EmployeeRegister] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EmployeeRegister]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23-03-2024 17:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Department] [varchar](20) NOT NULL,
	[Position] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Employee]    Script Date: 23-03-2024 17:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[Delete_Employee]
 (
 @id as int
 )
 AS
 begin
 delete from  Employee Where Id = @id;
 end
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee_Details]    Script Date: 23-03-2024 17:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Get_Employee_Details]
 (
 @id as int
 )
 AS
 begin
 select * from Employee Where Id = @id;
 end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 23-03-2024 17:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Employee]
 (@name as varchar(20),
 @email as Varchar(20),
 @phone as varchar(15),
 @description as varchar(200),
 @Address as  varchar(200),
 @Department as  varchar(20),
 @Position as Varchar (30)
 )

 as
 begin
 insert into Employee(Name,Email,Phone,description,Address,Department,Position)
values(@name,@email,@phone,@description,@Address,@Department,@Position);


end
GO
/****** Object:  StoredProcedure [dbo].[Update_Employee_Details]    Script Date: 23-03-2024 17:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_Employee_Details]
 (
 @id as int,
 @name as varchar(20),
 @email as Varchar(20),
 @phone as varchar(15),
 @description as varchar(200),
 @Address as  varchar(200),
 @Department as  varchar(20),
 @Position as Varchar (30)
 )

 as
 begin
 Update Employee
 Set Name = @name,Email = @email,Phone = @phone,description = @description,Address = @Address,Position = @Position
     where Id = @id; 
     
 
 
 end
GO
USE [master]
GO
ALTER DATABASE [EmployeeRegister] SET  READ_WRITE 
GO
