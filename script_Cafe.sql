USE [cafe]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
	[size] [char](5) NULL,
	[topping_id] [int] NULL,
	[isBawaTumblr] [bit] NULL,
	[quantity] [int] NOT NULL,
	[harga_total_per_item] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderXTransaksi]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderXTransaksi](
	[nomor_transaksi] [int] NOT NULL,
	[tanggal_transaksi] [date] NOT NULL,
	[order_id] [int] NOT NULL,
	[harga_item_qty] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nomor_transaksi] ASC,
	[tanggal_transaksi] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelanggan]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelanggan](
	[id_pelanggan] [int] NOT NULL,
	[nama_pelanggan] [char](50) NOT NULL,
	[point] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[size] [char](5) NOT NULL,
	[harga] [decimal](18, 0) NOT NULL,
	[volume] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Menu]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Menu](
	[menu_id] [int] NOT NULL,
	[nama_menu] [char](50) NOT NULL,
	[deskripsi] [char](300) NULL,
	[harga] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Table_Menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[topping_id] [int] NOT NULL,
	[nama_topping] [char](50) NOT NULL,
	[deskripsi] [char](300) NULL,
	[harga] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 4/26/2021 3:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[nomor_transaksi] [int] NOT NULL,
	[tanggal_transaksi] [date] NOT NULL,
	[id_pelanggan] [int] NOT NULL,
	[total_harga] [decimal](18, 0) NOT NULL,
	[total_pajak] [decimal](18, 0) NOT NULL,
	[total_bayar] [decimal](18, 0) NOT NULL,
	[penambahan_point] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nomor_transaksi] ASC,
	[tanggal_transaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([menu_id])
REFERENCES [dbo].[Table_Menu] ([menu_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([size])
REFERENCES [dbo].[Size] ([size])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([topping_id])
REFERENCES [dbo].[Topping] ([topping_id])
GO
ALTER TABLE [dbo].[OrderXTransaksi]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderXTransaksi]  WITH CHECK ADD FOREIGN KEY([nomor_transaksi], [tanggal_transaksi])
REFERENCES [dbo].[Transaksi] ([nomor_transaksi], [tanggal_transaksi])
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD FOREIGN KEY([id_pelanggan])
REFERENCES [dbo].[Pelanggan] ([id_pelanggan])
GO
