USE [VLK_DB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/02/2010 12:57:28 ******/
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
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (7, N'pkunilov', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KunilovPE', N'pkunilov@mail.ru', N'Кунилов', N'Петр', N'Евгеньевич', N'Admin')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (17, N'karpenko.s.n', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KarpenkoSN', N'karpenko.s.n@unn.ru', N'Карпенко', N'Сергей', N'Николаевич', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (18, N'abramov.d.a', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'AbramovDA', N'abramov.d.a@unn.ru', N'Абрамов', N'Дмитрий', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (19, N'anoshina.e.d', N'psL2y6sgYoMqf0KmOlDI/sm3j1c79T8oelJN', N'AnoshinaED', N'anoshina.e.d@unn.ru', N'Аношина', N'Елена', N'Дмитриевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (20, N'belov.s.yu', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'BelovSYU', N'belov.s.yu@unn.ru', N'Белов', N'Сергей', N'Юрьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (21, N'bragina.e.o', N'wPFol25OA8K/KZYcwz9ipPuq0jtkXzjo', N'BraginaEO', N'bragina.e.o@unn.ru', N'Брагина', N'Екатерина', N'Олеговна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (22, N'brezhneva.s.e', N'lOZ8QpSSrJzF6yNxXZ+G+UlsaX3r3B2f/A==', N'BrezhnevaSE', N'brezhneva.s.e@unn.ru', N'Брежнева', N'Светлана', N'Эдуардовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (23, N'vologin.m.p', N'L26dAr8Y9P3WgwuZR/ipi3D2mxFqgMf7h0c=', N'VologinMP', N'vologin.m.p@unn.ru', N'Вологин', N'Максим', N'Павлович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (24, N'gladyshev.d.a', N'zAgL1vxV9LGxJeGXpXvAvAOhasfl7M6mJD/6', N'GladyshevDA', N'gladyshev.d.a@unn.ru', N'Гладышев', N'Дмитрий', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (25, N'zharkov.e.v', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'ZHarkovEV', N'zharkov.e.v@unn.ru', N'Жарков', N'Евгений', N'Викторович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (26, N'kalyakin.r.m', N'QVqWerKzNZFZBQoiQFySqhurHwVbVhXd', N'KalyakinRM', N'kalyakin.r.m@unn.ru', N'Калякин', N'Роман', N'Михайлович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (27, N'kashina.e.a', N'T2VYmQK4SaBz9KZ7FwG7c5wPO02phOSw', N'KashinaEA', N'kashina.e.a@unn.ru', N'Кашина', N'Евгения', N'Александровна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (28, N'kiselev.s.a', N'yq2tNYsqEYXRZeTgfDquW3kdQ0BKaYBaVA==', N'KiselevSA', N'kiselev.s.a@unn.ru', N'Киселев', N'Сергей', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (29, N'kotov.a.m', N'EH0oss0RrzrBAdtoLe7rvUcbVtzcxHmNk5s=', N'KotovAM', N'kotov.a.m@unn.ru', N'Котов', N'Александр', N'Михайлович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (30, N'kuznecova.k.r', N'HCS+5nfiQnIlOQs/o6xNeATECx0nYtqtVPXC', N'KuznecovaKR', N'kuznecova.k.r@unn.ru', N'Кузнецова', N'Кира', N'Романовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (31, N'lapshin.a.v', N'cU+RJNWkey5vx8cTdi4sYz+qRIk6ae9dbHmF', N'LapshinAV', N'lapshin.a.v@unn.ru', N'Лапшин', N'Артём', N'Викторович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (32, N'lykina.o.a', N'BIqoyFxR0sWxNBNGHpO8JtWqOiKQKIqSusHe', N'LykinaOA', N'lykina.o.a@unn.ru', N'Лыкина', N'Ольга', N'Александровна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (33, N'malinkin.i.k', N'HC7n0jYuQWfQIasUugeswtenFFj3X0vo', N'MalinkinIK', N'malinkin.i.k@unn.ru', N'Малинкин', N'Илья', N'Константинович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (34, N'nagornov.r.s', N'B0Af7gF1rr47gAT0sFYp17XfPxmRsrt7', N'NagornovRS', N'nagornov.r.s@unn.ru', N'Нагорнов', N'Роман', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (35, N'nikolaev.n.v', N'pEv/Nm//CYakN/buopZq9noIsp7agb+xFw==', N'NikolaevNV', N'nikolaev.n.v@unn.ru', N'Николаев', N'Никита', N'Владиславович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (36, N'nozdrin.s.a', N'QVWhhbTgpFS1SLS/wi1ln+5kdpY3FjczS2s=', N'NozdrinSA', N'nozdrin.s.a@unn.ru', N'Ноздрин', N'Сергей', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (37, N'piruyan.o.i', N'fEKCv4j7qyAiVV8/YtrjxedsbtgUwx88G0Y=', N'PiruyanOI', N'piruyan.o.i@unn.ru', N'Пируян', N'Олег', N'Игоревич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (38, N'polyakov.d.s', N'WmZA5OWVH0Z6XbxTkfjb6fOcrwOXMkS+HHTq', N'PolyakovDS', N'polyakov.d.s@unn.ru', N'Поляков', N'Даниил', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (39, N'spicyn.s.a', N'WFqyf3o8e8ht71VNJZig2M2OV3d/B/AvlqIl', N'SpicynSA', N'spicyn.s.a@unn.ru', N'Спицын', N'Сергей', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (40, N'syainova.d.t', N'lAK4vT4uq1FbFT+miRwgUv9GfPACdGNF', N'SyainovaDT', N'syainova.d.t@unn.ru', N'Сяинова', N'Диана', N'Тагировна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (41, N'shalaeva.t.b', N'byE0PVWy8bwJlM5Ug3ghSUolIlrhD9P2', N'SHalaevaTB', N'shalaeva.t.b@unn.ru', N'Шалаева', N'Татьяна', N'Борисовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (42, N'shalaeva.o.b', N'sq2Px3qCL8XKj0mnXuoOP0LjdGYQAi2Olg==', N'SHalaevaOB', N'shalaeva.o.b@unn.ru', N'Шалаева', N'Ольга', N'Борисовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (43, N'shishkin.a.m', N'icPg4Ur7VOaUyjCMRKY3c0wujZn3D7ay6w==', N'SHishkinAM', N'shishkin.a.m@unn.ru', N'Шишкин', N'Александр', N'Михайлович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (44, N'yatnov.e.s', N'RoV/7y35+MjdeuVAE2FmQABKgXk4HAeTjzo=', N'YAtnovES', N'yatnov.e.s@unn.ru', N'Ятнов', N'Егор', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (45, N'anisimov.v.a', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'AnisimovVA', N'anisimov.v.a@unn.ru', N'Анисимов', N'Вячеслав', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (46, N'bastrakov.i.i', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'BastrakovII', N'bastrakov.i.i@unn.ru', N'Бастраков', N'Илья', N'Иванович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (47, N'gavrilova.k.a', N'o68o3dXRk4j6aAn/9rHbu7CLHlzROhHsRnO6', N'GavrilovaKA', N'gavrilova.k.a@unn.ru', N'Гаврилова', N'Ксения', N'Андреевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (48, N'goldyaeva.a.g', N'3c3bhwB1iSySM8++kDs/AJt2Kok/rZPEzl/I', N'GoldyaevaAG', N'goldyaeva.a.g@unn.ru', N'Гольдяева', N'Анна', N'Германовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (49, N'izutov.e.o', N'QwMGHiD3IW7Jd12qtw63rZ3fLEN4R4Pk', N'IzutovEO', N'izutov.e.o@unn.ru', N'Изутов', N'Евгений', N'Олегович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (50, N'karsakov.a.s', N'vgOu1aJmGAj4ZaosI6+fZ4i5ycvuWmBEfQ==', N'KarsakovAS', N'karsakov.a.s@unn.ru', N'Карсаков', N'Александр', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (51, N'Kireev', N'0ZNqzJ3NQ9lZP+US5HDJJygVMpcEeTpMZw==', N'Kireev_201005041557575265', N'Kireev@unn.ru', N'Киреев', N'', N'Николай', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (52, N'klyan.s.a', N'KCNh4/5n+yTrMXfbhyE5Gb4aVBy8AnkGE/o=', N'KlyanSA', N'klyan.s.a@unn.ru', N'Клян', N'Софья', N'Анатольевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (53, N'kovalenko.s.o', N'CrudlZwNLr8Qp+bZ51qjht1DWckEHc8wFoU=', N'KovalenkoSO', N'kovalenko.s.o@unn.ru', N'Коваленко', N'Станислав', N'Олегович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (54, N'kotlyarova.o.v', N'gr9mIUfD3miWIMoJiIQTW8UdwkFXOr6+ruHC', N'KotlyarovaOV', N'kotlyarova.o.v@unn.ru', N'Котлярова', N'Оксана', N'Владиславовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (55, N'krylova.i.i', N'QjWG3dz+oZzFzITbtRuiGxBFtZPFByTyfKVF', N'KrylovaII', N'krylova.i.i@unn.ru', N'Крылова', N'Ирина', N'Игоревна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (56, N'kuzenkov.g.o', N'EAl4ttsSSIGmt27zD8cfKnQBmVw3cAJf', N'KuzenkovGO', N'kuzenkov.g.o@unn.ru', N'Кузенков', N'Глеб', N'Олегович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (57, N'lebedev.s.d', N'DD0yXlMu/vPsO+Cw7D3A2sTLpFEpdOIY', N'LebedevSD', N'lebedev.s.d@unn.ru', N'Лебедев', N'Сергей', N'Дмитриевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (58, N'lopatkin.k.yu', N'UnAGTDmTnjck9qLpRmTEuW16jKnrNDu6', N'LopatkinKYU', N'lopatkin.k.yu@unn.ru', N'Лопаткин', N'Константин', N'Юрьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (59, N'Losev', N'naGcefzI7bam3xXqIeFQTsk7CxAtfGpn', N'Losev_201005041557575665', N'Losev@unn.ru', N'Лосев', N'Максим', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (60, N'napylnikova.ya.a', N'cWEJ7w6E0MvkxsxFl5rHQBmoHdEjDr2ykw==', N'NapylnikovaYAA', N'napylnikova.ya.a@unn.ru', N'Напыльникова', N'Яна', N'Александровна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (61, N'ovsyuxno.a.yu', N'm9q1cbGAuPHXuE1897f1VEOwC2FZIFsThQ==', N'OvsyuxnoAYU', N'ovsyuxno.a.yu@unn.ru', N'Овсюхно', N'Андрей', N'Ювенальевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (62, N'pashko.a.i', N'OLW9W049CzSzqGJSY8VazMakjSrV8wpGt/w=', N'PashkoAI', N'pashko.a.i@unn.ru', N'Пашко', N'Алена', N'Игоревна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (63, N'Pogodin', N'r49uH+Iz3DnCSoykFRn+aH9E4b5Rn1OBZ7c=', N'Pogodin_201005041557575866', N'Pogodin@unn.ru', N'Погодин', N'Игорь', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (64, N'samarin.s.s', N'dy4k3sWraWVnt1rEt3x++PoXWlQeTzcRLO0P', N'SamarinSS', N'samarin.s.s@unn.ru', N'Самарин', N'Сергей', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (65, N'Smirnov', N'RtSX0k2dW1tazBNip8i+ZAAftnUyopyG', N'Smirnov_201005041557576066', N'Smirnov@unn.ru', N'Смирнов', N'Игорь', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (66, N'chuprova.n.v', N'n1LeBSOMTiEHQmx+Sb3g4SrGcNXIKSWe', N'CHuprovaNV', N'chuprova.n.v@unn.ru', N'Чупрова', N'Наталья', N'Владимировна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (67, N'shevchenko.n.a', N'dt3Z6Wc1axIxEmkx6ejywzuyN8SiL2i/Xg==', N'SHevchenkoNA', N'shevchenko.n.a@unn.ru', N'Шевченко', N'Никита', N'Алексеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (68, N'shivirov.a.v', N'r/Gy/w1Ya3ZcftY8tRqQ34YYOaUpFTWv5A==', N'SHivirovAV', N'shivirov.a.v@unn.ru', N'Шивиров', N'Артем', N'Викторович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (69, N'yashin.e.o', N'8l0jAnwWiWVf/W/svPZOvgArBJKT/+7da9A=', N'YAshinEO', N'yashin.e.o@unn.ru', N'Яшин', N'Евгений', N'Олегович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (70, N'artyukov.a.a', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'ArtyukovAA', N'artyukov.a.a@unn.ru', N'Артюков', N'Александр', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (71, N'baxtinov.d.s', N'390G+ZT2N/ibXiqMf/jdyvAXywG28mFM9M06', N'BaxtinovDS', N'baxtinov.d.s@unn.ru', N'Бахтинов', N'Дмитрий', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (72, N'bojko.e.a', N'rs4bcChMhUc4ouHlywS/QCWiR5HU9Gun', N'BojkoEA', N'bojko.e.a@unn.ru', N'Бойко', N'Евгений', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (73, N'Golubkin', N'r8VvQC3OUPWd8kUIFzHnNpV7JuCScYt/Zg==', N'Golubkin_201005041557576567', N'Golubkin@unn.ru', N'Голубкин', N'Максим', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (74, N'grishhenko.g.v', N'AL3eNUu3Rb9AA9pP8l2RKiaIb3x3KPqOfg==', N'GrishhenkoGV', N'grishhenko.g.v@unn.ru', N'Грищенко', N'Георгий', N'Викторович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (75, N'zhunin.a.yu', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'ZHuninAYU', N'zhunin.a.yu@unn.ru', N'Жунин', N'Алексей', N'Юрьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (76, N'zubareva.ya.s', N'OClaOmd9LuiwccEhJfngelcgF8Uv3lOhEAlq', N'ZubarevaYAS', N'zubareva.ya.s@unn.ru', N'Зубарева', N'Яна', N'Сергеевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (77, N'Katraeva', N'r/UPK4AoP4nIf/3bvM94scJ9KJZ4mqHW', N'Katraeva_201005041557576967', N'Katraeva@unn.ru', N'Катраева', N'Надежда', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (78, N'Kiselev', N'Ndw5bdDCmUf7udHpNkD9n3Z29sVIPc0KNg==', N'Kiselev_201005041557577067', N'Kiselev@unn.ru', N'Киселев', N'', N'Александр', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (79, N'Kiseleva', N'wvBK3nP1VUeTQOrRoLxg2SXTtU5+Ko86tA==', N'Kiseleva_201005041557577067', N'Kiseleva@unn.ru', N'Киселева', N'', N'Надежда', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (80, N'kozyreva.i.m', N'ShjELTzKWAMHyPigwB9oJZyMk8JBD8a0G+c=', N'KozyrevaIM', N'kozyreva.i.m@unn.ru', N'Козырева', N'Ирина', N'Михайловна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (81, N'kuvanova.a.p', N'B0WTN66FtyFpIiy0JaLVy7tMiIISHuzb0u2L', N'KuvanovaAP', N'kuvanova.a.p@unn.ru', N'Куванова', N'Анастасия', N'Павловна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (82, N'lytova.o.n', N'uhQY3IAXvrDr8E3eAwdm/d4KeXRz8cpl224Q', N'LytovaON', N'lytova.o.n@unn.ru', N'Лытова', N'Ольга', N'Николаевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (83, N'morozova.o.a', N'CQdFYcJPVkijfK1OVeqtMb583QbrDvM7', N'MorozovaOA', N'morozova.o.a@unn.ru', N'Морозова', N'Оксана', N'Александровна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (84, N'myasnikov.a.s', N'VSVAxy+/cZkuThQRhVGdf5P8USfacagl', N'MyasnikovAS', N'myasnikov.a.s@unn.ru', N'Мясников', N'Александр', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (85, N'Nikolaev', N'J3Tgxka/1zsWOYFI5aS8EqFG+St2+XtJfQ==', N'Nikolaev_201005041557577468', N'Nikolaev@unn.ru', N'Николаев', N'Артем', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (86, N'pletenev.s.v', N'uQ6HHOLDJRu6TDkq5WOVyI1D1zXgkZwDrg==', N'PletenevSV', N'pletenev.s.v@unn.ru', N'Плетенев', N'Сергей', N'Владимирович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (87, N'Prockaya', N'T8zORuTjuxYSjwQRc84rWhu/3as2zONE6ZQ=', N'Prockaya_201005041557577568', N'Prockaya@unn.ru', N'Процкая', N'Надежда', N'', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (88, N'revina.l.l', N'IBtfVPo2olsBBt0z585SEyFL03FMpR7ciaQ=', N'RevinaLL', N'revina.l.l@unn.ru', N'Ревина', N'Любовь', N'Леонидовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (89, N'ryzhov.k.o', N'u75qhwWz/VACX7VOPL4cQmOK6v8EYzE7fQ0=', N'RyzhovKO', N'ryzhov.k.o@unn.ru', N'Рыжов', N'Клим', N'Олегович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (90, N'tyulin.d.a', N'4XtAeDZKAGQZ2M/gDce5n84bbayWngKj2Qc=', N'TyulinDA', N'tyulin.d.a@unn.ru', N'Тюлин', N'Дмитрий', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (91, N'fattaxova.i.x', N'TKDZ+hgf/A5ByudO7dlgDl2pJu2R6yofPsKH', N'FattaxovaIX', N'fattaxova.i.x@unn.ru', N'Фаттахова', N'Индира', N'Халитовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (92, N'xanin.d.n', N'kpPcjPYqpkyayhjZy4UupjCuQQeay3jQfy4B', N'XaninDN', N'xanin.d.n@unn.ru', N'Ханин', N'Дмитрий', N'Николаевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (93, N'chalkova.k.i', N'N0Hgh1HHjfZGd1FdCkha6NI3vrTVVQYq', N'CHalkovaKI', N'chalkova.k.i@unn.ru', N'Чалкова', N'Ксения', N'Игоревна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (94, N'shmeleva.e.a', N'0IE0QCGMg6dSWN5jytzd4BaSEiiKiWI4', N'SHmelevaEA', N'shmeleva.e.a@unn.ru', N'Шмелева', N'Екатерина', N'Андреевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (95, N'belyakov.d.a', N'0sfd/w2NEvdSCnHYqXQTJNF67vvMOLUYsw==', N'BelyakovDA', N'belyakov.d.a@unn.ru', N'Беляков', N'Дмитрий', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (96, N'bodrievskij.ya.a', N'aSKyy80u12ZoE6pwtshyRyjfHnKSRLQWzpQ=', N'BodrievskijYAA', N'bodrievskij.ya.a@unn.ru', N'Бодриевский', N'Ян', N'Аркадьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (97, N'bolshakov.m.v', N'pZQzKuwxzu5osfFMiIsJVgJEvV0s1FWcKZE=', N'BolshakovMV', N'bolshakov.m.v@unn.ru', N'Большаков', N'Михаил', N'Валерьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (98, N'grishanova.a.a', N'm/sqdIRiSe4coBb3gGMNfHO42uqfESvFHvL8', N'GrishanovaAA', N'grishanova.a.a@unn.ru', N'Гришанова', N'Алевтина', N'Александровна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (99, N'denisov.a.v', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'DenisovAV', N'denisov.a.v@unn.ru', N'Денисов', N'Александр', N'Вадимович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (100, N'dubrovskij.a.s', N'LVTPiHSxZ5HN6VCb+v2Ul6YdTc9eZufg', N'DubrovskijAS', N'dubrovskij.a.s@unn.ru', N'Дубровский', N'Алексей', N'Сергеевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (101, N'zimina.o.v', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'ZiminaOV', N'zimina.o.v@unn.ru', N'Зимина', N'Ольга', N'Викторовна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (102, N'zinin.k.a', N'j4P1OFAT/Up/9PTEVdwUkD5MXgf5eKtjIA==', N'ZininKA', N'zinin.k.a@unn.ru', N'Зинин', N'Кирилл', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (103, N'ivanov.d.p', N'miqVC4Lc9zRooLDLhrcUrNuEty2SpirmYw==', N'IvanovDP', N'ivanov.d.p@unn.ru', N'Иванов', N'Дмитрий', N'Петрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (104, N'knyazev.i.e', N'GESA6EPxDj+mY25Acw9f8dtKHOjTkY3+tg4=', N'KnyazevIE', N'knyazev.i.e@unn.ru', N'Князев', N'Илья', N'Евгеньевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (105, N'konovalov.a.yu', N'DKpgLoAMT1r9evcyNY4HzMolQ+Q9RZY8ixQ=', N'KonovalovAYU', N'konovalov.a.yu@unn.ru', N'Коновалов', N'Алексей', N'Юрьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (106, N'kroshko.d.a', N'rfo9n8I8CoF+FiCbAolJ85vlXWc95UHUo6k=', N'KroshkoDA', N'kroshko.d.a@unn.ru', N'Крошко', N'Дмитрий', N'Анатольевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (107, N'kulagin.d.l', N'Q0F5fzX63lDHLzL0OcVzwfsFLmyuvxJjSPer', N'KulaginDL', N'kulagin.d.l@unn.ru', N'Кулагин', N'Дмитрий', N'Леонидович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (108, N'lomakin.m.a', N'+Dy2L8YEuPc6yJXptzxAdTLhvLAls9Gj', N'LomakinMA', N'lomakin.m.a@unn.ru', N'Ломакин', N'Михаил', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (109, N'murzaev.a.l', N'aADmB3Iki4QxHTP8h23Kio70TmMFNkqp', N'MurzaevAL', N'murzaev.a.l@unn.ru', N'Мурзаев', N'Андрей', N'Леонидович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (110, N'ovechkin.e.yu', N'mDAq3V1HRKtGI8kUKP/9iLe4wmVNwSnuYA==', N'OvechkinEYU', N'ovechkin.e.yu@unn.ru', N'Овечкин', N'Евгений', N'Юрьевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (111, N'paxomov.p.a', N'Lj4KeOQECO6p4e/6G8VaCAFHPj+wkamPig==', N'PaxomovPA', N'paxomov.p.a@unn.ru', N'Пахомов', N'Павел', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (112, N'prokofev.v.k', N'Iytxv7t7094HD++dBSZxeV0QN3cmKkHyvOk=', N'ProkofevVK', N'prokofev.v.k@unn.ru', N'Прокофьев', N'Владимир', N'Константинович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (113, N'romanov.a.a', N'F4W0UPfEkMB1t5WhOxBUBDvqNM339dXn', N'RomanovAA', N'romanov.a.a@unn.ru', N'Романов', N'Антон', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (114, N'ryzhov.s.a', N'0T3obiF27t4SszCO2WcoMsssRtY5SDKX', N'RyzhovSA', N'ryzhov.s.a@unn.ru', N'Рыжов', N'Сергей', N'Андреевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (115, N'samarin.a.v', N'X3kAaM3hWy2BuHfwnRl5TJB8FwvPbrFR1Pgj', N'SamarinAV', N'samarin.a.v@unn.ru', N'Самарин', N'Александр', N'Васильевич', N'Student')
GO
print 'Processed 100 total records'
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (116, N'fadeev.e.a', N'aHJ027SbaJOsB4aS31OLxxo1o1hyTcsFSCb8', N'FadeevEA', N'fadeev.e.a@unn.ru', N'Фадеев', N'Егор', N'Александрович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (117, N'chalenko.p.v', N'V2KdlhWTm8ku6aA6bIBpZF3YvBl8efJ5', N'CHalenkoPV', N'chalenko.p.v@unn.ru', N'Чаленко', N'Павел', N'Владиславович', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (118, N'shindyapina.d.a', N'6GPBz+1AsQRCDwZ7nn7AnhLEOy8P7Qo9ImY=', N'SHindyapinaDA', N'shindyapina.d.a@unn.ru', N'Шиндяпина', N'Дарья', N'Андреевна', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (119, N'shashkov.v.n', N'yu8710g9jHbq7IMxxuNIijKZyOex5VFS', N'SHashkovVN', N'shashkov.v.n@unn.ru', N'Шашков', N'В', N'Н', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (120, N'shevchenko.v.n', N'9Ehf3JH8ICgVX/S9LN295PPrprcYFdDz3ls=', N'SHevchenkoVN', N'shevchenko.v.n@unn.ru', N'Шевченко', N'В', N'Н', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (121, N'alekseev.v.e', N'zw5UCbpCmijF9d+WeTXcUnO8VQ+iO4Bk', N'AlekseevVE', N'alekseev.v.e@unn.ru', N'Алексеев', N'В', N'Е', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (122, N'kuzin.s.g', N'7d1rH36Gw5euR0TJNk5+HzC5StDFT77IWLI=', N'KuzinSG', N'kuzin.s.g@unn.ru', N'Кузин', N'С', N'Г', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (123, N'Ne_ukazan', N'85xN/HPRBfjZcRSPOSKKpwVodGich2SuLcs=', N'Ne_ukazan_201005042327051685', N'Ne_ukazan@unn.ru', N'Не указан', N'', N'', N'Professor')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Departments] ([Id], [Alias], [Title], [Abbreviation], [Description]) VALUES (1, N'VMK', N'Вычислительной математики и кибернетики', N'ВМК', N'О факультете')
INSERT [dbo].[Departments] ([Id], [Alias], [Title], [Abbreviation], [Description]) VALUES (2, N'MehMat', N'Механико-Математический факультет', N'МехМат', N'О факультете')
SET IDENTITY_INSERT [dbo].[Departments] OFF
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (1, N'Специалитет', N'Specialitet')
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (2, N'Магистратура', N'Masters')
INSERT [dbo].[EducationPlan] ([Id], [Title], [Alias]) VALUES (3, N'Бакалавриат', N'Bachelors')
SET IDENTITY_INSERT [dbo].[EducationPlan] OFF
/****** Object:  Table [dbo].[Specialities]    Script Date: 06/02/2010 12:57:28 ******/
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
 CONSTRAINT [PK_specialities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Specialities] ON
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation]) VALUES (3, 1, N'Прикладная математика и информатика', N'PMI', N'ПМИ')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation]) VALUES (4, 1, N'Прикладная информатика', N'PI', N'ПИ')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation]) VALUES (5, 1, N'Информационный технологии', N'IT', N'ИТ')
SET IDENTITY_INSERT [dbo].[Specialities] OFF
/****** Object:  Table [dbo].[Chairs]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (1, 1, N'Кафедра теории управления и динамики машин', N'ТУиДМ           ', N'TUDM', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (2, 1, N'Кафедра численного и функционального анализа', N'ЧИФА            ', N'CHiFA', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (3, 1, N'Кафедра математической логики и высшей алгебры', N'МЛиВА           ', N'MLIVA', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (4, 1, N'Кафедра прикладной математики', N'ПМ              ', N'PM', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (5, 1, N'Кафедра математического обеспечения ЭВМ', N'МО ЭВМ           ', N'MO', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (6, 1, N'Кафедра информатики и автоматизации научных исследований', N'ИАНИ            ', N'IANI', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (7, 1, N'Кафедра прикладной теории вероятностей', N'ПТВ             ', N'PTV', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (8, 1, N'Кафедра интеллектуальных информационных систем и геоинформатики', N'ИИСГео          ', N'IISGEO', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (9, 1, N'Центр прикладной информатики', N'ЦПИ             ', N'CPI', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (11, 1, N'Не указана', N'Не указана', N'None', N'О кафедре')
SET IDENTITY_INSERT [dbo].[Chairs] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 06/02/2010 12:57:28 ******/
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
 CONSTRAINT [PK_specializations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professors]    Script Date: 06/02/2010 12:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[UserId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[Degree] [nvarchar](255) NOT NULL,
	[Position] [nvarchar](255) NOT NULL,
	[About] [text] NOT NULL,
 CONSTRAINT [PK_Professors_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (7, 1, N'КФМН', N'Препод', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (17, 5, N'ктн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (119, 2, N'кфмн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (120, 3, N'дфмн', N'проф', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (121, 3, N'кфмн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (122, 6, N'ктн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (123, 11, N'Не указана', N'Не указана', N'О себе')
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 06/02/2010 12:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplines](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[EducationPlanId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] ON
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (17, 3, 2, 5, 17, N'Inzhenernye_osnovy_informacionnyx_texnologij', N'Инженерные основы информационных технологий', N'ДН:ВК', N'Программная инженерия')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (18, 3, 1, 5, 17, N'Metody_obektno-orientirovannogo_programmirovaniya', N'Методы объектно-ориентированного программирования', N'ДН:ВК', N'МООП')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (19, 3, 1, 2, 119, N'Matematicheskij_analiz', N'Математический анализ', N'ДН:ФК', N'МА')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (20, 3, 1, 3, 120, N'Geometriya_i_algebra', N'Геометрия и алгебра', N'ДН:ФК', N'ГА')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (21, 3, 1, 3, 121, N'Diskretnaya_matematika', N'Дискретная математика', N'ДН:ФК', N'ДМ')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (22, 3, 1, 6, 122, N'Informatika', N'Информатика', N'ДН:ФК', N'Информатика')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category], [Abbreviation]) VALUES (23, 3, 1, 11, 123, N'Fizicheskaya_kultura', N'Физическая культура', N'ДН:ФК', N'Физическая культура')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Groups]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (2, 3, 1, N'86M1', N'86М1')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (3, 3, 1, N'8101', N'8101')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (4, 3, 1, N'8102', N'8102')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (5, 3, 1, N'8103', N'8103')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (6, 3, 1, N'8104', N'8104')
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 06/02/2010 12:57:28 ******/
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
	[Time] [datetime] NOT NULL,
	[Building] [smallint] NOT NULL,
	[Room] [smallint] NOT NULL,
 CONSTRAINT [PK_practices_and_labs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (1, 17, 17, N'Среда', N'9:40', 2, 317, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (3, 21, 121, N'Понедельник', N'8:00', 4, 221, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (4, 19, 119, N'Понедельник', N'9:40', 4, 221, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (5, 23, 123, N'Вторник', N'11:20', 0, 0, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (6, 19, 119, N'Вторник', N'13:00', 2, 338, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (7, 20, 120, N'Четверг', N'13:00', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (8, 22, 122, N'Четверг', N'14:40', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (9, 22, 122, N'Четверг', N'16:20', 2, 314, N'Верхняя')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (10, 23, 123, N'Четверг', N'11:20', 0, 0, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (11, 18, 17, N'Пятница', N'14:40', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (12, 18, 17, N'Пятница', N'16:20', 2, 314, N'Каждая')
SET IDENTITY_INSERT [dbo].[LectureTimetables] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (3, 17, N'Введение в программную инженерию')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (4, 17, N'Жизненный цикл программного продукта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (5, 17, N'Управление программным проектом ')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (6, 17, N'Управление качеством ИТ проекта')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (7, 17, N'CMMI – интегрированная модель возможности и зрелости процесса')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (8, 17, N'Дополнительные процессы создания ПП')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (9, 18, N'Введение в язык ')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (10, 18, N'Начала С')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (11, 18, N'Организация ввода/вывода в C. Работа с файлами. ')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (12, 18, N'Указатели и массивы. Ссылки. Структуры')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (13, 18, N'Функции языка C')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (14, 18, N'Средства компоновки программы')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (15, 18, N'Введение в ООП')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (16, 18, N'Классы и объекты')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (17, 18, N'Конструкторы и деструкторы')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (18, 18, N'Наследование')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (19, 18, N'Полиморфизм')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (20, 18, N'Перегрузка операций')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (22, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (23, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (24, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (25, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (26, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (27, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (28, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (29, 18, N'Операторы языка C')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (30, 18, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (31, 17, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (32, 18, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (33, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (34, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (35, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (36, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (37, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (38, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (39, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (40, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (41, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (42, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (43, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (44, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (45, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (46, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (47, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (62, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (63, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (64, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (65, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (66, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (67, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (68, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (69, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (70, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (71, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (72, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (73, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (74, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (75, 20, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (76, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (77, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (78, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (79, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (80, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (81, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (82, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (83, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (84, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (85, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (86, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (87, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (88, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (89, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (90, 21, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (91, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (92, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (93, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (94, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (95, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (96, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (97, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (98, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (99, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (100, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (101, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (102, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (103, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (104, 22, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (105, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (106, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (107, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (108, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (109, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (110, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (111, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (112, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (113, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (114, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (115, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (116, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (117, 23, N'Тема еще не определена')
GO
print 'Processed 100 total records'
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (118, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (301, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (302, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (303, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (304, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (305, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (306, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (307, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (308, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (309, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (310, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (311, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (312, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (313, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (314, 19, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (315, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (316, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (317, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (318, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (319, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (320, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (321, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (322, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (323, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (324, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (325, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (326, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (327, 23, N'Тема еще не определена')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (328, 23, N'Тема еще не определена')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] OFF
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (1, 18, 9, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (2, 18, 10, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (3, 18, 11, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (4, 18, 12, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (5, 18, 13, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (6, 18, 14, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (7, 18, 15, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (8, 18, 16, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (9, 18, 17, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (10, 18, 18, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (11, 18, 19, NULL, NULL)
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (12, 18, 20, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PracticePlans] OFF
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (6, 17, 3, CAST(0x00009D2000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (7, 17, 4, CAST(0x00009D2700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (8, 17, 5, CAST(0x00009D2E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (9, 17, 6, CAST(0x00009D3500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (10, 17, 7, CAST(0x00009D3C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (11, 17, 8, CAST(0x00009D4300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (12, 18, 9, CAST(0x00009D1B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (13, 18, 10, CAST(0x00009D2200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (14, 18, 11, CAST(0x00009D2900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (15, 18, 12, CAST(0x00009D3000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (16, 18, 13, CAST(0x00009D3700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (17, 18, 14, CAST(0x00009D3E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (18, 18, 15, CAST(0x00009D4500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (19, 18, 16, CAST(0x00009D4C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (20, 18, 17, CAST(0x00009D5300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (21, 18, 18, CAST(0x00009D5A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (22, 18, 19, CAST(0x00009D6100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (23, 18, 20, CAST(0x00009D6800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (25, 17, 22, CAST(0x00009D4A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (26, 17, 23, CAST(0x00009D5100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (27, 17, 24, CAST(0x00009D5800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (28, 17, 25, CAST(0x00009D5F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (29, 17, 26, CAST(0x00009D6600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (30, 17, 27, CAST(0x00009D6D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (31, 17, 28, CAST(0x00009D7400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (32, 18, 29, CAST(0x00009D6F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (33, 18, 30, CAST(0x00009D7600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (34, 17, 31, CAST(0x00009D7B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (35, 18, 32, CAST(0x00009D7D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (36, 19, 33, CAST(0x00009D1E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (37, 19, 34, CAST(0x00009D2500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (38, 19, 35, CAST(0x00009D2C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (39, 19, 36, CAST(0x00009D3300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (40, 19, 37, CAST(0x00009D3A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (41, 19, 38, CAST(0x00009D4100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (42, 19, 39, CAST(0x00009D4800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (43, 19, 40, CAST(0x00009D4F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (44, 19, 41, CAST(0x00009D5600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (45, 19, 42, CAST(0x00009D5D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (46, 19, 43, CAST(0x00009D6400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (47, 19, 44, CAST(0x00009D6B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (48, 19, 45, CAST(0x00009D7200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (49, 19, 46, CAST(0x00009D7900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (50, 19, 47, CAST(0x00009D8000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (65, 20, 62, CAST(0x00009D2100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (66, 20, 63, CAST(0x00009D2800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (67, 20, 64, CAST(0x00009D2F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (68, 20, 65, CAST(0x00009D3600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (69, 20, 66, CAST(0x00009D3D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (70, 20, 67, CAST(0x00009D4400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (71, 20, 68, CAST(0x00009D4B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (72, 20, 69, CAST(0x00009D5200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (73, 20, 70, CAST(0x00009D5900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (74, 20, 71, CAST(0x00009D6000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (75, 20, 72, CAST(0x00009D6700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (76, 20, 73, CAST(0x00009D6E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (77, 20, 74, CAST(0x00009D7500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (78, 20, 75, CAST(0x00009D7C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (79, 21, 76, CAST(0x00009D1E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (80, 21, 77, CAST(0x00009D2500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (81, 21, 78, CAST(0x00009D2C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (82, 21, 79, CAST(0x00009D3300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (83, 21, 80, CAST(0x00009D3A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (84, 21, 81, CAST(0x00009D4100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (85, 21, 82, CAST(0x00009D4800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (86, 21, 83, CAST(0x00009D4F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (87, 21, 84, CAST(0x00009D5600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (88, 21, 85, CAST(0x00009D5D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (89, 21, 86, CAST(0x00009D6400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (90, 21, 87, CAST(0x00009D6B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (91, 21, 88, CAST(0x00009D7200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (92, 21, 89, CAST(0x00009D7900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (93, 21, 90, CAST(0x00009D8000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (94, 22, 91, CAST(0x00009D2100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (95, 22, 92, CAST(0x00009D2800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (96, 22, 93, CAST(0x00009D2F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (97, 22, 94, CAST(0x00009D3600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (98, 22, 95, CAST(0x00009D3D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (99, 22, 96, CAST(0x00009D4400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (100, 22, 97, CAST(0x00009D4B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (101, 22, 98, CAST(0x00009D5200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (102, 22, 99, CAST(0x00009D5900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (103, 22, 100, CAST(0x00009D6000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (104, 22, 101, CAST(0x00009D6700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (105, 22, 102, CAST(0x00009D6E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (106, 22, 103, CAST(0x00009D7500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (107, 22, 104, CAST(0x00009D7C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (108, 23, 105, CAST(0x00009D1F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (109, 23, 106, CAST(0x00009D2600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (110, 23, 107, CAST(0x00009D2D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (111, 23, 108, CAST(0x00009D3400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (112, 23, 109, CAST(0x00009D3B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (113, 23, 110, CAST(0x00009D4200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (114, 23, 111, CAST(0x00009D4900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (115, 23, 112, CAST(0x00009D5000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (116, 23, 113, CAST(0x00009D5700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (117, 23, 114, CAST(0x00009D5E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (118, 23, 115, CAST(0x00009D6500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (119, 23, 116, CAST(0x00009D6C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (120, 23, 117, CAST(0x00009D7300000000 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (121, 23, 118, CAST(0x00009D7A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (304, 19, 301, CAST(0x00009D1F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (305, 19, 302, CAST(0x00009D2600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (306, 19, 303, CAST(0x00009D2D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (307, 19, 304, CAST(0x00009D3400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (308, 19, 305, CAST(0x00009D3B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (309, 19, 306, CAST(0x00009D4200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (310, 19, 307, CAST(0x00009D4900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (311, 19, 308, CAST(0x00009D5000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (312, 19, 309, CAST(0x00009D5700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (313, 19, 310, CAST(0x00009D5E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (314, 19, 311, CAST(0x00009D6500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (315, 19, 312, CAST(0x00009D6C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (316, 19, 313, CAST(0x00009D7300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (317, 19, 314, CAST(0x00009D7A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (318, 23, 315, CAST(0x00009D2100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (319, 23, 316, CAST(0x00009D2800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (320, 23, 317, CAST(0x00009D2F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (321, 23, 318, CAST(0x00009D3600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (322, 23, 319, CAST(0x00009D3D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (323, 23, 320, CAST(0x00009D4400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (324, 23, 321, CAST(0x00009D4B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (325, 23, 322, CAST(0x00009D5200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (326, 23, 323, CAST(0x00009D5900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (327, 23, 324, CAST(0x00009D6000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (328, 23, 325, CAST(0x00009D6700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (329, 23, 326, CAST(0x00009D6E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (330, 23, 327, CAST(0x00009D7500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (331, 23, 328, CAST(0x00009D7C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[LecturePlans] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 06/02/2010 12:57:28 ******/
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
	[Reporting] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SpecialityDisciplineTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] ON
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (19, 17, 9, 2, 0, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (20, 18, 2, 2, 2, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (22, 19, 1, 4, 4, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (23, 19, 2, 4, 4, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (24, 19, 3, 4, 4, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (25, 19, 4, 4, 4, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (26, 20, 1, 3, 3, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (27, 20, 2, 2, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (28, 20, 3, 2, 2, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (29, 21, 1, 1, 1, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (30, 21, 2, 2, 2, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (31, 22, 2, 3, 0, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (32, 22, 3, 2, 0, 0, N'Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (33, 23, 1, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (34, 23, 2, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (35, 23, 3, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (36, 23, 4, 0, 4, 0, N'Зачет')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Table [dbo].[Students]    Script Date: 06/02/2010 12:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[UserId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (7, 2)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (18, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (19, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (20, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (21, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (22, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (23, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (24, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (25, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (26, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (27, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (28, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (29, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (30, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (31, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (32, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (33, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (34, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (35, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (36, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (37, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (38, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (39, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (40, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (41, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (42, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (43, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (44, 3)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (45, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (46, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (47, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (48, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (49, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (50, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (51, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (52, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (53, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (54, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (55, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (56, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (57, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (58, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (59, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (60, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (61, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (62, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (63, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (64, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (65, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (66, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (67, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (68, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (69, 4)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (70, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (71, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (72, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (73, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (74, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (75, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (76, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (77, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (78, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (79, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (80, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (81, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (82, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (83, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (84, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (85, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (86, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (87, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (88, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (89, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (90, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (91, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (92, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (93, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (94, 5)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (95, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (96, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (97, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (98, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (99, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (100, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (101, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (102, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (103, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (104, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (105, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (106, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (107, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (108, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (109, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (110, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (111, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (112, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (113, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (114, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (115, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (116, 6)
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (117, 6)
GO
print 'Processed 100 total records'
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (118, 6)
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[GeneratedTests] ([Id], [SpecialityDisciplineTopicId], [VariantsCount], [GeneratedDate], [QuestionsCount]) VALUES (1, 18, 5, CAST(0x00009D8000000000 AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[GeneratedTests] OFF
/****** Object:  Table [dbo].[Razdels]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (6, 29, N'Общие вопросы', -1)
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (7, 29, N'Оператор if', -1)
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (8, 29, N'Оператор switch', -1)
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (9, 29, N'Оператор do while', -1)
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (10, 29, N'Оператор for', -1)
SET IDENTITY_INSERT [dbo].[Razdels] OFF
/****** Object:  Table [dbo].[Questions]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (114, 6, 2, N'Операторы циклического выполнения кода', N'Укажите, какие операторы используются для циклического выполнения кода? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (115, 6, 1, N'Оператор goto', N'В чем заключается назначение оператора перехода goto? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (116, 6, 2, N'Условия зацикливания', N'Выберите варианты выражений, в которых произойдет зацикливание программы: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (117, 6, 1, N'Общее свойство операторов управления', N'Отметьте верное завершение фразы: «Операторы управления (for, while, switch, …) необходимы для: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (118, 6, 2, N'Условия выхода из цикла 1', N'Какие конструкции языка C позволяет проверять условие выхода из цикла после завершения тела цикла: <BR>', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (119, 6, 2, N'Условия выхода из цикла 2', N'Какие конструкции языка C позволяет проверять условие выхода из цикла до начала выполнения тела цикла: <BR>', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (120, 6, 2, N'Условия выхода из цикла 3', N'Какое операторы позволяет выйти из операторов for, while и do до завершения цикла по условию? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (121, 6, 1, N'Оператор continue', N'Что означает использование оператора continue в циклах for, while и do? Выберите один наиболее правильный ответ:<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (122, 6, 1, N'Оператор break', N'Что означает использование оператора break в циклах while и do? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (123, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Является ли обязательным использование префикса default в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (124, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=3;<br /> switch(n) {<br /> case 2: cout << "ааа"; break;<br /> case 3: cout << "ббб"; break;<br /> default: cout << "ввв"; break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (125, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=45;<br /> switch(n) {<br /> case 23: cout << "ааа";<br /> case 45: cout << "ббб";<br /> default: cout << "ввв";<br /> break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (126, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что происходит при использовании break в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (127, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Чем должны быть помечены случаи case в конструкции switch? Выберите наиболее подходящий вариант: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (128, 7, 0, N'Краткое название отсутствует (документ старого образца)', N'Какое значение получит переменная Z в результате выполнения фрагмента кода: <br /> int Z, N = 2, A = 3, B = 4; if ( N > 0 ) if ( A > B ) Z = A; <br /> if ( A == B) N = A; else Z = B; <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (129, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:19197/Uploads/Images/Image1.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (130, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:19197/Uploads/Images/Image2.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (131, 7, 2, N'Краткое название отсутствует (документ старого образца)', N'Какие значения получат переменные x, y, z после выполнения следующих действий: <br />  <img src="http://localhost:19197/Uploads/Images/Image3.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (132, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'В каком случае выполнится оператор4? <br /> if (выражение1) оператор1 else if (выражение2) оператор2 else if (выражение3) оператор3 else оператор4 <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (133, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'if (A > B) {Z = A; A++;}; else Z = B; Должна ли после закрывающейся фигурной скобки стоять точка с запятой? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (134, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Является ли обязательным использование префикса default в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (135, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=3;<br /> switch(n) {<br /> case 2: cout << "ааа"; break;<br /> case 3: cout << "ббб"; break;<br /> default: cout << "ввв"; break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (136, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=45;<br /> switch(n) {<br /> case 23: cout << "ааа";<br /> case 45: cout << "ббб";<br /> default: cout << "ввв";<br /> break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (137, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Что происходит при использовании break в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (138, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Чем должны быть помечены случаи case в конструкции switch? Выберите наиболее подходящий вариант: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (139, 9, 1, N'Фрагмент кода', N'Какой будет результат выполнения следующих действий: <br /> int i = 5;<br /> do { cout << (--i)-- << " "; }<br /> while ( i>=2 && i < 5 ) ;<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (140, 10, 1, N'Бесконечный цикл', N'Что означает запись for (;;)? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (141, 10, 1, N'Отсутствие точки с запятой в конструкции цикла for', N'В каком случает точки с запятой могут отсутствовать в конструкции for? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (142, 10, 1, N'Фрагмент кода 1', N'Что выведет следующая программа ? <br /> 	#include <iostream.h><br /> 	int main() {<br />    int i ;<br />    for(i = 0; i < 9; i++)<br />    cout << i+1;<br />    return 1;<br /> 	}<br /> ', -1, -1, -1, 1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (143, 10, 1, N'Фрагмент кода 2', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, 1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (144, 10, 1, N'Фрагмент кода 3', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, 1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (145, 10, 1, N'Фрагмент кода 4', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, 1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (146, 10, 1, N'Фрагмент кода 5', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (147, 10, 1, N'Фрагмент кода 6', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (148, 10, 1, N'Фрагмент кода 7', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (149, 10, 1, N'Фрагмент кода 8', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (150, 6, 1, N'Вопрос из Word-документа', N'Что означает запись while ( false )? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (151, 7, 0, N'Фрагмент кода 1', N'Какое значение получит переменная Z в результате выполнения фрагмента кода: <br /> int Z, N = 2, A = 3, B = 4; if ( N > 0 ) if ( A > B ) Z = A; <br /> if ( A == B) N = A; else Z = B; <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (152, 7, 1, N'Фрагмент кода 2', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:5061/Uploads/Images/Image1.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (153, 7, 1, N'Фрагмент кода 3', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:5061/Uploads/Images/Image2.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (154, 7, 2, N'Фрагмент кода 4', N'Какие значения получат переменные x, y, z после выполнения следующих действий: <br />  <img src="http://localhost:5061/Uploads/Images/Image3.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (155, 7, 1, N'Вложенные условия', N'В каком случае выполнится оператор4? <br /> if (выражение1) оператор1 else if (выражение2) оператор2 else if (выражение3) оператор3 else оператор4 <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (156, 7, 1, N'Синтаксис языка', N'if (A > B) {Z = A; A++;}; else Z = B; Должна ли после закрывающейся фигурной скобки стоять точка с запятой? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (157, 8, 1, N'Префикс default в операторе switch', N'Является ли обязательным использование префикса default в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (158, 8, 1, N'Фрагмент кода 1', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=3;<br /> switch(n) {<br /> case 2: cout << "ааа"; break;<br /> case 3: cout << "ббб"; break;<br /> default: cout << "ввв"; break; }<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (159, 8, 1, N'Фрагмент кода 2', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=45;<br /> switch(n) {<br /> case 23: cout << "ааа";<br /> case 45: cout << "ббб";<br /> default: cout << "ввв";<br /> break; }<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (160, 8, 1, N'Оператор break в операторе switch', N'Что происходит при использовании break в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (161, 8, 1, N'Метки для case', N'Чем должны быть помечены случаи case в конструкции switch? Выберите наиболее подходящий вариант: <br /> ', -1, -1, -1, -1, -1, 0, 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 06/02/2010 12:57:28 ******/
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
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[GeneratedTestVariants] ([Id], [GeneratedTestId]) VALUES (4, 1)
INSERT [dbo].[GeneratedTestVariants] ([Id], [GeneratedTestId]) VALUES (5, 1)
SET IDENTITY_INSERT [dbo].[GeneratedTestVariants] OFF
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 06/02/2010 12:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedTestVariants](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestVariantId] [bigint] NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
	[State] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Mark] [int] NOT NULL,
	[Path] [text] NOT NULL,
	[StudentKey] [text] NOT NULL,
	[ProfessorKey] [text] NOT NULL,
	[PackageId] [bigint] NOT NULL,
 CONSTRAINT [PK_assigned_test_variants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssignedTestVariants] ON
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path], [StudentKey], [ProfessorKey], [PackageId]) VALUES (1, 1, 18, CAST(0x00009D7400000000 AS DateTime), 1, 0, 0, N'/1.zip', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', 1)
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path], [StudentKey], [ProfessorKey], [PackageId]) VALUES (2, 2, 18, CAST(0x00009D7400000000 AS DateTime), 1, 0, 0, N'/2.zip', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', 2)
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path], [StudentKey], [ProfessorKey], [PackageId]) VALUES (3, 3, 18, CAST(0x00009D7400000000 AS DateTime), 2, 20, 0, N'/3.zip', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', 3)
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path], [StudentKey], [ProfessorKey], [PackageId]) VALUES (4, 4, 18, CAST(0x00009D7400000000 AS DateTime), 2, 30, 0, N'/4.zip', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', 4)
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path], [StudentKey], [ProfessorKey], [PackageId]) VALUES (5, 5, 18, CAST(0x00009D7400000000 AS DateTime), 3, 40, 4, N'/5.zip', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', N'5ujTlxHDMD1F74H4tKROsHLutJTB2g3AuHHy', 5)
SET IDENTITY_INSERT [dbo].[AssignedTestVariants] OFF
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 06/02/2010 12:57:28 ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 06/02/2010 12:57:28 ******/
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
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (323, 114, N'if (...) then ... else ... ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (324, 114, N'while (...) {...} ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (325, 114, N'switch (...) {} ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (326, 114, N'for (...; ...; ...) {...} ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (327, 115, N'изменяет последовательность выполнения операторов в программе  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (328, 115, N'необходим для передачи аргумента в функцию ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (329, 115, N'для наглядного отображения листинга программы ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (330, 115, N'для перехода из одной функции в другую ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (331, 116, N'for (int iCount = 0; iCount <= 4;); ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (332, 116, N'while (true); ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (333, 116, N'while (false); ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (334, 116, N'Ошибка компилятора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (335, 117, N'корректного завершения программы ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (336, 117, N'управления ходом компиляции проекта ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (337, 117, N'определения последовательности выполнения программы  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (338, 118, N'for ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (339, 118, N'while ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (340, 118, N'do while ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (341, 119, N'for ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (342, 119, N'while ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (343, 119, N'do while ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (344, 120, N'break ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (345, 120, N'return ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (346, 120, N'continue ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (347, 121, N'выход их цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (348, 121, N'переход на начало цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (349, 121, N'переход на конец цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (350, 121, N'переход к проверке условия выхода из цикла ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (351, 121, N'переход к предыдущему шагу цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (352, 121, N'переход к следующему шагу цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (353, 122, N'выход из программы и выключение машины ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (354, 122, N'переход на начало цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (355, 122, N'переход на конец цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (356, 122, N'переход к проверке условия выхода из цикла ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (357, 122, N'переход к предыдущему шагу цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (358, 122, N'переход к следующему шагу цикла', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (359, 122, N'выход из внутреннего охватывающего его цикла ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (360, 122, N'выход из внешнего охватывающего его цикла ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (361, 123, N'да, является ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (362, 123, N'нет, не является  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (363, 124, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (364, 124, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (365, 124, N'ббб ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (366, 124, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (367, 124, N'неопределенное поведение ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (368, 125, N'ошибка компилятора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (369, 125, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (370, 125, N'ббб ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (371, 125, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (372, 125, N'бббввв ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (373, 125, N'аааввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (374, 125, N'неопределенное поведение', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (375, 126, N'немедленное выполнение какого-либо оператора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (376, 126, N'немедленный выход из переключателя  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (377, 126, N'блокируется префикс default ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (378, 127, N'целым ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (379, 127, N'символьной константой ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (380, 127, N'переменной ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (381, 127, N'константным выражением ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (382, 128, N'4', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (383, 129, N'aaa', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (384, 129, N'bbb', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (385, 129, N'ccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (386, 129, N'ddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (387, 129, N'aaabbb', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (388, 129, N'aaaccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (389, 129, N'aaaddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (390, 129, N'bbbccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (391, 129, N'bbbddd ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (392, 129, N'cccddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (393, 130, N'Вариант 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (394, 130, N'Вариант 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (395, 130, N'Вариант 3  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (396, 130, N'ничего не будет напечатано ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (397, 130, N'программа не откомпилируется', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (398, 131, N'x = 3 ', 7)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (399, 131, N'x = 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (400, 131, N'x = 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (401, 131, N'x = 4 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (402, 131, N'y = 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (403, 131, N'y = 3 ', 7)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (404, 131, N'z = 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (405, 131, N'z = 8 ', 6)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (406, 131, N'программа не откомпилируется', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (407, 132, N'если ни одно из проверяемых условий не выполнится  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (408, 132, N'если все проверяемые условия выполнятся ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (409, 132, N'ни в каком ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (410, 133, N'необязательно ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (411, 133, N'обязательно ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (412, 133, N'не должна ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (413, 134, N'да, является ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (414, 134, N'нет, не является  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (415, 135, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (416, 135, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (417, 135, N'ббб ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (418, 135, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (419, 135, N'неопределенное поведение ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (420, 136, N'ошибка компилятора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (421, 136, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (422, 136, N'ббб ', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (423, 136, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (424, 136, N'бббввв ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (425, 136, N'аааввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (426, 136, N'неопределенное поведение', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (427, 137, N'немедленное выполнение какого-либо оператора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (428, 137, N'немедленный выход из переключателя  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (429, 137, N'блокируется префикс default ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (430, 138, N'целым ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (431, 138, N'символьной константой ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (432, 138, N'переменной ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (433, 138, N'константным выражением ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (434, 139, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (435, 139, N'цикл ни разу не будет выполнен ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (436, 139, N'цикл будет выполняться бесконечно ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (437, 139, N'4 3 2 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (438, 139, N'4 3 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (439, 139, N'4 2 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (440, 139, N'4 2 ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (441, 140, N'бесконечный цикл  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (442, 140, N'цикл, который не выполняется ни разу ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (443, 140, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (444, 140, N'аварийный выход из программы', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (445, 141, N'если какое-либо из трех выражений будет опущено ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (446, 141, N'такого случая не может быть ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (447, 141, N'если все три выражения будут опущены ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (448, 142, N'цифры от 0 до 8 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (449, 142, N'цифры от 1 до 9 ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (450, 142, N'программа не будет построена из-за ошибок ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (451, 143, N's = 0; for( i = 1; i <= n; i++ ) s += i * i;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (452, 143, N's = 0; for( i = 1; i <= n; ) s += i * i++;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (453, 143, N'оба варианта правильны ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (454, 144, N's = 0; for( i = 1; i <= n; i++ ) s += i * i;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (455, 144, N's = 0; for( i = 1; i <= n; s += i * i++ );', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (456, 144, N'оба варианта правильны ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (457, 145, N's = 0; for( i = 1; i <= n; i++ ) s += i * i;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (458, 145, N's = 0; for( i = 1; i <= n; s += i++ * i ); ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (459, 145, N'оба варианта правильны ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (460, 146, N's = 0; for( i = 1; i <= n; i++ ) s += i * i; ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (461, 146, N's = 0; for( i = 1; i++ <= n; s += i * i ); //', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (462, 146, N'оба варианта правильны ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (463, 147, N's = 0; for( i = 1; i <= n; i++ ) s += i * i;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (464, 147, N's = 0; for( i = 1; i <= n && (s += i*i); )  ++i;', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (465, 147, N'оба варианта правильны ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (466, 148, N's = 0; for( i = 1; i <= n; i++ ) s += i * i; ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (467, 148, N's = 0; for( i = 1; (s += i * i) && i <= n; ) ++i; //', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (468, 148, N'оба варианта правильны ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (469, 149, N's = 0; for( i = 1; i <= n; ) s += i * i++; ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (470, 149, N's = 0; for( i = 1; i <= n && (s += ++i * i); ); //', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (471, 149, N'оба варианта правильны ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (472, 150, N'бесконечный цикл ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (473, 150, N'цикл, который не выполняется ни разу  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (474, 150, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (475, 150, N'аварийный выход из программы', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (476, 151, N'4<br /> ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (477, 152, N'aaa', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (478, 152, N'bbb', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (479, 152, N'ccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (480, 152, N'ddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (481, 152, N'aaabbb', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (482, 152, N'aaaccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (483, 152, N'aaaddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (484, 152, N'bbbccc', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (485, 152, N'bbbddd ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (486, 152, N'cccddd', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (487, 153, N'Вариант 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (488, 153, N'Вариант 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (489, 153, N'Вариант 3  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (490, 153, N'ничего не будет напечатано ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (491, 153, N'программа не откомпилируется', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (492, 154, N'x = 3 ', 7)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (493, 154, N'x = 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (494, 154, N'x = 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (495, 154, N'x = 4 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (496, 154, N'y = 2 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (497, 154, N'y = 3 ', 7)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (498, 154, N'z = 1 ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (499, 154, N'z = 8 ', 6)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (500, 154, N'программа не откомпилируется', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (501, 155, N'если ни одно из проверяемых условий не выполнится  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (502, 155, N'если все проверяемые условия выполнятся ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (503, 155, N'ни в каком ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (504, 156, N'необязательно ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (505, 156, N'обязательно ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (506, 156, N'не должна ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (507, 157, N'да, является ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (508, 157, N'нет, не является  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (509, 158, N'ошибка компиляции ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (510, 158, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (511, 158, N'ббб ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (512, 158, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (513, 158, N'неопределенное поведение ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (514, 159, N'ошибка компилятора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (515, 159, N'ааа ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (516, 159, N'ббб ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (517, 159, N'ввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (518, 159, N'бббввв ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (519, 159, N'аааввв ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (520, 159, N'неопределенное поведение', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (521, 160, N'немедленное выполнение какого-либо оператора ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (522, 160, N'немедленный выход из переключателя  ', 20)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (523, 160, N'блокируется префикс default ', 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (524, 161, N'целым ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (525, 161, N'символьной константой ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (526, 161, N'переменной ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (527, 161, N'константным выражением ', 20)
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_Professors]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_Professors]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 06/02/2010 12:57:28 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
