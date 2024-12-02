USE [master]
GO
/****** Object:  Database [AlmacenesGlobales]    Script Date: 11/24/2024 11:26:34 PM ******/
CREATE DATABASE [AlmacenesGlobales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmacenesGlobales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlmacenesGlobales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmacenesGlobales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlmacenesGlobales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AlmacenesGlobales] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmacenesGlobales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmacenesGlobales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmacenesGlobales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmacenesGlobales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmacenesGlobales] SET  MULTI_USER 
GO
ALTER DATABASE [AlmacenesGlobales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmacenesGlobales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmacenesGlobales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmacenesGlobales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlmacenesGlobales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmacenesGlobales', N'ON'
GO
ALTER DATABASE [AlmacenesGlobales] SET QUERY_STORE = ON
GO
ALTER DATABASE [AlmacenesGlobales] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AlmacenesGlobales]
GO
/****** Object:  User [gabriel]    Script Date: 11/24/2024 11:26:35 PM ******/
CREATE USER [gabriel] FOR LOGIN [gabriel] WITH DEFAULT_SCHEMA=[gabriel]
GO
/****** Object:  Schema [gabriel]    Script Date: 11/24/2024 11:26:35 PM ******/
CREATE SCHEMA [gabriel]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[ClaveAcceso] [varchar](100) NULL,
	[Cargo] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoId] [int] NULL,
	[ProductoId] [int] NULL,
	[Cantidad] [int] NULL,
	[Monto] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[Estado] [varchar](20) NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Descripcion] [text] NULL,
	[Precio] [decimal](10, 2) NULL,
	[ProveedorId] [int] NULL,
	[CategoriaId] [int] NULL,
	[StockDisponible] [int] NULL,
	[StockMinimo] [int] NULL,
	[StockMaximo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Contacto] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/24/2024 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[NumeroTelefono] [varchar](15) NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedidos] ([ID])
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([ID])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([ID])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ID])
GO
USE [master]
GO
ALTER DATABASE [AlmacenesGlobales] SET  READ_WRITE 
GO

-- Insertar registros en la tabla Categorias
INSERT INTO Categorias (Nombre)
VALUES 
    ('Electrónica'),
    ('Ropa'),
    ('Alimentos'),
    ('Muebles'),
    ('Juguetes');
-- Insertar registros en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Contacto, Email, Telefono)
VALUES 
    ('Proveedor A', 'Carlos López', 'contacto@proveedora.com', '987654321'),
    ('Proveedor B', 'Ana García', 'contacto@proveedorb.com', '912345678'),
    ('Proveedor C', 'Luis Martínez', 'contacto@proveedorc.com', '998877665'),
    ('Proveedor D', 'Marta Fernández', 'contacto@proveedord.com', '945612345'),
    ('Proveedor E', 'Juan Pérez', 'contacto@proveedore.com', '956789123');

-- Insertar registros en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Email, NumeroTelefono, Direccion)
VALUES 
    ('Juan Pérez', 'juan.perez@mail.com', '987654321', 'Av. Siempre Viva 123'),
    ('Maria López', 'maria.lopez@mail.com', '912345678', 'Calle Ficticia 456'),
    ('Carlos García', 'carlos.garcia@mail.com', '998877665', 'Pasaje de la Esperanza 789'),
    ('Ana Torres', 'ana.torres@mail.com', '945612345', 'Av. de la Libertad 321'),
    ('Luis Fernández', 'luis.fernandez@mail.com', '956789123', 'Calle Real 654');

-- Insertar registros en la tabla Empleados
INSERT INTO Empleados (Nombre, ClaveAcceso, Cargo, Email, Telefono)
VALUES 
    ('Pedro Sánchez', 'clave123', 'Gerente', 'pedro.sanchez@almacenesglobales.com', '931234567'),
    ('Laura Martínez', 'clave456', 'Vendedora', 'laura.martinez@almacenesglobales.com', '912345678'),
    ('Roberto Díaz', 'clave789', 'Almacenero', 'roberto.diaz@almacenesglobales.com', '998877665'),
    ('Elena Pérez', 'clave101', 'Contadora', 'elena.perez@almacenesglobales.com', '945612345'),
    ('Juanita Gómez', 'clave202', 'Supervisor', 'juanita.gomez@almacenesglobales.com', '956789123');

-- Insertar registros en la tabla Productos
INSERT INTO Productos (Codigo, Descripcion, Precio, ProveedorId, CategoriaId, StockDisponible, StockMinimo, StockMaximo)
VALUES 
    ('P001', 'Televisor LED 40"', 800.00, 1, 1, 50, 10, 100),  -- ProveedorId 1 (Proveedor A), CategoriaId 1 (Electrónica)
    ('P002', 'Camiseta Algodón', 20.00, 2, 2, 200, 20, 500),   -- ProveedorId 2 (Proveedor B), CategoriaId 2 (Ropa)
    ('P003', 'Pan de Molde', 1.50, 3, 3, 1000, 100, 3000),     -- ProveedorId 3 (Proveedor C), CategoriaId 3 (Alimentos)
    ('P004', 'Sofá 3 Cuerpos', 400.00, 4, 4, 30, 5, 50),       -- ProveedorId 4 (Proveedor D), CategoriaId 4 (Muebles)
    ('P005', 'Pelota de Fútbol', 15.00, 5, 5, 150, 30, 400),   -- ProveedorId 5 (Proveedor E), CategoriaId 5 (Juguetes)
	('P006', 'Laptop Gaming', 1200.00, 1, 1, 20, 5, 50),  -- ProveedorId 1 (Proveedor A), CategoriaId 1 (Electrónica)
    ('P007', 'Chaqueta de Invierno', 60.00, 2, 2, 150, 30, 300),  -- ProveedorId 2 (Proveedor B), CategoriaId 2 (Ropa)
    ('P008', 'Jugo Natural', 2.00, 3, 3, 800, 50, 1500),  -- ProveedorId 3 (Proveedor C), CategoriaId 3 (Alimentos)
    ('P009', 'Mesa de Comedor', 150.00, 4, 4, 40, 10, 100),  -- ProveedorId 4 (Proveedor D), CategoriaId 4 (Muebles)
    ('P010', 'Muñeca de Peluche', 10.00, 5, 5, 300, 50, 700),  -- ProveedorId 5 (Proveedor E), CategoriaId 5 (Juguetes)
	('P011', 'Monitor 24" Full HD', 250.00, 1, 1, 35, 5, 80),  -- ProveedorId 1 (Proveedor A), CategoriaId 1 (Electrónica)
    ('P012', 'Camiseta Deportiva', 25.00, 2, 2, 180, 30, 400),  -- ProveedorId 2 (Proveedor B), CategoriaId 2 (Ropa)
    ('P013', 'Galletas Oreo', 3.00, 3, 3, 1200, 100, 3000),  -- ProveedorId 3 (Proveedor C), CategoriaId 3 (Alimentos)
    ('P014', 'Silla Oficina', 80.00, 4, 4, 60, 10, 150),  -- ProveedorId 4 (Proveedor D), CategoriaId 4 (Muebles)
    ('P015', 'Tennis Nike', 75.00, 2, 2, 100, 20, 250),  -- ProveedorId 2 (Proveedor B), CategoriaId 2 (Ropa)
    ('P016', 'Cámara de Seguridad', 150.00, 1, 1, 50, 10, 100),  -- ProveedorId 1 (Proveedor A), CategoriaId 1 (Electrónica)
    ('P017', 'Arroz Integral', 4.00, 3, 3, 1000, 50, 2000),  -- ProveedorId 3 (Proveedor C), CategoriaId 3 (Alimentos)
    ('P018', 'Escritorio de Oficina', 120.00, 4, 4, 30, 5, 75),  -- ProveedorId 4 (Proveedor D), CategoriaId 4 (Muebles)
    ('P019', 'Bicicleta de Montaña', 350.00, 5, 5, 20, 5, 50),  -- ProveedorId 5 (Proveedor E), CategoriaId 5 (Juguetes)
    ('P020', 'Pelota de Basketball', 18.00, 5, 5, 220, 40, 500);  -- ProveedorId 5 (Proveedor E), CategoriaId 5 (Juguetes)

-- Insertar registros en la tabla Pedidos
INSERT INTO Pedidos (UsuarioId, Estado, FechaInicio, FechaFinal)
VALUES 
    (1, 'en proceso', '2024-11-01', NULL),  -- UsuarioId 1 (Juan Pérez)
    (2, 'enviado', '2024-11-03', '2024-11-07'),  -- UsuarioId 2 (Ana García)
    (3, 'finalizado', '2024-11-05', '2024-11-10'),  -- UsuarioId 3 (Carlos Díaz)
    (4, 'cancelado', '2024-11-08', '2024-11-08'),  -- UsuarioId 4 (Marta López)
    (5, 'en proceso', '2024-11-10', NULL),  -- UsuarioId 5 (Luis Martínez)
    (1, 'finalizado', '2024-11-12', '2024-11-15'),  -- UsuarioId 1 (Juan Pérez)
    (2, 'enviado', '2024-11-13', '2024-11-14'),  -- UsuarioId 2 (Ana García)
    (3, 'en proceso', '2024-11-15', NULL),  -- UsuarioId 3 (Carlos Díaz)
    (4, 'finalizado', '2024-11-16', '2024-11-18'),  -- UsuarioId 4 (Marta López)
    (5, 'cancelado', '2024-11-17', '2024-11-17');  -- UsuarioId 5 (Luis Martínez)

-- Insertar registros en la tabla Movimientos
INSERT INTO Movimientos (PedidoId, ProductoId, Cantidad, Monto)
VALUES 
    (1, 1, 2, 2400.00),  -- PedidoId 1, ProductoId 1 (Laptop Gaming), Cantidad 2, Monto 2400.00
    (1, 2, 3, 75.00),    -- PedidoId 1, ProductoId 2 (Camiseta Deportiva), Cantidad 3, Monto 75.00
    (2, 3, 5, 25.00),    -- PedidoId 2, ProductoId 3 (Galletas Oreo), Cantidad 5, Monto 25.00
    (2, 4, 1, 80.00),    -- PedidoId 2, ProductoId 4 (Silla Oficina), Cantidad 1, Monto 80.00
    (3, 5, 2, 150.00),   -- PedidoId 3, ProductoId 5 (Tennis Nike), Cantidad 2, Monto 150.00
    (3, 6, 1, 150.00),   -- PedidoId 3, ProductoId 6 (Cámara de Seguridad), Cantidad 1, Monto 150.00
    (4, 7, 10, 40.00),   -- PedidoId 4, ProductoId 7 (Arroz Integral), Cantidad 10, Monto 40.00
    (4, 8, 1, 120.00),   -- PedidoId 4, ProductoId 8 (Escritorio de Oficina), Cantidad 1, Monto 120.00
    (5, 9, 1, 350.00),   -- PedidoId 5, ProductoId 9 (Bicicleta de Montaña), Cantidad 1, Monto 350.00
    (5, 10, 3, 54.00);   -- PedidoId 5, ProductoId 10 (Pelota de Basketball), Cantidad 3, Monto 54.00
