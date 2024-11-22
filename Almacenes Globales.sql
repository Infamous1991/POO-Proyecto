﻿USE [master]
GO
/****** Object:  Database [AlmacenesGlobales]    Script Date: 11/17/2024 10:22:14 PM ******/
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
ALTER DATABASE [AlmacenesGlobales] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [AlmacenesGlobales]
GO
/****** Object:  User [nombre_usuario_user]    Script Date: 11/17/2024 10:22:14 PM ******/
USE [AlmacenesGlobales]
GO
CREATE Login dddd WITH PASSWORD= 'aaa'
GO
/****** Object:  User [nombre_usuario_admin]    Script Date: 11/17/2024 10:22:14 PM ******/

/****** Object:  DatabaseRole [roleUser]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE ROLE [roleUser]
GO
/****** Object:  DatabaseRole [roleAdmin]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE ROLE [roleAdmin]
GO
ALTER ROLE [roleUser] ADD MEMBER [nombre_usuario_user]
GO
ALTER ROLE [roleAdmin] ADD MEMBER [nombre_usuario_admin]
GO
/****** Object:  Schema [Movimientos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Movimientos]
GO
/****** Object:  Schema [Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Productos]
GO
/****** Object:  Schema [Proveedores]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Proveedores]
GO
/****** Object:  Schema [Reportes]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Reportes]
GO
/****** Object:  Schema [Usuarios]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Usuarios]
GO
/****** Object:  Table [Productos].[Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[Productos](
	[ID] [int] NOT NULL,
	[Código] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripción] [nvarchar](255) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[StockActual] [int] NOT NULL,
	[StockMinimo] [int] NOT NULL,
	[CategoriaID] [int] NULL,
	[ProveedorID] [int] NULL,
 CONSTRAINT [PK_Productos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movimientos].[Entradas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Entradas](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[TipoEntrada] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Entradas_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movimientos].[Salidas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Salidas](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaSalida] [date] NOT NULL,
	[TipoSalida] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Salidas_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[RotacionInventario]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de rotación de inventario
CREATE VIEW [Reportes].[RotacionInventario] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    SUM(e.Cantidad) AS TotalEntradas,
    SUM(s.Cantidad) AS TotalSalidas,
    (SUM(e.Cantidad) - SUM(s.Cantidad)) AS StockFinal
FROM 
    Productos.Productos p
LEFT JOIN 
    Movimientos.Entradas e ON p.ID = e.ProductoID
LEFT JOIN 
    Movimientos.Salidas s ON p.ID = s.ProductoID
GROUP BY 
    p.Nombre, p.Código;
GO
/****** Object:  View [Reportes].[CostosAlmacenamiento]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Vista de costos de almacenamiento
CREATE VIEW [Reportes].[CostosAlmacenamiento] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    p.Precio,
    p.StockActual,
    (p.Precio * p.StockActual) AS CostoTotal
FROM 
    Productos.Productos p;
GO
/****** Object:  Table [Movimientos].[Movimientos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Movimientos](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[TipoMovimiento] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaFinal] [date] NULL,
	[UsuarioID] [int] NULL,
    [Estado] [nvarchar](20) NOT NULL
 CONSTRAINT [PK_Movimientos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[ProductosMasVendidos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de los 10 productos más vendidos con ORDER BY
CREATE VIEW [Reportes].[ProductosMasVendidos] AS
SELECT TOP 10
    p.Nombre AS Producto,
    SUM(m.Cantidad) AS CantidadVendida
FROM 
    Movimientos.Movimientos m
JOIN 
    Productos.Productos p ON m.ProductoID = p.ID
WHERE 
    m.TipoMovimiento = 'Salida'
GROUP BY 
    p.Nombre
ORDER BY 
    CantidadVendida DESC;
GO
/****** Object:  View [Reportes].[ProductosEnBajoStock]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de productos en bajo stock
CREATE VIEW [Reportes].[ProductosEnBajoStock] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    p.StockActual,
    p.StockMinimo,
    CASE 
        WHEN p.StockActual < p.StockMinimo THEN 'Bajo Stock'
        ELSE 'Stock Suficiente'
    END AS EstadoStock
FROM 
    Productos.Productos p
WHERE 
    p.StockActual < p.StockMinimo;
GO
/****** Object:  View [Reportes].[VentasMensuales]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[VentasMensuales] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    YEAR(s.FechaSalida) AS Año,
    MONTH(s.FechaSalida) AS Mes,
    SUM(s.Cantidad) AS TotalVendido,
    SUM(s.Cantidad * p.Precio) AS Ingresos
FROM 
    Movimientos.Salidas s
JOIN 
    Productos.Productos p ON s.ProductoID = p.ID
WHERE 
    s.TipoSalida = 'Venta'
GROUP BY 
    p.Nombre, p.Código, YEAR(s.FechaSalida), MONTH(s.FechaSalida)
ORDER BY 
    Año DESC, Mes DESC
OFFSET 0 ROWS;  -- Esto es necesario para usar el ORDER BY en la vista
GO
/****** Object:  View [Reportes].[ProductosSinVentas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[ProductosSinVentas] AS
SELECT 
    p.Nombre AS Producto,
    p.Código
FROM 
    Productos.Productos p
LEFT JOIN 
    Movimientos.Salidas s ON p.ID = s.ProductoID AND s.TipoSalida = 'Venta'
WHERE 
    s.ID IS NULL;
GO
/****** Object:  Table [Productos].[Categorías]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[Categorías](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripción] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categorías_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[StockTotalPorCategoria]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[StockTotalPorCategoria] AS
SELECT 
    c.Nombre AS Categoria,
    p.Nombre AS Producto,
    SUM(s.Cantidad) AS StockTotal
FROM 
    productos.Productos p
JOIN 
    productos.Categorías c ON p.CategoriaID = c.ID
LEFT JOIN 
    Movimientos.Entradas s ON p.ID = s.ProductoID
LEFT JOIN 
    Movimientos.Salidas o ON p.ID = o.ProductoID
GROUP BY 
    c.Nombre, p.Nombre
HAVING 
    SUM(s.Cantidad) - SUM(o.Cantidad) > 0  -- Solo productos con stock positivo
ORDER BY 
    StockTotal DESC
OFFSET 0 ROWS;  -- Esto permite el uso de ORDER BY en la vista

GO
/****** Object:  Table [Movimientos].[Pedidos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Pedidos](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[UsuarioID] [int] NULL,
    [Tipo] [nvarchar](20) NOT NULL
 CONSTRAINT [PK_Pedidos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proveedores].[Proveedores]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proveedores].[Proveedores](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Contacto] [nvarchar](100) NULL,
	[Dirección] [nvarchar](255) NULL,
 CONSTRAINT [PK_Proveedores_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuarios].[Usuarios]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuarios].[Usuarios](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ProductoID_FechaEntrada]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ProductoID_FechaEntrada] ON [Movimientos].[Entradas]
(
	[ProductoID] ASC,
	[FechaEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ProductoID_FechaSalida]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ProductoID_FechaSalida] ON [Movimientos].[Salidas]
(
	[ProductoID] ASC,
	[FechaSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Codigo_Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Codigo_Productos] ON [Productos].[Productos]
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Entradas] CHECK CONSTRAINT [FK_Entradas_Producto]
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Producto]
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [Usuarios].[Usuarios] ([ID])
GO
ALTER TABLE [Movimientos].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Usuario]
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Producto]
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [Usuarios].[Usuarios] ([ID])
GO
ALTER TABLE [Movimientos].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuario]
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Salidas] CHECK CONSTRAINT [FK_Salidas_Producto]
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoría] FOREIGN KEY([CategoriaID])
REFERENCES [Productos].[Categorías] ([ID])
GO
ALTER TABLE [Productos].[Productos] CHECK CONSTRAINT [FK_Productos_Categoría]
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedor] FOREIGN KEY([ProveedorID])
REFERENCES [Proveedores].[Proveedores] ([ID])
GO
ALTER TABLE [Productos].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedor]
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD CHECK  (([TipoEntrada]='Devolución de Cliente' OR [TipoEntrada]='Compra'))
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD CHECK  (([TipoMovimiento]='Salida' OR [TipoMovimiento]='Entrada'))
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD CHECK  (([TipoSalida]='Devolución a Proveedor' OR [TipoSalida]='Venta'))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([Precio]>=(0)))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([StockActual]>=(0)))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([StockMinimo]>=(0)))
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD CHECK  (([Rol]='Usuario' OR [Rol]='Administrador'))
GO
USE [master]
GO
ALTER DATABASE [AlmacenesGlobales] SET  READ_WRITE 
GO

--INGRESAMOS LOS REGISTROS DE CADA UNA DE LAS TABLAS

--1. Tabla Productos.Categorías
INSERT INTO Productos.Categorías (ID, Nombre, Descripción)
VALUES 
(1, 'Electrónica', 'Productos electrónicos como computadoras, teléfonos, etc.'),
(2, 'Ropa', 'Prendas de vestir para hombres, mujeres y niños.'),
(3, 'Hogar', 'Artículos de decoración y electrodomésticos para el hogar.'),
(4, 'Cuidado Personal', 'Productos para el cuidado personal y belleza.'),
(5, 'Alimentos', 'Productos alimenticios de diversas categorías.'),
(6, 'Automotriz', 'Accesorios y partes para vehículos.'),
(7, 'Mascotas', 'Productos y alimentos para el cuidado de animales domésticos.');

--2. Tabla Proveedores.Proveedores
INSERT INTO Proveedores.Proveedores (ID, Nombre, Contacto, Dirección)
VALUES 
(1, 'Proveedora Global S.A.', 'Juan Pérez', 'Av. Las Palmas 123'),
(2, 'TecnoProveedora S.A.', 'Ana López', 'Calle Sol 456'),
(3, 'Ropa Express', 'Carlos Martínez', 'Calle Comercio 789'),
(4, 'ElectroMundo', 'María García', 'Av. El Sol 234'),
(5, 'Alimentos Perú S.A.', 'Pedro Rodríguez', 'Calle 5ta 123'),
(6, 'Muebles del Hogar', 'Luis Gómez', 'Av. Santa Rosa 678'),
(7, 'Mascotas y Más', 'Marta Sánchez', 'Calle 9 321'),
(8, 'Automotriz Pro', 'José Torres', 'Calle Jirón 102'),
(9, 'Moda Bella', 'Raúl Fernández', 'Av. Siempre Viva 876'),
(10, 'Casa Electrónica', 'Laura Jiménez', 'Calle Bolívar 543'),
(11, 'Limpieza Hogar', 'Felipe Díaz', 'Av. San Martín 234'),
(12, 'Soluciones Automotrices', 'Nicolás Pérez', 'Calle Huayna Capac 981'),
(13, 'Comercial Hogar', 'Sandra Ruiz', 'Calle Independencia 432'),
(14, 'TechProveedores', 'Marcos Gómez', 'Calle Del Águila 654'),
(15, 'Alimentos y Bebidas', 'Verónica Herrera', 'Calle Pescadores 765'),
(16, 'Mundo Mascotas', 'Ricardo Díaz', 'Calle El Jardín 876'),
(17, 'Accesorios Automotrices', 'Pedro Vargas', 'Av. Principal 765'),
(18, 'Hogar Express', 'Mónica García', 'Calle Los Pinos 543'),
(19, 'Moda y Estilo', 'Sofía Rodríguez', 'Calle San Pedro 231'),
(20, 'Electro Hogar', 'Raúl Castro', 'Av. Los Álamos 876');

--3. Tabla Productos.Productos
INSERT INTO Productos.Productos (ID, Código, Nombre, Descripción, Precio, StockActual, StockMinimo, CategoriaID, ProveedorID)
VALUES 
(1, 'P001', 'Laptop HP', 'Laptop HP con 16GB RAM y 512GB SSD', 1500.00, 1, 2, 1, 1),
(2, 'P002', 'Smartphone Samsung Galaxy', 'Teléfono inteligente Samsung Galaxy S21', 800.00, 20, 5, 1, 2),
(3, 'P003', 'TV LED 55" Samsung', 'Televisor LED 4K 55 pulgadas', 1200.00, 15, 3, 1, 3),
(4, 'P004', 'Tablet Lenovo', 'Tablet Lenovo con pantalla de 10 pulgadas', 350.00, 30, 5, 1, 4),
(5, 'P005', 'Auriculares Sony', 'Auriculares con cancelación de ruido Sony', 200.00, 2, 5, 1, 5),
(6, 'P006', 'Camiseta Nike', 'Camiseta deportiva Nike', 30.00, 50, 10, 2, 6),
(7, 'P007', 'Pantalón Adidas', 'Pantalón deportivo Adidas', 60.00, 40, 8, 2, 7),
(8, 'P008', 'Chaqueta Levis', 'Chaqueta de mezclilla Levis', 80.00, 3, 6, 2, 8),
(9, 'P009', 'Zapatillas Puma', 'Zapatillas deportivas Puma', 90.00, 50, 10, 2, 9),
(10, 'P010', 'Cinturón Gucci', 'Cinturón de cuero Gucci', 120.00, 20, 4, 2, 10),
(11, 'P011', 'Sofá IKEA', 'Sofá de 3 plazas IKEA', 500.00, 12, 3, 3, 1),
(12, 'P012', 'Lámpara Philips', 'Lámpara LED Philips', 35.00, 4, 10, 3, 2),
(13, 'P013', 'Aspiradora Dyson', 'Aspiradora inalámbrica Dyson', 350.00, 30, 7, 3, 3),
(14, 'P014', 'Ventilador Orbegozo', 'Ventilador Orbegozo de 30cm', 60.00, 60, 15, 3, 4),
(15, 'P015', 'Refrigeradora Whirlpool', 'Refrigeradora de 300L Whirlpool', 800.00, 5, 5, 3, 5),
(16, 'P016', 'Shampoo Pantene', 'Shampoo Pantene para cabello seco', 5.00, 150, 20, 4, 6),
(17, 'P017', 'Crema Nivea', 'Crema hidratante Nivea', 7.00, 120, 15, 4, 7),
(18, 'P018', 'Jabón Dove', 'Jabón Dove para piel sensible', 3.00, 200, 25, 4, 8),
(19, 'P019', 'Perfume Chanel', 'Perfume Chanel No. 5', 120.00, 10, 2, 4, 9),
(20, 'P020', 'Desodorante Rexona', 'Desodorante Rexona antitranspirante', 4.00, 1, 10, 4, 10),
(21, 'P021', 'Arroz Doña Maria', 'Arroz Doña Maria de 1kg', 1.50, 100, 20, 5, 1),
(22, 'P022', 'Aceite Comunal', 'Aceite Comunal de 1L', 2.00, 7, 15, 5, 2),
(23, 'P023', 'Harina Blanca', 'Harina Blanca de 500g', 1.00, 150, 30, 5, 3),
(24, 'P024', 'Galletas Choco', 'Galletas Choco con chocolate', 2.50, 80, 15, 5, 4),
(25, 'P025', 'Leche Gloria', 'Leche Gloria en presentación de 1L', 1.80, 10, 20, 5, 5),
(26, 'P026', 'Aceitunas Hojiblanca', 'Aceitunas Hojiblanca en lata de 300g', 3.00, 40, 10, 5, 6),
(27, 'P027', 'Motor de Auto', 'Motor para vehículos automotrices', 1500.00, 10, 2, 6, 7),
(28, 'P028', 'Bujías NGK', 'Bujías NGK para vehículos', 25.00, 60, 15, 6, 8),
(29, 'P029', 'Neumático Michelin', 'Neumático Michelin de 17 pulgadas', 100.00, 35, 7, 6, 9),
(30, 'P030', 'Batería Varta', 'Batería automotriz Varta de 12V', 80.00, 6, 5, 6, 10),
(31, 'P031', 'Cinturón de Seguridad', 'Cinturón de seguridad para vehículos', 15.00, 80, 20, 6, 1),
(32, 'P032', 'Comida para Perro', 'Comida balanceada para perros adultos', 10.00, 120, 30, 7, 2),
(33, 'P033', 'Juguete para Gato', 'Juguete interactivo para gatos', 8.00, 60, 15, 7, 3),
(34, 'P034', 'Arena para Gato', 'Arena para gato de 10kg', 12.00, 50, 10, 7, 4),
(35, 'P035', 'Jaula para Hamster', 'Jaula para hamster de 30cm', 25.00, 40, 8, 7, 5),
(36, 'P036', 'Collar para Perro', 'Collar de cuero para perro mediano', 10.00, 70, 15, 7, 6),
(37, 'P037', 'Alimento para Conejos', 'Alimento balanceado para conejos', 5.00, 100, 20, 7, 7),
(38, 'P038', 'Cama para Perro', 'Cama ortopédica para perros grandes', 35.00, 30, 5, 7, 8),
(39, 'P039', 'Correa para Perro', 'Correa de nylon para perros grandes', 12.00, 80, 15, 7, 9),
(40, 'P040', 'Comida para Pez', 'Comida para peces tropicales', 3.00, 8, 25, 7, 10),
(41, 'P041', 'Galletas para Perro', 'Galletas de pollo para perros', 4.00, 120, 25, 7, 1),
(42, 'P042', 'Pantalón Deportivo', 'Pantalón deportivo Adidas para hombre', 45.00, 50, 10, 2, 2),
(43, 'P043', 'Chaqueta de Invierno', 'Chaqueta impermeable Columbia para mujer', 95.00, 30, 5, 2, 3),
(44, 'P044', 'Gorra Nike', 'Gorra deportiva Nike', 20.00, 70, 15, 2, 4),
(45, 'P045', 'Botas Timberland', 'Botas Timberland impermeables', 120.00, 40, 8, 2, 5),
(46, 'P046', 'Traje de Baño Speedo', 'Traje de baño Speedo para mujer', 35.00, 60, 12, 2, 6),
(47, 'P047', 'Chaleco Columbia', 'Chaleco Columbia para clima frío', 50.00, 20, 5, 2, 7),
(48, 'P048', 'Chaqueta North Face', 'Chaqueta impermeable North Face', 130.00, 10, 2, 2, 8),
(49, 'P049', 'Gorra Adidas', 'Gorra de béisbol Adidas', 25.00, 50, 10, 2, 9),
(50, 'P050', 'Botines Puma', 'Botines deportivos Puma', 65.00, 30, 5, 2, 10);

--4. Tabla Usuarios.Usuarios
INSERT INTO Usuarios.Usuarios (ID, Nombre, Apellido, Email, Rol)
VALUES 
(1, 'Carlos', 'González', 'carlos.gonzalez@example.com', 'Administrador'),
(2, 'Ana', 'Pérez', 'ana.perez@example.com', 'Usuario'),
(3, 'Luis', 'Martínez', 'luis.martinez@example.com', 'Usuario'),
(4, 'Marta', 'Lopez', 'marta.lopez@example.com', 'Administrador'),
(5, 'Juan', 'Hernández', 'juan.hernandez@example.com', 'Usuario'),
(6, 'Pedro', 'García', 'pedro.garcia@example.com', 'Administrador'),
(7, 'María', 'Sánchez', 'maria.sanchez@example.com', 'Usuario'),
(8, 'Javier', 'Rodríguez', 'javier.rodriguez@example.com', 'Usuario'),
(9, 'Luisa', 'Fernández', 'luisa.fernandez@example.com', 'Administrador'),
(10, 'Raúl', 'Jiménez', 'raul.jimenez@example.com', 'Usuario'),
(11, 'Patricia', 'Martín', 'patricia.martin@example.com', 'Administrador'),
(12, 'Francisco', 'Gómez', 'francisco.gomez@example.com', 'Usuario'),
(13, 'Sofía', 'Ruiz', 'sofia.ruiz@example.com', 'Administrador'),
(14, 'Miguel', 'Díaz', 'miguel.diaz@example.com', 'Usuario'),
(15, 'Verónica', 'Vázquez', 'veronica.vazquez@example.com', 'Administrador'),
(16, 'Antonio', 'Torres', 'antonio.torres@example.com', 'Usuario'),
(17, 'Beatriz', 'Castro', 'beatriz.castro@example.com', 'Administrador'),
(18, 'David', 'Mendoza', 'david.mendoza@example.com', 'Usuario'),
(19, 'Cristina', 'Gutiérrez', 'cristina.gutierrez@example.com', 'Administrador'),
(20, 'Esteban', 'Alonso', 'esteban.alonso@example.com', 'Usuario'),
(21, 'Eva', 'Morales', 'eva.morales@example.com', 'Administrador'),
(22, 'Andrés', 'Jiménez', 'andres.jimenez@example.com', 'Usuario'),
(23, 'Gloria', 'Ruiz', 'gloria.ruiz@example.com', 'Administrador'),
(24, 'Fernando', 'Castillo', 'fernando.castillo@example.com', 'Usuario'),
(25, 'Isabel', 'Serrano', 'isabel.serrano@example.com', 'Administrador'),
(26, 'Carlos', 'González', 'carlos2.gonzalez@example.com', 'Usuario'),
(27, 'Lourdes', 'Pérez', 'lourdes.perez@example.com', 'Administrador'),
(28, 'Tomás', 'Martínez', 'tomas.martinez@example.com', 'Usuario'),
(29, 'Manuel', 'Lopez', 'manuel.lopez@example.com', 'Administrador'),
(30, 'Julia', 'Rodríguez', 'julia.rodriguez@example.com', 'Usuario'),
(31, 'Ricardo', 'Jiménez', 'ricardo.jimenez@example.com', 'Usuario'),
(32, 'Laura', 'González', 'laura.gonzalez@example.com', 'Administrador'),
(33, 'José', 'Sánchez', 'jose.sanchez@example.com', 'Usuario'),
(34, 'Pablo', 'Ramírez', 'pablo.ramirez@example.com', 'Administrador'),
(35, 'Raquel', 'Vega', 'raquel.vega@example.com', 'Usuario'),
(36, 'Marcelo', 'Martínez', 'marcelo.martinez@example.com', 'Administrador'),
(37, 'Natalia', 'Castillo', 'natalia.castillo@example.com', 'Usuario'),
(38, 'David', 'Serrano', 'david.serrano@example.com', 'Administrador'),
(39, 'Lorena', 'Mendoza', 'lorena.mendoza@example.com', 'Usuario'),
(40, 'Tomás', 'Hernández', 'tomas.hernandez@example.com', 'Administrador'),
(41, 'Verónica', 'Gómez', 'veronica.gomez@example.com', 'Usuario'),
(42, 'Fernando', 'Sánchez', 'fernando.sanchez@example.com', 'Administrador'),
(43, 'Carmen', 'Gutiérrez', 'carmen.gutierrez@example.com', 'Usuario'),
(44, 'Ángel', 'Vázquez', 'angel.vazquez@example.com', 'Administrador'),
(45, 'Ester', 'Alonso', 'ester.alonso@example.com', 'Usuario'),
(46, 'Juan', 'Martínez', 'juan2.martinez@example.com', 'Administrador'),
(47, 'Margarita', 'Ruiz', 'margarita.ruiz@example.com', 'Usuario'),
(48, 'Manuel', 'Rodríguez', 'manuel2.rodriguez@example.com', 'Administrador'),
(49, 'Sofía', 'Torres', 'sofia2.torres@example.com', 'Usuario'),
(50, 'Ignacio', 'Castro', 'ignacio.castro@example.com', 'Administrador'),
(51, 'Patricia', 'Morales', 'patricia2.morales@example.com', 'Usuario'),
(52, 'Alberto', 'González', 'alberto.gonzalez@example.com', 'Administrador'),
(53, 'María', 'Rodríguez', 'maria2.rodriguez@example.com', 'Usuario'),
(54, 'Isabel', 'Jiménez', 'isabel2.jimenez@example.com', 'Administrador'),
(55, 'José', 'Mendoza', 'jose2.mendoza@example.com', 'Usuario'),
(56, 'Eva', 'Torres', 'eva2.torres@example.com', 'Administrador'),
(57, 'Carlos', 'Vega', 'carlos2.vega@example.com', 'Usuario'),
(58, 'Alejandra', 'Ruiz', 'alejandra.ruiz@example.com', 'Administrador'),
(59, 'José', 'Serrano', 'jose3.serrano@example.com', 'Usuario'),
(60, 'Antonio', 'Martínez', 'antonio2.martinez@example.com', 'Administrador');

--5. Tabla Movimientos.Entradas
INSERT INTO Movimientos.Entradas (ID, ProductoID, Cantidad, FechaEntrada, TipoEntrada) VALUES
(1, 3, 5, '2024-01-05', 'Compra'),
(2, 6, 7, '2024-02-10', 'Compra'),
(3, 10, 3, '2024-03-15', 'Compra'),
(4, 8, 6, '2024-04-20', 'Compra'),
(5, 4, 4, '2024-05-25', 'Compra'),
(6, 12, 9, '2024-06-30', 'Compra'),
(7, 2, 8, '2024-07-05', 'Compra'),
(8, 5, 2, '2024-08-10', 'Compra'),
(9, 7, 6, '2024-09-15', 'Compra'),
(10, 11, 5, '2024-10-20', 'Compra'),
(11, 13, 3, '2024-11-01', 'Devolución de Cliente'),
(12, 17, 2, '2024-12-05', 'Devolución de Cliente'),
(13, 9, 6, '2024-01-15', 'Compra'),
(14, 15, 4, '2024-02-20', 'Compra'),
(15, 1, 7, '2024-03-25', 'Compra'),
(16, 16, 9, '2024-04-05', 'Compra'),
(17, 18, 3, '2024-05-10', 'Compra'),
(18, 4, 6, '2024-06-15', 'Compra'),
(19, 19, 8, '2024-07-20', 'Compra'),
(20, 20, 7, '2024-08-25', 'Compra'),
(21, 14, 5, '2024-09-05', 'Devolución de Cliente'),
(22, 3, 9, '2024-10-01', 'Devolución de Cliente'),
(23, 5, 4, '2024-11-10', 'Devolución de Cliente'),
(24, 2, 3, '2024-12-15', 'Devolución de Cliente'),
(25, 8, 7, '2024-01-20', 'Compra'),
(26, 6, 5, '2024-02-25', 'Compra'),
(27, 17, 6, '2024-03-10', 'Compra'),
(28, 20, 9, '2024-04-15', 'Compra'),
(29, 9, 8, '2024-05-01', 'Compra'),
(30, 11, 10, '2024-06-05', 'Compra'),
(31, 3, 6, '2024-07-10', 'Compra'),
(32, 16, 7, '2024-08-15', 'Compra'),
(33, 5, 4, '2024-09-20', 'Compra'),
(34, 18, 5, '2024-10-25', 'Compra'),
(35, 19, 9, '2024-11-30', 'Compra'),
(36, 7, 6, '2024-12-05', 'Devolución de Cliente'),
(37, 8, 8, '2024-01-25', 'Devolución de Cliente'),
(38, 2, 3, '2024-02-10', 'Devolución de Cliente'),
(39, 10, 9, '2024-03-15', 'Compra'),
(40, 14, 7, '2024-04-20', 'Compra'),
(41, 1, 5, '2024-05-25', 'Compra'),
(42, 6, 6, '2024-06-30', 'Compra'),
(43, 9, 4, '2024-07-05', 'Compra'),
(44, 16, 2, '2024-08-10', 'Compra'),
(45, 19, 3, '2024-09-15', 'Compra'),
(46, 5, 8, '2024-10-20', 'Compra'),
(47, 11, 5, '2024-11-01', 'Devolución de Cliente'),
(48, 12, 4, '2024-12-05', 'Devolución de Cliente'),
(49, 18, 7, '2024-01-15', 'Compra'),
(50, 3, 6, '2024-02-20', 'Compra'),
(51, 25, 5, '2024-01-25', 'Compra'),
(52, 30, 7, '2024-02-10', 'Compra'),
(53, 40, 3, '2024-03-05', 'Compra'),
(54, 35, 6, '2024-04-15', 'Compra'),
(55, 27, 9, '2024-05-20', 'Compra'),
(56, 21, 8, '2024-06-25', 'Compra'),
(57, 45, 2, '2024-07-10', 'Compra'),
(58, 33, 4, '2024-08-15', 'Compra'),
(59, 50, 7, '2024-09-05', 'Compra'),
(60, 22, 6, '2024-10-20', 'Compra'),
(61, 28, 9, '2024-11-01', 'Devolución de Cliente'),
(62, 39, 5, '2024-12-10', 'Devolución de Cliente'),
(63, 40, 4, '2024-01-05', 'Compra'),
(64, 47, 7, '2024-02-20', 'Compra'),
(65, 29, 3, '2024-03-25', 'Compra'),
(66, 32, 6, '2024-04-10', 'Compra'),
(67, 41, 9, '2024-05-05', 'Compra'),
(68, 26, 5, '2024-06-15', 'Compra'),
(69, 36, 8, '2024-07-20', 'Compra'),
(70, 34, 3, '2024-08-30', 'Compra'),
(71, 50, 6, '2024-09-25', 'Compra'),
(72, 31, 7, '2024-10-05', 'Devolución de Cliente'),
(73, 45, 4, '2024-11-10', 'Compra'),
(74, 38, 6, '2024-12-15', 'Compra'),
(75, 42, 8, '2024-01-10', 'Compra'),
(76, 48, 9, '2024-02-15', 'Compra'),
(77, 25, 5, '2024-03-05', 'Devolución de Cliente'),
(78, 37, 6, '2024-04-10', 'Devolución de Cliente'),
(79, 24, 4, '2024-05-15', 'Compra'),
(80, 50, 7, '2024-06-25', 'Compra'),
(81, 22, 3, '2024-07-30', 'Devolución de Cliente'),
(82, 32, 6, '2024-08-20', 'Compra'),
(83, 30, 5, '2024-09-15', 'Devolución de Cliente'),
(84, 43, 8, '2024-10-05', 'Compra'),
(85, 34, 2, '2024-11-15', 'Devolución de Cliente'),
(86, 40, 6, '2024-12-20', 'Compra'),
(87, 29, 7, '2024-01-15', 'Compra'),
(88, 47, 9, '2024-02-25', 'Compra'),
(89, 50, 3, '2024-03-30', 'Compra'),
(90, 39, 6, '2024-04-20', 'Compra'),
(91, 28, 4, '2024-05-25', 'Devolución de Cliente'),
(92, 31, 6, '2024-06-10', 'Compra'),
(93, 33, 9, '2024-07-05', 'Compra'),
(94, 44, 5, '2024-08-10', 'Devolución de Cliente'),
(95, 25, 8, '2024-09-01', 'Compra'),
(96, 36, 7, '2024-10-15', 'Devolución de Cliente'),
(97, 41, 4, '2024-11-10', 'Compra'),
(98, 49, 6, '2024-12-05', 'Compra'),
(99, 24, 9, '2024-01-20', 'Compra'),
(100, 50, 3, '2024-02-05', 'Compra'),
(101, 38, 7, '2024-03-10', 'Devolución de Cliente'),
(102, 27, 5, '2024-04-15', 'Compra'),
(103, 29, 6, '2024-05-10', 'Compra'),
(104, 32, 8, '2024-06-30', 'Devolución de Cliente'),
(105, 44, 9, '2024-07-25', 'Compra'),
(106, 48, 6, '2024-08-05', 'Compra'),
(107, 46, 3, '2024-09-20', 'Compra'),
(108, 42, 5, '2024-10-10', 'Compra'),
(109, 45, 7, '2024-11-05', 'Devolución de Cliente'),
(110, 50, 8, '2024-12-01', 'Compra'),
(111, 24, 6, '2024-01-10', 'Devolución de Cliente'),
(112, 40, 4, '2024-02-25', 'Compra'),
(113, 35, 7, '2024-03-15', 'Devolución de Cliente'),
(114, 47, 5, '2024-04-20', 'Devolución de Cliente'),
(115, 33, 6, '2024-05-05', 'Compra'),
(116, 44, 7, '2024-06-10', 'Compra'),
(117, 39, 5, '2024-07-01', 'Compra'),
(118, 28, 8, '2024-08-10', 'Devolución de Cliente'),
(119, 42, 9, '2024-09-25', 'Devolución de Cliente'),
(120, 46, 5, '2024-10-15', 'Compra'),
(121, 10, 4, '2024-01-15', 'Compra'),
(122, 7, 9, '2024-02-20', 'Compra'),
(123, 14, 3, '2024-03-10', 'Compra'),
(124, 5, 7, '2024-04-25', 'Compra'),
(125, 3, 6, '2024-05-10', 'Compra'),
(126, 1, 2, '2024-06-05', 'Compra'),
(127, 8, 5, '2024-07-15', 'Devolución de Cliente'),
(128, 12, 4, '2024-08-25', 'Compra'),
(129, 6, 8, '2024-09-10', 'Compra'),
(130, 9, 9, '2024-10-05', 'Compra'),
(131, 4, 3, '2024-11-20', 'Devolución de Cliente'),
(132, 11, 6, '2024-12-01', 'Compra'),
(133, 2, 7, '2024-01-05', 'Compra'),
(134, 13, 5, '2024-02-15', 'Devolución de Cliente'),
(135, 3, 6, '2024-03-30', 'Compra'),
(136, 6, 9, '2024-04-10', 'Devolución de Cliente'),
(137, 5, 4, '2024-05-15', 'Compra'),
(138, 7, 8, '2024-06-30', 'Compra'),
(139, 9, 3, '2024-07-10', 'Compra'),
(140, 11, 7, '2024-08-20', 'Compra'),
(141, 1, 5, '2024-09-15', 'Devolución de Cliente'),
(142, 12, 6, '2024-10-25', 'Devolución de Cliente'),
(143, 8, 7, '2024-11-10', 'Compra'),
(144, 13, 4, '2024-12-15', 'Compra'),
(145, 2, 9, '2024-01-25', 'Devolución de Cliente'),
(146, 3, 6, '2024-02-10', 'Compra'),
(147, 10, 8, '2024-03-05', 'Compra'),
(148, 4, 7, '2024-04-15', 'Compra'),
(149, 14, 9, '2024-05-25', 'Compra'),
(150, 6, 3, '2024-06-10', 'Devolución de Cliente');

--6. Tabla Movimientos.Salidas
INSERT INTO Movimientos.Salidas (ID, ProductoID, Cantidad, FechaSalida, TipoSalida)
VALUES
(1, 15, 3, '2024-01-15', 'Venta'),
(2, 3, 2, '2024-02-20', 'Devolución a Proveedor'),
(3, 18, 4, '2024-03-10', 'Venta'),
(4, 7, 1, '2024-04-25', 'Venta'),
(5, 2, 5, '2024-05-10', 'Devolución a Proveedor'),
(6, 12, 4, '2024-06-05', 'Venta'),
(7, 10, 3, '2024-07-15', 'Devolución a Proveedor'),
(8, 14, 2, '2024-08-25', 'Venta'),
(9, 9, 5, '2024-09-10', 'Venta'),
(10, 6, 4, '2024-10-05', 'Devolución a Proveedor'),
(11, 13, 3, '2024-11-20', 'Venta'),
(12, 4, 2, '2024-12-01', 'Devolución a Proveedor'),
(13, 11, 1, '2024-01-05', 'Venta'),
(14, 5, 5, '2024-02-15', 'Devolución a Proveedor'),
(15, 16, 2, '2024-03-30', 'Venta'),
(16, 1, 4, '2024-04-10', 'Venta'),
(17, 17, 3, '2024-05-15', 'Devolución a Proveedor'),
(18, 8, 4, '2024-06-30', 'Venta'),
(19, 19, 5, '2024-07-10', 'Devolución a Proveedor'),
(20, 5, 3, '2024-08-20', 'Venta'),
(21, 16, 2, '2024-09-15', 'Devolución a Proveedor'),
(22, 2, 5, '2024-10-25', 'Venta'),
(23, 9, 1, '2024-11-10', 'Devolución a Proveedor'),
(24, 18, 4, '2024-12-05', 'Venta'),
(25, 6, 3, '2024-01-25', 'Devolución a Proveedor'),
(26, 14, 5, '2024-02-10', 'Venta'),
(27, 1, 2, '2024-03-05', 'Devolución a Proveedor'),
(28, 7, 4, '2024-04-15', 'Venta'),
(29, 10, 3, '2024-05-25', 'Devolución a Proveedor'),
(30, 2, 5, '2024-06-10', 'Venta'),
(31, 27, 4, '2024-01-10', 'Venta'),
(32, 33, 3, '2024-02-05', 'Devolución a Proveedor'),
(33, 19, 5, '2024-03-20', 'Venta'),
(34, 16, 2, '2024-04-12', 'Venta'),
(35, 22, 1, '2024-05-15', 'Devolución a Proveedor'),
(36, 30, 4, '2024-06-07', 'Venta'),
(37, 26, 3, '2024-07-25', 'Devolución a Proveedor'),
(38, 21, 2, '2024-08-30', 'Venta'),
(39, 34, 1, '2024-09-12', 'Venta'),
(40, 17, 5, '2024-10-05', 'Devolución a Proveedor'),
(41, 31, 4, '2024-11-15', 'Venta'),
(42, 18, 2, '2024-12-10', 'Devolución a Proveedor'),
(43, 23, 3, '2024-01-25', 'Venta'),
(44, 28, 5, '2024-02-18', 'Devolución a Proveedor'),
(45, 35, 1, '2024-03-10', 'Venta'),
(46, 25, 4, '2024-04-05', 'Venta'),
(47, 32, 2, '2024-05-20', 'Devolución a Proveedor'),
(48, 29, 3, '2024-06-25', 'Venta'),
(49, 33, 1, '2024-07-10', 'Devolución a Proveedor'),
(50, 24, 4, '2024-08-15', 'Venta'),
(51, 19, 5, '2024-09-05', 'Devolución a Proveedor'),
(52, 21, 3, '2024-10-20', 'Venta'),
(53, 30, 2, '2024-11-12', 'Devolución a Proveedor'),
(54, 27, 4, '2024-12-03', 'Venta'),
(55, 34, 3, '2024-01-15', 'Devolución a Proveedor'),
(56, 28, 5, '2024-02-12', 'Venta'),
(57, 32, 2, '2024-03-18', 'Devolución a Proveedor'),
(58, 16, 1, '2024-04-25', 'Venta'),
(59, 22, 4, '2024-05-30', 'Devolución a Proveedor'),
(60, 35, 3, '2024-06-10', 'Venta'),
(61, 30, 4, '2024-01-15', 'Venta'),
(62, 33, 3, '2024-02-20', 'Devolución a Proveedor'),
(63, 37, 2, '2024-03-05', 'Venta'),
(64, 42, 1, '2024-04-12', 'Devolución a Proveedor'),
(65, 31, 5, '2024-05-10', 'Venta'),
(66, 34, 4, '2024-06-17', 'Devolución a Proveedor'),
(67, 38, 3, '2024-07-25', 'Venta'),
(68, 40, 1, '2024-08-02', 'Devolución a Proveedor'),
(69, 35, 5, '2024-09-10', 'Venta'),
(70, 41, 2, '2024-10-07', 'Venta'),
(71, 36, 3, '2024-11-15', 'Devolución a Proveedor'),
(72, 43, 4, '2024-12-01', 'Venta'),
(73, 32, 2, '2024-01-25', 'Devolución a Proveedor'),
(74, 39, 1, '2024-02-15', 'Venta'),
(75, 30, 5, '2024-03-12', 'Devolución a Proveedor'),
(76, 34, 4, '2024-04-17', 'Venta'),
(77, 37, 2, '2024-05-20', 'Devolución a Proveedor'),
(78, 41, 3, '2024-06-14', 'Venta'),
(79, 35, 1, '2024-07-19', 'Devolución a Proveedor'),
(80, 42, 4, '2024-08-30', 'Venta'),
(81, 32, 2, '2024-09-20', 'Devolución a Proveedor'),
(82, 40, 3, '2024-10-03', 'Venta'),
(83, 33, 1, '2024-11-08', 'Devolución a Proveedor'),
(84, 38, 5, '2024-12-17', 'Venta'),
(85, 41, 2, '2024-01-10', 'Devolución a Proveedor'),
(86, 36, 4, '2024-02-22', 'Venta'),
(87, 43, 3, '2024-03-18', 'Devolución a Proveedor'),
(88, 44, 1, '2024-04-23', 'Venta'),
(89, 30, 5, '2024-05-05', 'Devolución a Proveedor'),
(90, 35, 2, '2024-06-28', 'Venta'),
(91, 35, 5, '2024-01-22', 'Venta'),
(92, 37, 3, '2024-02-10', 'Devolución a Proveedor'),
(93, 44, 4, '2024-03-15', 'Venta'),
(94, 50, 1, '2024-04-07', 'Devolución a Proveedor'),
(95, 39, 2, '2024-05-10', 'Venta'),
(96, 45, 3, '2024-06-17', 'Devolución a Proveedor'),
(97, 38, 5, '2024-07-20', 'Venta'),
(98, 41, 4, '2024-08-12', 'Devolución a Proveedor'),
(99, 47, 2, '2024-09-25', 'Venta'),
(100, 36, 3, '2024-10-08', 'Devolución a Proveedor'),
(101, 42, 1, '2024-11-15', 'Venta'),
(102, 48, 5, '2024-12-02', 'Devolución a Proveedor'),
(103, 49, 4, '2024-01-18', 'Venta'),
(104, 50, 2, '2024-02-12', 'Devolución a Proveedor'),
(105, 46, 3, '2024-03-07', 'Venta'),
(106, 45, 5, '2024-04-22', 'Devolución a Proveedor'),
(107, 48, 1, '2024-05-14', 'Venta'),
(108, 43, 2, '2024-06-28', 'Devolución a Proveedor'),
(109, 40, 3, '2024-07-10', 'Venta'),
(110, 47, 5, '2024-08-19', 'Devolución a Proveedor'),
(111, 41, 1, '2024-09-03', 'Venta'),
(112, 50, 4, '2024-10-21', 'Devolución a Proveedor'),
(113, 44, 2, '2024-11-11', 'Venta'),
(114, 42, 3, '2024-12-14', 'Devolución a Proveedor'),
(115, 46, 4, '2024-01-05', 'Venta'),
(116, 39, 1, '2024-02-25', 'Devolución a Proveedor'),
(117, 43, 5, '2024-03-22', 'Venta'),
(118, 45, 2, '2024-04-10', 'Devolución a Proveedor'),
(119, 47, 4, '2024-05-30', 'Venta'),
(120, 44, 3, '2024-06-01', 'Devolución a Proveedor');

--7. Tabla Movimientos.Pedidos
INSERT INTO Movimientos.Pedidos (ID, ProductoID, Cantidad, FechaPedido, UsuarioID)
VALUES
(1, 12, 4, '2024-01-03', 5),
(2, 3, 2, '2024-01-10', 15),
(3, 9, 3, '2024-02-14', 22),
(4, 20, 1, '2024-02-18', 10),
(5, 35, 5, '2024-03-05', 30),
(6, 44, 2, '2024-03-16', 6),
(7, 28, 3, '2024-04-08', 27),
(8, 17, 4, '2024-04-15', 14),
(9, 11, 1, '2024-05-10', 19),
(10, 39, 5, '2024-05-20', 8),
(11, 31, 3, '2024-06-02', 12),
(12, 8, 2, '2024-06-22', 7),
(13, 33, 4, '2024-07-03', 29),
(14, 14, 5, '2024-07-17', 18),
(15, 24, 3, '2024-08-05', 21),
(16, 27, 2, '2024-08-12', 16),
(17, 36, 4, '2024-09-06', 13),
(18, 42, 3, '2024-09-22', 2),
(19, 18, 1, '2024-10-01', 23),
(20, 4, 2, '2024-10-09', 26),
(21, 50, 5, '2024-10-21', 9),
(22, 13, 3, '2024-11-02', 28),
(23, 41, 1, '2024-11-18', 3),
(24, 6, 4, '2024-12-10', 20),
(25, 48, 2, '2024-12-14', 11),
(26, 32, 3, '2024-12-22', 17),
(27, 19, 5, '2024-01-25', 25),
(28, 22, 1, '2024-02-02', 24),
(29, 29, 2, '2024-03-03', 4),
(30, 37, 4, '2024-04-11', 31),
(31, 5, 4, '2024-01-15', 35),
(32, 25, 3, '2024-02-20', 12),
(33, 8, 2, '2024-02-25', 45),
(34, 14, 5, '2024-03-10', 50),
(35, 37, 1, '2024-03-22', 60),
(36, 22, 4, '2024-04-05', 41),
(37, 40, 2, '2024-04-19', 2),
(38, 13, 3, '2024-05-02', 17),
(39, 28, 1, '2024-05-15', 19),
(40, 9, 5, '2024-06-01', 3),
(41, 21, 4, '2024-06-25', 13),
(42, 30, 2, '2024-07-03', 48),
(43, 45, 3, '2024-07-18', 23),
(44, 12, 4, '2024-08-02', 27),
(45, 41, 1, '2024-08-14', 36),
(46, 11, 2, '2024-09-06', 30),
(47, 16, 3, '2024-09-21', 39),
(48, 32, 4, '2024-10-08', 8),
(49, 18, 2, '2024-10-18', 43),
(50, 34, 3, '2024-11-04', 47),
(51, 50, 1, '2024-11-10', 52),
(52, 2, 5, '2024-12-01', 1),
(53, 20, 3, '2024-12-06', 9),
(54, 23, 4, '2024-12-15', 33),
(55, 46, 1, '2024-12-20', 5),
(56, 42, 2, '2024-12-25', 28),
(57, 49, 3, '2024-01-10', 21),
(58, 31, 4, '2024-02-12', 37),
(59, 7, 5, '2024-03-18', 40),
(60, 38, 2, '2024-04-04', 6),
(61, 6, 3, '2024-04-22', 18),
(62, 4, 1, '2024-05-05', 25),
(63, 33, 4, '2024-06-10', 12),
(64, 26, 5, '2024-07-01', 49),
(65, 48, 2, '2024-07-23', 22),
(66, 10, 1, '2024-08-30', 51),
(67, 44, 4, '2024-09-11', 14),
(68, 29, 3, '2024-09-25', 20),
(69, 43, 5, '2024-10-13', 16),
(70, 24, 2, '2024-11-02', 32),
(71, 19, 4, '2024-11-15', 34),
(72, 15, 1, '2024-12-05', 11),
(73, 35, 2, '2024-12-14', 44),
(74, 39, 3, '2024-12-17', 53),
(75, 25, 5, '2024-01-02', 42),
(76, 47, 1, '2024-02-18', 24),
(77, 3, 2, '2024-03-09', 55),
(78, 21, 4, '2024-04-12', 46),
(79, 27, 3, '2024-05-23', 7),
(80, 30, 1, '2024-06-04', 29),
(81, 9, 3, '2024-07-10', 12),
(82, 14, 2, '2024-08-01', 18),
(83, 6, 1, '2024-08-22', 36),
(84, 12, 5, '2024-09-05', 41),
(85, 31, 4, '2024-09-14', 50),
(86, 16, 3, '2024-10-10', 2),
(87, 28, 5, '2024-10-16', 47),
(88, 40, 2, '2024-11-07', 43),
(89, 5, 4, '2024-11-12', 8),
(90, 33, 1, '2024-12-01', 45),
(91, 25, 3, '2024-12-09', 24),
(92, 42, 2, '2024-12-13', 11),
(93, 7, 5, '2024-12-21', 30),
(94, 23, 4, '2024-01-09', 53),
(95, 47, 2, '2024-01-14', 39),
(96, 44, 3, '2024-02-01', 15),
(97, 21, 4, '2024-02-07', 27),
(98, 13, 1, '2024-03-12', 19),
(99, 37, 5, '2024-03-20', 40),
(100, 11, 2, '2024-04-18', 31);

--8. Tabla Movimientos.Movimientos
INSERT INTO Movimientos.Movimientos (ID, ProductoID, TipoMovimiento, Cantidad, FechaMovimiento, UsuarioID) VALUES
(1, 5, 'Entrada', 3, '2024-01-15', 12),
(2, 12, 'Salida', 2, '2024-02-22', 8),
(3, 20, 'Entrada', 4, '2024-03-10', 25),
(4, 28, 'Salida', 1, '2024-04-05', 15),
(5, 35, 'Entrada', 5, '2024-05-01', 3),
(6, 40, 'Salida', 3, '2024-06-20', 19),
(7, 6, 'Entrada', 1, '2024-07-18', 4),
(8, 18, 'Salida', 2, '2024-08-10', 21),
(9, 22, 'Entrada', 3, '2024-09-25', 2),
(10, 30, 'Salida', 1, '2024-10-12', 29),
(11, 8, 'Entrada', 4, '2024-11-02', 6),
(12, 15, 'Salida', 2, '2024-12-18', 16),
(13, 25, 'Entrada', 5, '2024-01-06', 20),
(14, 17, 'Salida', 1, '2024-02-14', 7),
(15, 10, 'Entrada', 3, '2024-03-08', 11),
(16, 33, 'Salida', 4, '2024-04-25', 24),
(17, 45, 'Entrada', 2, '2024-05-16', 5),
(18, 12, 'Salida', 1, '2024-06-04', 22),
(19, 24, 'Entrada', 4, '2024-07-13', 9),
(20, 38, 'Salida', 3, '2024-08-30', 18),
(21, 9, 'Entrada', 2, '2024-09-05', 27),
(22, 14, 'Salida', 1, '2024-10-21', 13),
(23, 11, 'Entrada', 5, '2024-11-12', 30),
(24, 42, 'Salida', 3, '2024-12-08', 17),
(25, 29, 'Entrada', 4, '2024-01-28', 26),
(26, 32, 'Salida', 2, '2024-02-03', 14),
(27, 19, 'Entrada', 1, '2024-03-22', 10),
(28, 37, 'Salida', 3, '2024-04-19', 28),
(29, 43, 'Entrada', 4, '2024-05-23', 23),
(30, 50, 'Salida', 5, '2024-06-15', 12),
(31, 32, 'Entrada', 3, '2024-01-15', 4),
(32, 15, 'Salida', 2, '2024-02-18', 21),
(33, 10, 'Entrada', 4, '2024-03-02', 18),
(34, 7, 'Salida', 1, '2024-04-10', 6),
(35, 27, 'Entrada', 5, '2024-05-20', 14),
(36, 5, 'Salida', 3, '2024-06-15', 12),
(37, 22, 'Entrada', 2, '2024-07-01', 11),
(38, 19, 'Salida', 4, '2024-08-12', 9),
(39, 13, 'Entrada', 1, '2024-09-22', 20),
(40, 30, 'Salida', 3, '2024-10-05', 13),
(41, 25, 'Entrada', 4, '2024-11-08', 8),
(42, 42, 'Salida', 2, '2024-12-10', 16),
(43, 3, 'Entrada', 3, '2024-01-30', 7),
(44, 12, 'Salida', 5, '2024-02-14', 28),
(45, 9, 'Entrada', 1, '2024-03-05', 23),
(46, 8, 'Salida', 4, '2024-04-01', 30),
(47, 40, 'Entrada', 2, '2024-05-15', 18),
(48, 36, 'Salida', 3, '2024-06-23', 14),
(49, 41, 'Entrada', 4, '2024-07-19', 25),
(50, 17, 'Salida', 1, '2024-08-26', 22),
(51, 6, 'Entrada', 5, '2024-09-10', 19),
(52, 28, 'Salida', 3, '2024-10-20', 20),
(53, 39, 'Entrada', 2, '2024-11-14', 16),
(54, 2, 'Salida', 4, '2024-12-05', 29),
(55, 18, 'Entrada', 3, '2024-01-10', 11),
(56, 24, 'Salida', 1, '2024-02-02', 8),
(57, 21, 'Entrada', 4, '2024-03-07', 12),
(58, 29, 'Salida', 3, '2024-04-13', 9),
(59, 16, 'Entrada', 2, '2024-05-28', 27),
(60, 33, 'Salida', 4, '2024-06-05', 10),
(61, 23, 'Entrada', 1, '2024-07-25', 15),
(62, 34, 'Salida', 3, '2024-08-17', 6),
(63, 14, 'Entrada', 4, '2024-09-03', 18),
(64, 44, 'Salida', 2, '2024-10-28', 30),
(65, 31, 'Entrada', 5, '2024-11-11', 13),
(66, 37, 'Salida', 1, '2024-12-22', 17),
(67, 4, 'Entrada', 3, '2024-01-21', 20),
(68, 11, 'Salida', 2, '2024-02-28', 23),
(69, 48, 'Entrada', 4, '2024-03-18', 26),
(70, 20, 'Salida', 1, '2024-04-06', 19),
(71, 26, 'Entrada', 3, '2024-05-02', 11),
(72, 50, 'Salida', 4, '2024-06-16', 15),
(73, 45, 'Entrada', 5, '2024-07-04', 8),
(74, 43, 'Salida', 2, '2024-08-08', 18),
(75, 30, 'Entrada', 1, '2024-09-29', 21),
(76, 12, 'Salida', 3, '2024-10-16', 14),
(77, 38, 'Entrada', 4, '2024-11-02', 9),
(78, 41, 'Salida', 2, '2024-12-19', 28),
(79, 35, 'Entrada', 3, '2024-01-04', 25),
(80, 7, 'Salida', 1, '2024-02-12', 6),
(81, 29, 'Entrada', 3, '2024-01-18', 24),
(82, 44, 'Salida', 2, '2024-02-05', 10),
(83, 22, 'Entrada', 4, '2024-03-09', 6),
(84, 25, 'Salida', 1, '2024-04-18', 29),
(85, 27, 'Entrada', 5, '2024-05-24', 17),
(86, 19, 'Salida', 2, '2024-06-02', 9),
(87, 16, 'Entrada', 3, '2024-07-15', 22),
(88, 3, 'Salida', 4, '2024-08-19', 13),
(89, 23, 'Entrada', 1, '2024-09-13', 11),
(90, 31, 'Salida', 2, '2024-10-22', 15),
(91, 18, 'Entrada', 3, '2024-11-01', 14),
(92, 39, 'Salida', 4, '2024-12-17', 12),
(93, 9, 'Entrada', 5, '2024-01-25', 8),
(94, 47, 'Salida', 1, '2024-02-20', 13),
(95, 33, 'Entrada', 2, '2024-03-12', 7),
(96, 49, 'Salida', 3, '2024-04-30', 22),
(97, 11, 'Entrada', 4, '2024-05-06', 18),
(98, 41, 'Salida', 2, '2024-06-25', 10),
(99, 30, 'Entrada', 5, '2024-07-30', 5),
(100, 40, 'Salida', 1, '2024-08-23', 27);
