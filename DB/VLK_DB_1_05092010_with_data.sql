USE [VLK_DB_1]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](255) NOT NULL,
	[Password] [text] NOT NULL,
	[NickName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[SecondName] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[Patronymic] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](255) NOT NULL,
	[Photo] [nvarchar](255) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (1, N'moshkov.s.a', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'MoshkovSA', N'moshkov.sergey@gmail.com', N'Мошков', N'Сергей', N'Александрович', N'Admin', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (2, N'strongin.r.g', N'5GOaEHnZ2Gsbs1o1g5vY9n9mjRkLFe4hKKw=', N'StronginRG', N'strongin.r.g@unn.ru', N'Стронгин', N'Роман', N'Григорьевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (3, N'gergel.v.p', N'V4wWVqkV5gYBsS1hSbkWYQEZ+oOEnVA1cA==', N'GergelVP', N'gergel.v.p@unn.ru', N'Гергель', N'Виктор', N'Павлович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (4, N'ketkov.yu.l', N'ueTZgPZjBr+eMjN1ctT9Duu3JEweaQyEXePu', N'KetkovYUL', N'ketkov.yu.l@unn.ru', N'Кетков', N'Юлий', N'Лазаревич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (5, N'sergeev.ya.d', N'NM/28tOUxYihXdsNeh2MXk/gOihGukuHbA==', N'SergeevYAD', N'sergeev.ya.d@unn.ru', N'Сергеев', N'Ярослав', N'Дмитриевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (6, N'shvecov.v.i', N'P1Fz1EChByk43mWTeWSARaUzgjonxoBgUd0=', N'ShvecovVI', N'shvecov.v.i@unn.ru', N'Швецов', N'Владимир', N'Иванович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (7, N'turlapov.v.e', N'LPapNy0MJxPxNExj7tO3BjlG5tEBLZ5x', N'TurlapovVE', N'turlapov.v.e@unn.ru', N'Турлапов', N'Вадим', N'Евгеньевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (8, N'barkalov_.a.v', N'/uenV7FbGoDrY3ZVO2UogWcxj+Xs+N4nems=', N'Barkalov_AV', N'barkalov_.a.v@unn.ru', N'Баркалов ', N'Александр', N'Валентинович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (9, N'grishagin.v.a', N'YGaBl7YMgKwM4pdGPteyljf1f3a5+yAd6LsT', N'GrishaginVA', N'grishagin.v.a@unn.ru', N'Гришагин', N'Владимир', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (10, N'karpenko.s.n', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KarpenkoSN', N'karpenko.s.n@unn.ru', N'Карпенко', N'Сергей', N'Николаевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (11, N'meerov.i.b', N'6QZc/QlzmxIZOJA2ywXf9Ei1ohuwTTK7aA8=', N'MeerovIB', N'meerov.i.b@unn.ru', N'Мееров', N'Иосиф', N'Борисович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (12, N'yunakovskij.a.d', N'YNXH0yWBFV50DBkly6XazfhroBH4aAZQEg==', N'YunakovskijAD', N'yunakovskij.a.d@unn.ru', N'Юнаковский', N'Алексей ', N'Дмитриевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (13, N'bogolepov.d.k', N'gqu6jrIxyZ20AqqQ5GcWnm/L2dpA8/ZXgA==', N'BogolepovDK', N'bogolepov.d.k@unn.ru', N'Боголепов', N'Денис', N'Константинович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (14, N'labutin.d.yu', N'G1jA5hxFY1JElCv9aQQq/Qzc+WiZxH5hoq0S', N'LabutinDYU', N'labutin.d.yu@unn.ru', N'Лабутин', N'Дмитрий', N'Юрьевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (15, N'svistunov.a.n', N'+hhWcNXUAsl5ruSdTnA9gAWwQwHZ6M8i', N'SvistunovAN', N'svistunov.a.n@unn.ru', N'Свистунов', N'Алексей', N'Николаевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (16, N'sidnev.a.a', N'1pml6D8evqHKuMFoGbNtSX4HWbV5+DgKyg==', N'SidnevAA', N'sidnev.a.a@unn.ru', N'Сиднев', N'Алексей', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (17, N'sysoev.a.v', N'zxFVRRJxU3uNBsRb0+GOWJfZm1mHIA64VLE=', N'SysoevAV', N'sysoev.a.v@unn.ru', N'Сысоев', N'Александр', N'Владимирович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (18, N'shestakova.n.v', N'2Pop97yeSehTxN3PktefNBpzRFqwH5P0+8hf', N'ShestakovaNV', N'shestakova.n.v@unn.ru', N'Шестакова', N'Наталья', N'Валерьевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (19, N'barkalov.k.a', N'cXs6+KeAguQkwNliZM+g/3bXHurSA8M/WCiU', N'BarkalovKA', N'barkalov.k.a@unn.ru', N'Баркалов', N'Константин', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (20, N'alekseev.v.e', N'AS7eulobPHSb/dhb9uFsR0Y6mrRJz0JBmOY=', N'AlekseevVE', N'alekseev.v.e@unn.ru', N'Алексеев', N'Владимир', N'Евгеньевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (21, N'talanov.v.a', N'AagiWed8FvHGhnBH/vIQMjQKvDybgEUxilQ=', N'TalanovVA', N'talanov.v.a@unn.ru', N'Таланов', N'Владимир', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (22, N'zaxarova.d.v', N'uUlAvvA7NaSNIvwKPwIWa/noNm5Q/ET4YA==', N'ZaxarovaDV', N'zaxarova.d.v@unn.ru', N'Захарова', N'Дарья', N'Владимировна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (23, N'zhilcova.l.p', N'9nonSR/stPLN9GJUrHm9fQHMSZZT6FgfENU=', N'ZhilcovaLP', N'zhilcova.l.p@unn.ru', N'Жильцова', N'Лариса', N'Павловна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (24, N'shashkov.v.m', N'6DNXhrc+cHfetkahMwbfGgiPkF+oiwyI', N'ShashkovVM', N'shashkov.v.m@unn.ru', N'Шашков', N'Всеволод', N'Михайлович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (25, N'krotov.n.v', N'2ZLvZWEClxAvSBRvzGpLnZ+WFLLmSfgZ', N'KrotovNV', N'krotov.n.v@unn.ru', N'Кротов', N'Н', N'В', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (26, N'fokina.v.n', N'OkluOTQ7u7hIaKIUNuEtT9lb+JZwRS+kA/jC', N'FokinaVN', N'fokina.v.n@unn.ru', N'Фокина', N'Валентина', N'Николаевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (27, N'egamov.a.i', N'nIvaib2GHqhjwSL+PEJJFH/OG5UBBAZ4XA==', N'EgamovAI', N'egamov.a.i@unn.ru', N'Эгамов', N'Альберт', N'Исмаилович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (28, N'abramov.d.a', N'pGaPcpe4+moMEhfuLI/irvG9no6Yunl0OFdC', N'AbramovDA', N'abramov.d.a@unn.ru', N'Абрамов', N'Дмитрий', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (29, N'anoshina.e.d', N'mrdAoibTRw5QtTDxRCtg2Q4h8oV1PQEl8IG1', N'AnoshinaED', N'anoshina.e.d@unn.ru', N'Аношина', N'Елена', N'Дмитриевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (30, N'belov.s.yu', N'Salk7BtRh7CFaWDWoONKzL8/9aYFrpw1OY+2', N'BelovSYU', N'belov.s.yu@unn.ru', N'Белов', N'Сергей', N'Юрьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (31, N'bragina.e.o', N'nlhlwXPvpEYZgKj29A50Ty1vs6x42dczszA=', N'BraginaEO', N'bragina.e.o@unn.ru', N'Брагина', N'Екатерина', N'Олеговна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (32, N'brezhneva.s.e', N'dhbu9ex6ox23+4m+cj8Rp7o3MpjqGsBIVQk=', N'BrezhnevaSE', N'brezhneva.s.e@unn.ru', N'Брежнева', N'Светлана', N'Эдуардовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (33, N'vologin.m.p', N'coTnXKbUswKLmP1bIkc3nnttjuC7i7GexA==', N'VologinMP', N'vologin.m.p@unn.ru', N'Вологин', N'Максим', N'Павлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (34, N'gladyshev.d.a', N'jLzrCHjWgbU4w53EonqkcKu1vJhkEolkYcTz', N'GladyshevDA', N'gladyshev.d.a@unn.ru', N'Гладышев', N'Дмитрий', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (35, N'zharkov.e.v', N'z8dxWgEvytP4c+0b7IZrEUY7QuF1WKZRlg==', N'ZharkovEV', N'zharkov.e.v@unn.ru', N'Жарков', N'Евгений', N'Викторович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (36, N'kalyakin.r.m', N'gLhiY/AWob7/YZmhCcBpRmynns0orxl2dic=', N'KalyakinRM', N'kalyakin.r.m@unn.ru', N'Калякин', N'Роман', N'Михайлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (37, N'kashina.e.a', N'u5x7HZ4kd7ZAXaMcua+yvZEQHZtYRhRr', N'KashinaEA', N'kashina.e.a@unn.ru', N'Кашина', N'Евгения', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (38, N'kiselev.s.a', N'95uWCUrkaYb/7IBS2JZZHtqaXe9V1+H9', N'KiselevSA', N'kiselev.s.a@unn.ru', N'Киселев', N'Сергей', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (39, N'kotov.a.m', N'TtNgOWqW/A9MelpZUlzxUyBAn46iqpxQvBg=', N'KotovAM', N'kotov.a.m@unn.ru', N'Котов', N'Александр', N'Михайлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (40, N'kuznecova.k.r', N'3UzrnrU6TiRwXL2n0d/He7hrpHq572sh', N'KuznecovaKR', N'kuznecova.k.r@unn.ru', N'Кузнецова', N'Кира', N'Романовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (41, N'lapshin.a.v', N't9e3rfY6795wYNYawjRmyeeww7+V3sSvEw==', N'LapshinAV', N'lapshin.a.v@unn.ru', N'Лапшин', N'Артём', N'Викторович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (42, N'malinkin.i.k', N'ZtU+U5/NM/YgdtC2enScSQKWhIW74znkz0sl', N'MalinkinIK', N'malinkin.i.k@unn.ru', N'Малинкин', N'Илья', N'Константинович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (43, N'nagornov.r.s', N'6yDZRpahn9zVoq2kzivh2bF8U13UjQ3BUg==', N'NagornovRS', N'nagornov.r.s@unn.ru', N'Нагорнов', N'Роман', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (44, N'nikolaev.n.v', N'h/KBBxk08aRn1XFfTNVhIw5CkJLtSQM1gmE=', N'NikolaevNV', N'nikolaev.n.v@unn.ru', N'Николаев', N'Никита', N'Владиславович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (45, N'nozdrin.s.a', N'uFZFjIu1rKqkS1itwdVnUbuE2nMQMnFI', N'NozdrinSA', N'nozdrin.s.a@unn.ru', N'Ноздрин', N'Сергей ', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (46, N'piruyan.o.i', N'9X8/WVWCiTe6eGcvDBP+er4dK33VIKRw', N'PiruyanOI', N'piruyan.o.i@unn.ru', N'Пируян', N'Олег', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (47, N'polyakov.d.s', N'J7IftxfHqCE4ogAGygHqxykBEoOgukhS729g', N'PolyakovDS', N'polyakov.d.s@unn.ru', N'Поляков', N'Даниил', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (48, N'spicyn.s.a', N'FgaN06Qcq0QwSM2DMlIfEg9UNcPXGFqxGA==', N'SpicynSA', N'spicyn.s.a@unn.ru', N'Спицын', N'Сергей', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (49, N'syainova.d.t', N'u5qsRTE7Q3hA6BPmC4sNWQRYgqhQtcbCiSs=', N'SyainovaDT', N'syainova.d.t@unn.ru', N'Сяинова', N'Диана', N'Тагировна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (50, N'shalaeva.t.b', N'7QrPqOU8Mnt4QgEVosGRqzUewAOaDBr2', N'ShalaevaTB', N'shalaeva.t.b@unn.ru', N'Шалаева', N'Татьяна', N'Борисовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (51, N'shalaeva.o.b', N'qePQXVFRwkME3MF0JhQO3wp3A1db6+H0uQ==', N'ShalaevaOB', N'shalaeva.o.b@unn.ru', N'Шалаева', N'Ольга', N'Борисовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (52, N'shishkin.a.m', N'yrjs/M1cF7wkN694OcaxyX9m0jJKsqq9HuEy', N'ShishkinAM', N'shishkin.a.m@unn.ru', N'Шишкин', N'Александр', N'Михайлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (53, N'yatnov.e.s', N'hF0Rsq9oHFRuvPaFQiOI7rgQ4d68o4c4', N'YatnovES', N'yatnov.e.s@unn.ru', N'Ятнов', N'Егор', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (54, N'avdeev_.a.d', N'UyGqVYg65b+9CgqwHsXZDyXZO38Or1SPyzM=', N'Avdeev_AD', N'avdeev_.a.d@unn.ru', N'Авдеев ', N'Алексей', N'Дмитриевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (55, N'vigriyanov.p.f', N'XozB8i/nDnc9txUHedqKrZ64vsxdMesmdzgj', N'VigriyanovPF', N'vigriyanov.p.f@unn.ru', N'Вигриянов', N'Павел', N'Федорович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (56, N'grachev.a.v', N'ieipIIZbM6xsN4st0uOh5vgGfO5s3RRRJEfm', N'GrachevAV', N'grachev.a.v@unn.ru', N'Грачев', N'Андрей', N'Викторович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (57, N'kolpakova.m.v', N'ALl7JkxjCZJDASmqKUk9bQs7NvDQurq21BI=', N'KolpakovaMV', N'kolpakova.m.v@unn.ru', N'Колпакова', N'Марина', N'Валентиновна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (58, N'korotkova.n.o', N'U4EEXqUi3xveIlcqEl17zJ8yjNOedDJSiFY=', N'KorotkovaNO', N'korotkova.n.o@unn.ru', N'Короткова', N'Наталья', N'Олеговна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (59, N'kukaeva._.a', N'uJ0dzyQaHBA6oejJrYExZMu0F46pxg1eyfc=', N'Kukaeva_A', N'kukaeva._.a@unn.ru', N'Кукаева', N' Светлана', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (60, N'lyulkova.e.e', N'EqOVcGx2eyz2xTE0hxzW88xzl/lx/nJo', N'LyulkovaEE', N'lyulkova.e.e@unn.ru', N'Люлькова', N'Елена', N'Евгеньевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (61, N'matveichev.d.s', N'oMB2LKpA0j/KysYQt34YsrtzF7C64MZu', N'MatveichevDS', N'matveichev.d.s@unn.ru', N'Матвеичев', N'Дмитрий', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (62, N'morozova.m.v', N'crTLRQG6hipLqioIvf9LciBf+1QdWswSQfOp', N'MorozovaMV', N'morozova.m.v@unn.ru', N'Морозова', N'Мария', N'Владимировна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (63, N'panina.e.a', N'07tDAR38xIlID8AMwwXBDSAqKh7Qgdu9WA==', N'PaninaEA', N'panina.e.a@unn.ru', N'Панина', N'Екатерина', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (64, N'pushkova.o.e', N'ganbZYABs3MdHMyTwo5e1KAHmd8WrAUuCmuL', N'PushkovaOE', N'pushkova.o.e@unn.ru', N'Пушкова', N'Ольга', N'Евгеньевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (65, N'smirnov.f.g', N'FBvwfSSJPsCH/qBcAk+mffnZo2D7PqTV', N'SmirnovFG', N'smirnov.f.g@unn.ru', N'Смирнов', N'Филипп', N'Георгиевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (66, N'solomin.s.n', N'TwtWgA68JKHplTb9RpkmBtPjUprFhoiUi0U=', N'SolominSN', N'solomin.s.n@unn.ru', N'Соломин', N'Сергей', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (67, N'udalova.t.i', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'UdalovaTI', N'udalova.t.i@unn.ru', N'Удалова', N'Татьяна', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (68, N'xazimov.ya.t', N'Zx95omgYdqiuo8vM2JWctqetAwouA2spnw==', N'XazimovYAT', N'xazimov.ya.t@unn.ru', N'Хазимов', N'Ян', N'Тагирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (69, N'xazimova.ya.t', N'qaILYNRE1HL5sEwCb8VeAPlirVlkFNjW+CI=', N'XazimovaYAT', N'xazimova.ya.t@unn.ru', N'Хазимова', N'Яна', N'Тагировна', N'Student', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationPlan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_EducationPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EducationPlan] ON
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (1, N'Бакалавриат', N'Bakalavriat')
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (2, N'Специалитет', N'Specialitet')
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (3, N'Магистратура', N'Magistratura')
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (4, N'Отсутствует', N'Otsutstvuet')
SET IDENTITY_INSERT [dbo].[EducationPlan] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT [dbo].[Departments] ([Id], [Alias], [Title], [Abbreviation], [Description]) VALUES (1, N'VMK', N'Вычислительной математики и кибернетики', N'ВМК', NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
/****** Object:  Table [dbo].[Specialities]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_specialities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Specialities] ON
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (1, 1, N'Информационные технологии', N'IT', N'ИТ', N'010400.68')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (2, 1, N'Прикладная математика и информатика', N'PMI', N'ПМИ', N'010400.61')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (3, 1, N'Прикладная информатика', N'PI', N'ПИ', N'010400.64')
SET IDENTITY_INSERT [dbo].[Specialities] OFF
/****** Object:  Table [dbo].[Chairs]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chairs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_chairs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chairs] ON
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (1, 1, N'Отсутствует', N'Отсутствует', N'Otsutstvuet', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (2, 1, N'Кафедра теории управления и динамики машин', N'ТУДМ', N'TUDM', N'<a href="http://www.unn.ru/">Сайт кафедры</a>')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (3, 1, N'Кафедра численного и функционального анализа', N'ЧиФА', N'CHiFA', N'<a href="http://www.unn.ru/">Сайт кафедры</a>')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (4, 1, N'Кафедра математической логики и высшей алгебры', N'МЛиВА', N'MLiVA', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (5, 1, N'Кафедра прикладной математики', N'ПМ', N'PM', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (6, 1, N'Кафедра математического обеспечения ЭВМ', N'МОЭВМ', N'MOEVM', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (7, 1, N'Кафедра информатики и автоматизации научных исследований', N'ИАНИ', N'IANI', N'<a href="http://www.unn.ru/">Сайт кафедры</a>')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (8, 1, N'Кафедра прикладной теории вероятностей', N'ПТВ', N'PTV', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (9, 1, N'Кафедра интеллектуальных информационных систем и геоинформатики', N'ИИСГео', N'IISGeo', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (10, 1, N'Центр прикладной информатики', N'ЦПИ', N'CPI', NULL)
SET IDENTITY_INSERT [dbo].[Chairs] OFF
/****** Object:  Table [dbo].[Professors]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[UserId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[Degree] [nvarchar](255) NOT NULL,
	[Position] [nvarchar](255) NOT NULL,
	[About] [text] NULL,
	[Rank] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Professors_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (2, 6, N'д.ф.-м.н.', N'проф.', N'<a href="http://www.unn.ru/">Сайт преподавателя</a>', N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (3, 6, N'д.т.н.', N'проф.', N'<a href="http://www.unn.ru/">Сайт преподавателя</a>', N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (4, 6, N'д.т.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (5, 6, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (6, 6, N'д.т.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (7, 6, N'д.т.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (8, 6, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (9, 6, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (10, 6, N'к.т.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (11, 6, N'к.т.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (12, 6, N' ', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (13, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (14, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (15, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (16, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (17, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (18, 6, N' ', N'acc.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (19, 6, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (20, 4, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (21, 4, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (22, 4, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (23, 4, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (24, 3, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (25, 3, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (26, 3, N' ', N'ст.преп.', NULL, N' ')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (27, 3, N' ', N'ст.преп.', NULL, N' ')
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplines](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[EducationPlanId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] ON
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation]) VALUES (1, 1, 3, 1, N'PI', N'Программная инженерия', N':Федеральный компонент', N'324а', N'ПИ')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation]) VALUES (2, 1, 3, 1, N'YAP', N'Языки программирования', N':Федеральный компонент', N'986п6', N'ЯП')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation]) VALUES (3, 1, 3, 1, N'OI', N'Обработка изображений', N':дисциплины специализации по кафедре МОЭВМ', N'5654е', N'ОИ')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation]) VALUES (4, 1, 3, 1, N'TSIiliORO', N'Технологии сети Интернет  или  Объектная распределенная обработка', N':дисциплины специализации по кафедре МОЭВМ', N'ое532а', N'ТСИилиОРО')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation]) VALUES (5, 1, 3, 1, N'OS_UNIX', N'Операционная система UNIX', N':дисциплины специализации по кафедре МОЭВМ', N'ht4', N'ОС UNIX')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[EducationPlanId] [bigint] NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_specializations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (1, 1, 6, 3, N'IPO', N'Инженерия программного обеспечения', N'ИПО', N'511921')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (2, 1, 6, 4, N'OtsutstvuetMOEVMIT', N'ОтсутствуетМОЭВМИТ', N'ОтсутствуетМОЭВМИТ', N'ОтсутствуетМОЭВМИТ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (3, 1, 6, 3, N'KG', N'Компьютерная графика', N'КГ', N'511908')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (4, 1, 4, 3, N'KN', N'Компьютерные науки', N'КН', N' ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (5, 1, 4, 4, N'OtsutstvuetMLiVAIT', N'ОтсутствуетМЛиВАИТ', N'ОтсутствуетМЛиВАИТ', N'ОтсутствуетМЛиВАИТ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (6, 1, 1, 4, N'OtsutstvuetOtsutstvuetIT', N'ОтсутствуетОтсутствуетИТ', N'ОтсутствуетОтсутствуетИТ', N'ОтсутствуетОтсутствуетИТ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (7, 2, 1, 4, N'OtsutstvuetOtsutstvuetPMI', N'ОтсутствуетОтсутствуетПМИ', N'ОтсутствуетОтсутствуетПМИ', N'ОтсутствуетОтсутствуетПМИ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (8, 3, 1, 4, N'OtsutstvuetOtsutstvuetPI', N'ОтсутствуетОтсутствуетПИ', N'ОтсутствуетОтсутствуетПИ', N'ОтсутствуетОтсутствуетПИ')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
/****** Object:  Table [dbo].[Groups]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Groups] ON
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (1, 1, 1, N'8112', N'8112')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (2, 1, 1, N'8113', N'8113')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (3, 1, 1, N'8212', N'8212')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (4, 1, 1, N'8213', N'8213')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (5, 1, 1, N'A8216', N'А8216')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (6, 1, 1, N'8309', N'8309')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (7, 1, 1, N'8310', N'8310')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (8, 2, 1, N'8101', N'8101')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (9, 2, 1, N'8102', N'8102')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (10, 2, 1, N'8103', N'8103')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (11, 2, 1, N'8104', N'8104')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (12, 2, 1, N'8105', N'8105')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (13, 2, 1, N'8201', N'8201')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (14, 2, 1, N'8202', N'8202')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (15, 2, 1, N'8203', N'8203')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (16, 2, 1, N'8204', N'8204')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (17, 2, 1, N'8205', N'8205')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (18, 1, 1, N'8409', N'8409')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (19, 1, 1, N'8410', N'8410')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (20, 1, 1, N'8411', N'8411')
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticeAndLabTimetables](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecializationId] [bigint] NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
	[Day] [nvarchar](255) NOT NULL,
	[Time] [nvarchar](255) NOT NULL,
	[Building] [smallint] NOT NULL,
	[Room] [smallint] NOT NULL,
	[Week] [nvarchar](64) NOT NULL,
	[Type] [nvarchar](64) NOT NULL,
	[Part] [nvarchar](255) NULL,
 CONSTRAINT [PK_practices_and_labs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PracticeAndLabTimetables] ON
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (1, 6, 1, 18, 10, N'Среда', N'18:00', 6, 502, N'Верхняя', N'Практика', NULL)
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (2, 6, 1, 19, 10, N'Среда', N'18:00', 6, 514, N'Нижняя', N'Практика', N'МЛИВА')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (3, 6, 1, 19, 10, N'Суббота', N'14:40', 6, 514, N'Каждая', N'Практика', N'МОЭВМ')
SET IDENTITY_INSERT [dbo].[PracticeAndLabTimetables] OFF
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureTimetables](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
	[Day] [nvarchar](255) NOT NULL,
	[Time] [nvarchar](64) NOT NULL,
	[Building] [smallint] NOT NULL,
	[Room] [smallint] NOT NULL,
	[Week] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_lectures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LectureTimetables] ON
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (1, 1, 10, N'Суббота', N'13:00', 2, 324, N'Каждая')
SET IDENTITY_INSERT [dbo].[LectureTimetables] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplineTopics](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SpecialityDisciplineTopics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] ON
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (1, 1, N'Введение в программную инженерию ::: Предпосылки и история')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (2, 1, N'Введение в программную инженерию ::: Программная инженерия – что это такое?')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (3, 1, N'Введение в программную инженерию ::: Стандартизация и стандарты')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (4, 1, N'Жизненный цикл программного продукта ::: Понятие жизненного цикла программного продукта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (5, 1, N'Жизненный цикл программного продукта ::: Определение жизненного цикла программного продукта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (6, 1, N'Жизненный цикл программного продукта ::: Модель жизненного цикла программного продукта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (7, 1, N'Управление программным проектом  ::: Немного философии (понятия и определения)')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (8, 1, N'Управление программным проектом  ::: Что должен знать менеджер проекта?')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (9, 1, N'Управление программным проектом  ::: Управление командой проекта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (10, 1, N'Управление программным проектом  ::: Планирование и контроль')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (11, 1, N'Управление программным проектом  ::: Средства управления проектом')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (12, 1, N'Управление качеством ИТ проекта  ::: Качество и управление качеством (экскурс в историю) ')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (13, 1, N'Управление качеством ИТ проекта  ::: ISO9000: система управления качеством')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (14, 1, N'Управление качеством ИТ проекта  ::: ISO12207: процесс управления качеством ПО')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (15, 1, N'Управление качеством ИТ проекта  ::: CMM: уровни зрелости процессов')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (16, 1, N'Управление качеством ИТ проекта  ::: ISO15504: аттестация, определение зрелости и усовершенствование процессов')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (17, 1, N'CMMI – интегрированная модель возможности и зрелости процесса  ::: Что такое модель зрелости?')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (18, 1, N'CMMI – интегрированная модель возможности и зрелости процесса  ::: Из чего состоит CMMI?')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (19, 1, N'CMMI – интегрированная модель возможности и зрелости процесса  ::: Как работает CMMI?')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (20, 1, N'Дополнительные процессы создания ПП ::: Тестирование программного продукта ')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (21, 1, N'Дополнительные процессы создания ПП ::: Управление требованиями, изменениями и конфигурацией')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (22, 1, N'Дополнительные процессы создания ПП ::: Управление рисками ')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplineTerms](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[Term] [smallint] NOT NULL,
	[LectureVolume] [smallint] NOT NULL,
	[PracticeVolume] [smallint] NOT NULL,
	[LabVolume] [smallint] NOT NULL,
	[WeeksVolume] [smallint] NOT NULL,
	[Reporting] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SpecialityDisciplineTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] ON
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (1, 1, 5, 2, 0, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (2, 1, 7, 2, 0, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (3, 2, 3, 3, 0, 3, 18, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (4, 3, 5, 1, 1, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (5, 4, 5, 1, 1, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (6, 5, 7, 1, 1, 0, 18, N'Экзамен')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Table [dbo].[SpecialityDisciplinesProfessors]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplinesProfessors](
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
 CONSTRAINT [PK_DisciplinesProfessors] PRIMARY KEY CLUSTERED 
(
	[SpecialityDisciplineId] ASC,
	[ProfessorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (1, 10)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 3)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 7)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (4, 17)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 14)
/****** Object:  Table [dbo].[SpecialityDisciplineProgram]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplineProgram](
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[ApplicationDomain] [text] NOT NULL,
	[Purposes] [text] NOT NULL,
	[Requirements] [text] NOT NULL,
	[Volume] [text] NOT NULL,
	[Razdels] [text] NOT NULL,
	[RazdelsContent] [text] NOT NULL,
	[LabPractice] [text] NOT NULL,
	[Literature] [text] NOT NULL,
	[Questions] [text] NOT NULL,
	[MarkCriterias] [text] NOT NULL,
	[Reporting] [text] NOT NULL,
	[Additional] [text] NOT NULL,
 CONSTRAINT [PK_DisciplineProgram] PRIMARY KEY CLUSTERED 
(
	[SpecialityDisciplineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[SpecialityDisciplineProgram] ([SpecialityDisciplineId], [ApplicationDomain], [Purposes], [Requirements], [Volume], [Razdels], [RazdelsContent], [LabPractice], [Literature], [Questions], [MarkCriterias], [Reporting], [Additional]) VALUES (1, N'<p>Данная дисциплина относится к базовым дисциплинам, преподается в 1 семестре.</p>', N'<p>Цель курса состоит в том, чтобы дать магистрантам представление об основах программной инженерии, инженерных принципах создания программного обеспечения, процессах жизненного цикла ПО, основных стандартах в области разработки ПО. Особое внимание в курсе уделяется вопросам качества процесса разработки ПО. Рассматриваются ведущие стандарты в этой области.<br/> При разработке материалов курса использовались рекомендации образовательного стандарта IEEE/ACM Computing Curricula 2001: Software Engineering.</p>', N'<p>В результате изучения магистранты должны: <br /> Иметь представление о программном продукте (ПП) как специальном виде ПО, жизненном цикле ПП как основы промышленного производства ПО, применяемых моделях жизненного цикла ПП. <br/>Знать процессы жизненного цикла ПП и основные стандарты процессов жизненного цикла; принципы спецификации, управления и усовершенствования процессов. <br/>Понимать основные принципы управления ИТ проектом, управления качеством продукта и качеством процесса. </p>', N'<p>
		<table>
		<thead>
			<tr>
				<td>Виды учебной работы</td>
				<td>Всего часов</td>
				<td>Семестры</td>
			</tr>
		</thead>
		<tbody><tr><td><b>Общая трудоемкость дисциплины</b>
				</td>
				<td>68
				</td>
				<td>1
				</td>
			</tr>
			<tr>
				<td>Аудиторные занятия
				</td>
				<td>36
				</td>
				<td>36
				</td>
			</tr>
			<tr>
				<td>Практические занятия (ПЗ)
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Семинары (С)
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Лабораторные работы (ЛР)
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Другие виды аудиторных занятий
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Самостоятельная работа
				</td>
				<td>32
				</td>
				<td>32
				</td>
			</tr>
			<tr>
				<td>Курсовой проект (работа)
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Расчетно-графическая работа
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Реферат
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Другие виды самостоятельной работы
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>Вид итогового контроля (зачет, экзамен)
				</td>
				<td>
				</td>
				<td>экзамен
				</td>
			</tr>
		</tbody>
		</table><br/>
		<i>(в первой графе таблицы указываются виды аудиторных работ и самостоятельных занятий студентов. Во второй графе указывается общая трудоемкость дисциплины в часах в соответствии с ГОС ВПО, объем аудиторных и объем самостоятельных занятий - в соответствии с примерным учебным планом. В третьей графе указываются номера семестров, в которых предусматривается каждый вид учебной работы и вид итогового контроля по дисциплине)<br/>Выше обозначенная таблица составляется отдельно для каждой из форм обучения, предусмотренных учебным планом.</i>
		</p>', N'<p><i>(допускается название п.4.1. «Тематический план»)</i></p>
		<p>
		<table>
			<thead>
				<tr>
					<td>№п/п
					</td>
					<td>Раздел дисциплины
					</td>
					<td>Лекции
					</td>
					<td>ПЗ (или С)
					</td>
					<td>ЛР
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1.
					</td>
					<td><i>Введение в программную инженерию</i>
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2.
					</td>
					<td><i>Жизненный цикл программного продукта</i>
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3.
					</td>
					<td><i>Управление программным проектом</i> 
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4.
					</td>
					<td><i>Управление качеством ИТ проекта</i>
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>5.
					</td>
					<td><i>CMMI – интегрированная модель возможности и зрелости процесса</i>
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6.
					</td>
					<td><i>Дополнительные процессы создания ПП</i>
					</td>
					<td>*
					</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table><br/>
		<i>(в таблице название раздела указывается в соответствии с обязательным минимумом содержания, изложенным в ГОС ВПО. В графах, обозначающих предусматриваемые виды занятий проставляется знак *)</i>
		</p>', N'<p><i> (указывается название каждого раздела и его содержание)</i></p>', N'<p>
		<table>
			<thead>
				<tr>
				<td>№п/п</td>
				<td>№ раздела дисциплины</td>
				<td>Наименование лабораторных работ</td>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				</tr>
				<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				</tr>
			</tbody>
		</table><br/>
		<i>(в случае, если лабораторный практикум не предусматривается в п.5 делается запись - «не предусмотрен»)</i>
		</p>', N'<p>а) основная литература:<br/>
		<ol>
			<li>	Соммервилл И. Инженерия программного обеспечения, 6-е изд.:      Пер. с англ. – М.:Вильямс, 2002</li>
			<li>	Шафер Д, Фатрел Р, Шафер Л. Управление программными проектами: достижение оптимального качества при минимуме затрат.: Пер. с англ. - М.: Вильямс., 2003. - 1136с.</li>
		</ol>
		</p>
		<p>б) дополнительная литература:<br/>
		<ol>
			<li>Билл Куртис, Марк Паулк, Мэри Бет Хриссис. Модель зрелости процессов разработки программного обеспечения. Интерфейс-Пресс. 2003 г. • 400 стр.</li>
			<li>Оценка и аттестация зрелости процессов создания и сопровождения программных средств и информационных систем (ISO/IEC TR 15504) ISBN: 5-212-00884-0/ Изд: АйТи, Книга и бизнес.</li>
			<li>Карл Чатфилд, Тимоти Джонсон. Microsoft Office Project 2003. Шаг за шагом. Русская версия (+ CD-ROM). Из-во: Эком, 2005 г. 576 с.</li>
			<li>Курсы по Project. http://office.microsoft.com/ru-ru/training/CR061832711049.aspx</li>
			<li>Константин Л. Человеческий фактор в программировании. - Пер. с англ. - СПб: Символ-Плюс, 2004. - 384 с. (стр. 77-112)</li>
			<li>Салливан Эд. Время – деньги. Создание команды разработчиков программного обеспечения/ Пер.с англ. – М.: Русская редакция, 2002. – 364с.</li>
			<li>Алистэр Коуберн. Люди как нелинейные и наиболее важные компоненты в создании программного обеспечения. Сайт: http://www.rsdn.ru/ , раздел "Статьи", подраздел "Методологии разработки ПО"</li>
			<li>Филип Лапланте. Человеческий фактор в управлении ИТ-проектом. http://www.info-system.ru/pj_managment/article/pj_people_factor.html</li>
			<li>Обзор инструментов управления проектами  http://www.projectmanagement.ru/tools/index.html </li>
			<li>Средства автоматизированного тестирования приложений. http://www.interface.ru/misc/testpril.htm</li>
			<li>Лапыгин Д.В.  Конфигурационное управление ПО и стандарты предприятия http://www.fostas.ru/library/Lapygin3_e3.rtf</li>
			<li>Сергей Панащук. Системы управления требованиями Журнал "Директор ИС", #06, 1999 год // Издательство "Открытые системы". http://www.osp.ru/cio/1999/06/02.htm</li>
			<li>ГОСТ Р ИСО/МЭК 12207-99. Процессы жизненного цикла программных средств. http://www.staratel.com/iso/InfTech/DesignPO/ISO12207/ISO12207-99/ISO12207.htm</li>
		</ol>
		</p>', N'<p>	
	<ol>
<li>Что такое программный продукт и его основные характеристики? Составляющие стоимости ПО. </li>
<li>Программная инженерия и ее отличия от информатики и других инженерий?</li>
<li>В чем еще отличие от других инженерий?</li>
<li>Программный процесс и модель программного процесса. Методы программной инженерии. Что такое CASE системы?</li>
<li>Что такое хорошая программа и ее основные свойства? Основные трудности и проблемы программной инженерии</li>
<li>Профессиональные и этические требования ИТ-специалиста. Кодекс этики IEEE-CS/ACM.</li>
<li>Технология, стандарт и сертификация. Роль стандартов в программной инженерии.</li>
<li>Основные стандарты программной инженерии и кто их разрабатывает?</li>
<li>Жизненный цикл программного продукта. Процесс, действие, задача жизненного цикла. Фазы (этапы) жизненного цикла и их связь с процессами.</li>
<li>Основные процессы жизненного цикла ПО (ISO12207 и ISO 15504)</li>
<li>Вспомогательные процессы жизненного цикла ПО (ISO12207 и ISO 15504)</li>
<li>Организационные процессы жизненного цикла ПО (ISO12207 и ISO 15504)</li>
<li>Каскадная модель ЖЦ ПО. Преимущества, недостатки, применимость</li>
<li>Спиральная модель ЖЦ ПО. Преимущества, недостатки, применимость</li>
<li>Обзор других типов моделей ЖЦ ПО</li>
<li>Особенности моделей жизненного цикла MSF, RUP, XP.</li>
<li>Что такое проект и его основные характеристики. Непроекты и их связь с проектами.</li>
<li>Управление и управление проектами. Категории управления проектами.</li>
<li>Особенности управления ИТ-проектами. Треугольник ограничений проекта.</li>
<li>PMBOK: девять областей управленческих знаний.</li>
<li>34 компетенции менеджера IT проекта..</li>
<li>Ролевая модель команды. Роли и их ответственности.</li>
<li>Модель управления командой. Критерии выбора модели.</li>
<li>Административная модель, модель хаоса, модель открытой архитектуры. Особенности, преимущества и недостатки.</li>
<li>Роль и способы общения в команде. Преимущества и недостатки различных способов общения.</li>
<li>Чем компромисс отличается от консенсуса? Как достичь компромисса и добиться  консенсуса? </li>
<li>Корпоративная политика. Типы внешних стратегий команд.</li>
<li>Что такое качество и мера качества? Какова мера качества программного продукта?</li>
<li>Основные фазы эволюции методов обеспечения качества. Роль стандартов в обеспечении качества.</li>
<li>ISO9000. 8 принципов TQM и их краткая характеристика</li>
<li>ISO9000. Состав структуры документов системы качестваv</li>
<li>ISO9000. Как работает система качества?</li>
<li>ISO12207. Процессы обеспечения качества, верификации и аттестации</li>
<li>ISO12207. Процесс усовершенствования</li>
<li>ISO12207. Связь и отличия от IOS9000</li>
<li>CMM. Кому и зачем потребовался CMM? Что такое зрелая и незрелая организации?</li>
<li>CMM. Что такое модель технологической зрелости? Основные понятия модели технологической зрелости.</li>
<li>CMM. Пять уровней зрелости модели CMM и их характеристика.</li>
<li>CMM. Группы ключевых процессов. Описание ключевых процессов группы.</li>
<li>CMM. Ключевые практики и подпрактики и их роль в применении CMM. </li>
<li>Связь CMM с ISO9000. В чем сила и слабость модели CMM? </li>
<li>ISO15504. В чем ISO15504 похож на CMM и чем они отличаются?</li>
<li>ISO15504. Эталонная и совместимая модели стандарта ISO15504.</li>
<li>ISO15504. Измерение «Процесс» эталонной модели ISO15504. </li>Классификация и типы процессов.</li>
<li>ISO15504. Измерение «Зрелость» эталонной модели ISO15504. Уровни зрелости и атрибуты.</li>
<li>ISO15504. Принципы оценки атрибутов эталонной модели. Рейтинги атрибутов.</li>
<li>ISO15504. Схема проведения и факторы успеха процесса аттестации.</li>
<li>ISO15504. Компетентность аттестаторов и схема ее подтверждения.</li>
<li>CMMI. Процесс: цели, практики и рабочие прдукты</li>
<li>CMMI. Уровни зрелости процесса</li>
<li>CMMI. Категории и области процесса</li>
<li>CMMI. Компоненты CMMI и их статус</li>
<li>CMMI. Эволюция процесса: общие цели и практики</li>
<li>CMMI. Категория Process Management: назначения областей процесса </li>
<li>CMMI. Категория Project Management: назначения областей процесса</li> 
<li>CMMI. Категория Engineering  назначения областей процесса </li>
<li>CMMI. Категория Suppot: назначения областей процесса </li>
<li>CMMI. Область процесса Organizational Training</li>
	</ol>
	<p>', N'<p>
	<table>
		<tr>
			<td>Зачтено</td>
			<td> критерии</td>
		</tr>
		<tr>
			<td>Незачтено</td>
			<td></td>
		</tr>
	</table>
	<br/>
	<u>Примечание</u> – таблица заполняется, если формой итогового контроля предусмотрен зачет
	</p>
	<p>
	<table>
		<tr>
			<td>Превосходно</td>
			<td></td>
		</tr>
		<tr>
			<td>Отлично</td>
			<td></td>
		</tr>
		<tr>
			<td>Очень хорошо</td>
			<td></td>
		</tr>
		<tr>
			<td>Хорошо</td>
			<td></td>
		</tr>
		<tr>
			<td>Удовлетворительно</td>
			<td></td>
		</tr>
		<tr>
			<td>Неудовлетворительно</td>
			<td></td>
		</tr>
		<tr>
			<td>Плохо</td>
			<td></td>
		</tr>
	</table>
	<br/>
	<u>Примечание</u> – таблица заполняется, если  формой итогового контроля предусмотрен экзамен
	</p>', N'<i>(в соответствии с рабочим учебным планом)</i>', N'<p>
	Программа составлена в соответствии с Государственным образовательным стандартом по специальности (направлению) «Информационные технологии».
	</p>
	<p>
	Автор программы____<sub><i>(подпись)</i></sub>____Карпенко С.Н.<br/>Программа рассмотрена на заседании кафедры__<sub><i>(дата)</i></sub>__ протокол № __
	</p>
	<p>
	Заведующий кафедрой ___________________ Стронгин Р.Г.<br/>
	Программа одобрена методической комиссией факультета_<sub><i>(дата)_</i></sub> протокол № __<br/>
	Председатель методической комиссии___<sub><i>(подпись)</i></sub>________ Таланов В.А.
	</p>')
/****** Object:  Table [dbo].[Students]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[UserId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[SpecializationId] [bigint] NOT NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (28, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (29, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (30, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (31, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (32, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (33, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (34, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (35, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (36, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (37, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (38, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (39, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (40, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (41, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (42, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (43, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (44, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (45, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (46, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (47, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (48, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (49, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (50, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (51, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (52, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (53, 8, 1, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (54, 6, 1, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (55, 6, 1, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (56, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (57, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (58, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (59, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (60, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (61, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (62, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (63, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (64, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (65, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (66, 6, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (67, 18, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (68, 18, 6, 2)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (69, 18, 6, 2)
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_practice_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PracticePlans] ON
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (1, 1, 1, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (2, 1, 2, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (3, 1, 3, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (4, 1, 4, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (5, 1, 5, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (6, 1, 6, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (7, 1, 7, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (8, 1, 8, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (9, 1, 9, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (10, 1, 10, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (11, 1, 11, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (12, 1, 12, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (13, 1, 13, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (14, 1, 14, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (15, 1, 15, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (16, 1, 16, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (17, 1, 17, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (18, 1, 18, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (19, 1, 19, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (20, 1, 20, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (21, 1, 21, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (22, 1, 22, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PracticePlans] OFF
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneratedTests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[VariantsCount] [int] NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
	[QuestionsCount] [int] NOT NULL,
 CONSTRAINT [PK_generated_tests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeneratedTests] ON
INSERT [dbo].[GeneratedTests] ([Id], [SpecialityDisciplineTopicId], [VariantsCount], [GeneratedDate], [QuestionsCount]) VALUES (1, 1, 3, CAST(0x00009DE8010401B3 AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[GeneratedTests] OFF
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_lecture_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LecturePlans] ON
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (2, 1, 2, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (3, 1, 3, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (4, 1, 4, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (5, 1, 5, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (6, 1, 6, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (7, 1, 7, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (8, 1, 8, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (9, 1, 9, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (10, 1, 10, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (11, 1, 11, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (12, 1, 12, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (13, 1, 13, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (14, 1, 14, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (15, 1, 15, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (16, 1, 16, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (17, 1, 17, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (18, 1, 18, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (19, 1, 19, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (20, 1, 20, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (21, 1, 21, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (22, 1, 22, NULL)
SET IDENTITY_INSERT [dbo].[LecturePlans] OFF
/****** Object:  Table [dbo].[GroupsLectureTimetables]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectureTimetables](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[LectureTimetableId] [bigint] NOT NULL,
 CONSTRAINT [PK_GroupsLectureTimetables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupsLectureTimetables] ON
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (1, 18, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (2, 19, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (3, 20, 1)
SET IDENTITY_INSERT [dbo].[GroupsLectureTimetables] OFF
/****** Object:  Table [dbo].[Razdels]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razdels](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[QuestionsCount] [int] NOT NULL,
 CONSTRAINT [PK_razdels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Razdels] ON
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (1, 1, N'введение', 2)
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (2, 1, N'общие вопросы', 2)
SET IDENTITY_INSERT [dbo].[Razdels] OFF
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneratedTestVariants](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestId] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_test_variants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeneratedTestVariants] ON
INSERT [dbo].[GeneratedTestVariants] ([Id], [GeneratedTestId]) VALUES (1, 1)
INSERT [dbo].[GeneratedTestVariants] ([Id], [GeneratedTestId]) VALUES (2, 1)
INSERT [dbo].[GeneratedTestVariants] ([Id], [GeneratedTestId]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[GeneratedTestVariants] OFF
/****** Object:  Table [dbo].[Questions]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RazdelId] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Text] [text] NOT NULL,
	[AssignedCount] [bigint] NOT NULL,
	[RightAnswersCount] [bigint] NOT NULL,
	[WrongAnswersCount] [bigint] NOT NULL,
	[DoubleGroup] [int] NOT NULL,
	[ExclusionGroup] [int] NOT NULL,
	[IsDeleted] [tinyint] NOT NULL,
	[CanCommented] [tinyint] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Questions] ON
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (1, 1, 0, N'простой', N'сколько стоит стог сена?', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (2, 1, 1, N'альтернативный', N'есть ли жизнь на марсе?', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (3, 2, 2, N'дистрибутивный', N'какие числа деляться на 5?', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (4, 2, 3, N'формула', N'<P>символ существования</P><br>Палитра для ответа: [\exists{*}]', -1, -1, -1, -1, -1, 0, 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneratedQuestions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestVariantId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeneratedQuestions] ON
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (1, 1, 1)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (2, 1, 2)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (3, 1, 3)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (4, 1, 4)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (5, 2, 1)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (6, 2, 2)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (7, 2, 3)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (8, 2, 4)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (9, 3, 1)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (10, 3, 2)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (11, 3, 3)
INSERT [dbo].[GeneratedQuestions] ([Id], [GeneratedTestVariantId], [QuestionId]) VALUES (12, 3, 4)
SET IDENTITY_INSERT [dbo].[GeneratedQuestions] OFF
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssignedTestVariants](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestVariantId] [bigint] NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
	[AssignedDateEnd] [datetime] NOT NULL,
	[State] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Mark] [int] NOT NULL,
	[Path] [text] NOT NULL,
	[StudentKey] [varchar](50) NOT NULL,
	[ProfessorKey] [varchar](50) NOT NULL,
	[PackageId] [bigint] NOT NULL,
 CONSTRAINT [PK_assigned_test_variants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Answers]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[Text] [text] NOT NULL,
	[Score] [float] NOT NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answers] ON
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (1, 1, N'10', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (2, 2, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (3, 2, N'нет', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (4, 2, N'не знаю', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (5, 3, N'5', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (6, 3, N'10', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (7, 3, N'<P>23</P>', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (8, 4, N'\exists{*}', 10)
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 09/05/2010 19:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[Text] [text] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_Groups_Specialities]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Specialities]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplinesProfessors_Professors]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplinesProfessors_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors] CHECK CONSTRAINT [FK_SpecialityDisciplinesProfessors_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors] CHECK CONSTRAINT [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineProgram_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[SpecialityDisciplineProgram]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineProgram_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineProgram] CHECK CONSTRAINT [FK_SpecialityDisciplineProgram_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_Students_Chairs]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Chairs]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Specializations]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Specializations]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_GroupsLectureTimetables_Groups]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GroupsLectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_GroupsLectureTimetables_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectureTimetables] CHECK CONSTRAINT [FK_GroupsLectureTimetables_Groups]
GO
/****** Object:  ForeignKey [FK_GroupsLectureTimetables_LectureTimetables]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GroupsLectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_GroupsLectureTimetables_LectureTimetables] FOREIGN KEY([LectureTimetableId])
REFERENCES [dbo].[LectureTimetables] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectureTimetables] CHECK CONSTRAINT [FK_GroupsLectureTimetables_LectureTimetables]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 09/05/2010 19:50:15 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
