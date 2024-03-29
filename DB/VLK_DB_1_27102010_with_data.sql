USE [VLK_DB_1]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (2, N'strongin.r.g', N'a0vsfR3pv3CqO+mnaTR+Bw3yr+vOaxVSjw==', N'StronginRG', N'strongin.r.g@unn.ru', N'Стронгин', N'Роман', N'Григорьевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (3, N'gergel.v.p', N'D4KTwVlF/ZrhAimx340gWvq5sMS6/miIYTVW', N'GergelVP', N'gergel.v.p@unn.ru', N'Гергель', N'Виктор', N'Павлович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (4, N'barkalov.a.v', N'fj0Cf7bNKcy5ufaXByLN1hD+RttiH+cHhuE=', N'BarkalovAV', N'barkalov.a.v@unn.ru', N'Баркалов', N'Александр', N'Валентинович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (5, N'basalin.p.d', N'P73nS0gSHUULVxVt3zlJGKSxLIEajUAhDQo=', N'BasalinPD', N'basalin.p.d@unn.ru', N'Басалин', N'Павел', N'Дмитриевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (6, N'barysheva.i.v', N'LAhDbHvCaATTF0vQmGfcZlkgHWkhQQ9jbA==', N'BaryshevaIV', N'barysheva.i.v@unn.ru', N'Барышева', N'Ирина', N'Викторовна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (7, N'shestakova.n.v', N'iBIK9HGKee83q2shSlPdA+bIXKCP/qmR', N'ShestakovaNV', N'shestakova.n.v@unn.ru', N'Шестакова', N'Наталья', N'Валерьевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (8, N'bogolepov.d.k', N'BcO9ukfYAa+LTZfklzkmG5a7R1PzyToyXg==', N'BogolepovDK', N'bogolepov.d.k@unn.ru', N'Боголепов', N'Денис', N'Константинович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (9, N'karpenko.s.n', N'0G8ye69B4RwFPC5zU9onvUn8bwSVI9j8SIs=', N'KarpenkoSN', N'karpenko.s.n@unn.ru', N'Карпенко', N'Сергей', N'Николаевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (10, N'ketkov.yu.l', N'ttgln9j1X4rIB+gAkwxpFuaBP8OqSZBY', N'KetkovYUL', N'ketkov.yu.l@unn.ru', N'Кетков', N'Юлий', N'Лазаревич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (11, N'sidnev.a.a', N'OyfL4SV9UlG4BYaGWP6KUg9LkJgWJmOn', N'SidnevAA', N'sidnev.a.a@unn.ru', N'Сиднев', N'Алексей', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (12, N'turlapov.v.e', N'ysJcfqp0TSrTC89pDzhyFLo8NbyWYwtV', N'TurlapovVE', N'turlapov.v.e@unn.ru', N'Турлапов', N'Вадим', N'Евгеньевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (13, N'sidorov.s.v', N'ewTMWkDSHKcLjb5J/bYt6+URuX5D0Fsj', N'SidorovSV', N'sidorov.s.v@unn.ru', N'Сидоров', N'Сергей', N'Владимирович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (14, N'kiseleva.l.g', N'7Ub6s4Su1I6fh8YE0jo/gY8vcYn7fMOb', N'KiselevaLG', N'kiseleva.l.g@unn.ru', N'Киселева', N'Лариса', N'Георгиевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (15, N'kucherenko.a.a', N'ofYxmkRAfp/3smblNOceuQORXTuSSNTq', N'KucherenkoAA', N'kucherenko.a.a@unn.ru', N'Кучеренко', N'Александр', N'Александрович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (16, N'shulc.m.m', N'uA/uvqTIcfAE6Tgq3Y0dlw58MECkEu5+aw==', N'ShulcMM', N'shulc.m.m@unn.ru', N'Шульц', N'Михаил', N'Михайлович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (17, N'shevchenko.v.n', N'trBusxIcdFbT2BSzkEe5pU7TgbvfLHmvzA==', N'ShevchenkoVN', N'shevchenko.v.n@unn.ru', N'Шевченко', N'Валерий', N'Николаевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (18, N'zolotyx.n.yu', N'MJNnH4mu1RYskkMa1y98RPfEmiWkZTxewD8=', N'ZolotyxNYU', N'zolotyx.n.yu@unn.ru', N'Золотых', N'Николай', N'Юрьевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (19, N'smirnova.t.g', N'brYHdbq8d5pZZlOV4KPdMY6Y53avvEhI', N'SmirnovaTG', N'smirnova.t.g@unn.ru', N'Смирнова', N'Татьяна', N'Геннадьевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (20, N'alekseev.v.e', N'1V47aslQTVb3TsIB5YE8wjRgm5s89fNcFg==', N'AlekseevVE', N'alekseev.v.e@unn.ru', N'Алексеев', N'Владимир', N'Евгеньевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (21, N'zhilcova.l.p', N'G20U260V1HfuGRvl/9twyPrdZBjkpjcgOA==', N'ZhilcovaLP', N'zhilcova.l.p@unn.ru', N'Жильцова', N'Лариса', N'Павловна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (22, N'zaxarova.d.v', N'BNwy960wztuIAtIHETIRtw564o/os1SQ2as=', N'ZaxarovaDV', N'zaxarova.d.v@unn.ru', N'Захарова', N'Дарья', N'Владимировна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (23, N'kuzin.s.g', N'nOF5Mk82iGrWZ1jbJW/mz3frEQ15oZugmd5G', N'KuzinSG', N'kuzin.s.g@unn.ru', N'Кузин', N'Станислав', N'Григорьевич', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (24, N'krotov.n.v', N'vv8UWcq01XrbQ2OK05knVoEvGy8K3yfZ', N'KrotovNV', N'krotov.n.v@unn.ru', N'Кротов', N'Николай', N'Владимирович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (25, N'medvedev.t.v', N'oRUS0m9q3r4KpEYAwK4C3ngi7qoeX0ff7Q==', N'MedvedevTV', N'medvedev.t.v@unn.ru', N'Медведев', N'Тимур', N'Владиславович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (26, N'gordeeva.o.v', N'2d8HP5r4w11EBqOp2/0R44BF00F6Yw6Gy7M=', N'GordeevaOV', N'gordeeva.o.v@unn.ru', N'Гордеева', N'Ольга', N'Владимировна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (27, N'fokina.v.n', N'sjycCzSC1hVwLr3yYrl3HwUXQz5fgD2V/A==', N'FokinaVN', N'fokina.v.n@unn.ru', N'Фокина', N'Валентина', N'Николаевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (28, N'sizova.n.a', N'PxBmK22YObpYT+g4l1+9U6eyGDmDj2I8NX0=', N'SizovaNA', N'sizova.n.a@unn.ru', N'Сизова', N'Наталья', N'Александровна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (29, N'egamov.a.i', N'o15HlCaXSnEdazlYLvOsQGOorvyaix/aHw==', N'EgamovAI', N'egamov.a.i@unn.ru', N'Эгамов', N'Альюерт', N'Исмаилович', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (30, N'prismotrova.o.yu', N'BsAKz5UiDfmCV+9CZCtSx1fPk3oCPWArVygv', N'PrismotrovaOYU', N'prismotrova.o.yu@unn.ru', N'Присмотрова', N'Оксана', N'Юрьевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (31, N'yarunina.s.a', N'KcIiaU/MUpGTuW4umLSm8pUq18pdYEjFag==', N'YaruninaSA', N'yarunina.s.a@unn.ru', N'Ярунина', N'Светлана', N'Алексеевна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (32, N'zybceva.[.[', N'p81PuZwVhDi6/V78tuU9TGDPBQnftG4XlQ==', N'Zybceva[[', N'zybceva.[.[@unn.ru', N'Зыбцева', N'[имя]', N'[отчество]', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (33, N'petrova.l.p', N'D8J9JV/eIcebvj5+GC74XR6/wEIGo28o5w==', N'PetrovaLP', N'petrova.l.p@unn.ru', N'Петрова', N'Людмила', N'Платоновна', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (34, N'sorokina.[.[', N'zqlPyYRRoZewCBlHHPUN+sLHfZECR8wU0ayJ', N'Sorokina[[', N'sorokina.[.[@unn.ru', N'Сорокина', N'[имя]', N'[отчество]', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (35, N'komarova.[.[', N'JJ6nTLM169re4kg6Ld/8Ehr/CN3RJO1fpQ==', N'Komarova[[', N'komarova.[.[@unn.ru', N'Комарова', N'[имя]', N'[отчество]', N'Professor', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (36, N'alekseev.i.v', N'GTYRVH94CXoRzaNCgLwWxtGgZlc5Hw4+', N'AlekseevIV', N'alekseev.i.v@unn.ru', N'Алексеев', N'Илья', N'Владиславович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (37, N'andryushhenko.v.m', N'TxOfz4DuGIeCLxjRYQf33pGskJKs5HIoFt8x', N'AndryushhenkoVM', N'andryushhenko.v.m@unn.ru', N'Андрющенко', N'Виктория', N'Михайловна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (38, N'arxipov.a.i', N'ivTYprFx3Xu/ub8f5U6iP2qo0hCkA327hzuX', N'ArxipovAI', N'arxipov.a.i@unn.ru', N'Архипов', N'Алексей', N'Иванович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (39, N'batanova.e.v', N'eVb4vPU4vBX3D0rOA1EPtiMNGqK2XPnzEWVV', N'BatanovaEV', N'batanova.e.v@unn.ru', N'Батанова', N'Елизавета', N'Владимировна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (40, N'blagov.r.a', N'JqEwUhjjHHAaKtf2dixwUJfW19JmXOk5A9c=', N'BlagovRA', N'blagov.r.a@unn.ru', N'Благов', N'Роман', N'Алексеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (41, N'bogolyubov.o.i', N'EwVh1InAPUWRBpi9DHM8rsaT5cbh2MOMy0k=', N'BogolyubovOI', N'bogolyubov.o.i@unn.ru', N'Боголюбов', N'Олег', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (42, N'voinov.r.e', N'CEbQiD1kieF0oLkzGi4CMZmISiz+ynf1n+eO', N'VoinovRE', N'voinov.r.e@unn.ru', N'Воинов', N'Роман', N'Евгеньевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (43, N'golovinskij.m.n', N'fCnIXGY4VGwXYQuR2lfDUEr/oWYcJb7+fHI=', N'GolovinskijMN', N'golovinskij.m.n@unn.ru', N'Головинский', N'Михаил', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (44, N'golovko.a.m', N'mgqL4QgyFhKeiJsdtacg/dpi9M2YivqJ', N'GolovkoAM', N'golovko.a.m@unn.ru', N'Головко', N'Александра', N'Максимовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (45, N'zinkevich.i.v', N'81fmXaQSFb/dmsgLZyNkfqmjpKIFVV7Fxy8=', N'ZinkevichIV', N'zinkevich.i.v@unn.ru', N'Зинкевич', N'Иван', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (46, N'kalentev.a.i', N'qC87vBDniibUTi0FmLpv0xVeN34d9KyY9r4=', N'KalentevAI', N'kalentev.a.i@unn.ru', N'Калентьев', N'Александр', N'Иванович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (47, N'kandalova.t.v', N'BoCLaJ1U8hZsJef3Mb1I5fBpELd+7sAf', N'KandalovaTV', N'kandalova.t.v@unn.ru', N'Кандалова', N'Татьяна', N'Владиславовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (48, N'klyukina.e.s', N'ImmZNq1ZGRgCNz/s0lLBTVb5f/Flo+aJWJw=', N'KlyukinaES', N'klyukina.e.s@unn.ru', N'Клюкина', N'Елена', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (49, N'kozlova.n.a', N'F0QqlUgq2g/X6HrsqnnpMLMNPD0fkI70Pd95', N'KozlovaNA', N'kozlova.n.a@unn.ru', N'Козлова', N'Наталья', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (50, N'kochkina.yu.i', N'5dD2OVTyigt8ARAIoZO8LHRKWfsk197/', N'KochkinaYUI', N'kochkina.yu.i@unn.ru', N'Кочкина', N'Юлия', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (51, N'litvinov.i.yu', N'eYSu5fzq/eM1IYaMXmL5O6z6OZV58fOM9ccy', N'LitvinovIYU', N'litvinov.i.yu@unn.ru', N'Литвинов', N'Иван', N'Юрьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (52, N'perepelkina.e.v', N'X/4MNiIis6HkO69IR+CwULsRDzuVR1NluA==', N'PerepelkinaEV', N'perepelkina.e.v@unn.ru', N'Перепелкина', N'Евгения', N'Викторовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (53, N'ploxotnikova.k.d', N'lJqn/eDCbFxNJSBlaO3/Xs+YOvBMSUHQ1Q==', N'PloxotnikovaKD', N'ploxotnikova.k.d@unn.ru', N'Плохотникова', N'Ксения', N'Дэвивидовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (54, N'puxin.n.v', N'VHhrnJl5e3wU+xXCKItMC5FkR0IJU+TT', N'PuxinNV', N'puxin.n.v@unn.ru', N'Пухин', N'Никита', N'Васильевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (55, N'raxmatullin.a.r', N'MGpusownSaGCXAQLlgbblLiC670b1bxN+5Y=', N'RaxmatullinAR', N'raxmatullin.a.r@unn.ru', N'Рахматуллин', N'Артур', N'Ренатович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (56, N'sedyx.n.o', N'rM03ADDw6rbgZoRgOU5OSuMQDlRN0zuf3ZWI', N'SedyxNO', N'sedyx.n.o@unn.ru', N'Седых', N'Никита', N'Олегович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (57, N'silenko.a.i', N'Rm1Sa5jAbRVeUotxCOeVsNBEgQ2wXlQJ/Wk=', N'SilenkoAI', N'silenko.a.i@unn.ru', N'Силенко', N'Антон', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (58, N'skachkova.n.k', N'rHXl6fIlRaggHxKVeN3I/L7LZPPligoBVg4=', N'SkachkovaNK', N'skachkova.n.k@unn.ru', N'Скачкова', N'Наталия', N'Константиновна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (59, N'smirnova.o.a', N'zXjbz5N83vAUQvv8ZD0a1mN8SQdntSI6CQ==', N'SmirnovaOA', N'smirnova.o.a@unn.ru', N'Смирнова', N'Ольга', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (60, N'solovev.a.d', N'kRc7QDgJnxkpjPPZ3vgZp8Skp1U+2Mrs', N'SolovevAD', N'solovev.a.d@unn.ru', N'Соловьев', N'Андрей', N'Дмитриевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (61, N'spiridonov.m.i', N'yHNJteadF1ucGcXPN6ys4YhMxsbB/lMN', N'SpiridonovMI', N'spiridonov.m.i@unn.ru', N'Спиридонов', N'Максим', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (62, N'fedorov.a.v', N'KlBShO/Qserjj/pFqVJWzwEx9bwhLHi2DA==', N'FedorovAV', N'fedorov.a.v@unn.ru', N'Федоров', N'Артем', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (63, N'xrisanfova.s.o', N'gwn5eVmZvO46bmcHqY74MiNuiRDkQet6', N'XrisanfovaSO', N'xrisanfova.s.o@unn.ru', N'Хрисанфова', N'Светлана', N'Олеговна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (64, N'cvetnov.a.a', N'E9cdzdD6VaF375gHBlHJLFQQpakJIUGFKoI4', N'CvetnovAA', N'cvetnov.a.a@unn.ru', N'Цветнов', N'Алексей', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (65, N'shulgina.ya.a', N'D7Vj8mtNByXyIIIKZTTSN5RbSCR+3nXlzA==', N'ShulginaYAA', N'shulgina.ya.a@unn.ru', N'Шульгина', N'Яна', N'Андреевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (66, N'yanovskaya.a.d', N'dxvGKfAnV80WZUUVGqIY+ewuxqrl2C5ltQ==', N'YanovskayaAD', N'yanovskaya.a.d@unn.ru', N'Яновская', N'Анастасия', N'Дмитриевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (67, N'afanasev.i.a', N'esPAedaCSbB97uQKMrFHbmSeHz3Ozz3JoKM=', N'AfanasevIA', N'afanasev.i.a@unn.ru', N'Афанасьев', N'Илья', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (68, N'belyaev.g.s', N's7Sbz79of0eKFkgEaFL3P7Ohf5OTSp6r', N'BelyaevGS', N'belyaev.g.s@unn.ru', N'Беляев', N'Глеб', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (69, N'beskaev.s.g', N'weyXSH7/28+e/7WdlDMbd5P4XoXSitKbMAqV', N'BeskaevSG', N'beskaev.s.g@unn.ru', N'Беськаев', N'Сергей', N'Григорьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (70, N'bnyatov.s.i', N'kAPC8aIitXmDL3XUoJ+MTwrbG3YnrqtVWVc=', N'BnyatovSI', N'bnyatov.s.i@unn.ru', N'Бнятов', N'Сергей', N'Иванович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (71, N'bychkov.a.v', N'OwpYw4G98KoJ0TIUJmtyWr65ZrUa1jQYHD23', N'BychkovAV', N'bychkov.a.v@unn.ru', N'Бычков', N'Алексей', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (72, N'vixirev.a.yu', N'C5REmaAU96+syIeZW3g43YNV4RgF7VTJ/Ls=', N'VixirevAYU', N'vixirev.a.yu@unn.ru', N'Вихирев', N'Алексей', N'Юрьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (73, N'gezhes.n.a', N'ZGwxMP9kT64i1Xh79sys9CHgE+kkeDtyxEQ=', N'GezhesNA', N'gezhes.n.a@unn.ru', N'Гежес', N'Николай', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (74, N'emelyanova.t.k', N'7ehgEfkMnH3KeBYBjzd+6E7Wxq24D2AV1vc=', N'EmelyanovaTK', N'emelyanova.t.k@unn.ru', N'Емельянова', N'Татьяна', N'Константиновна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (75, N'efremova.n.s', N'4UtRrDmznuPr2vo0Sg/O4Grd5Ukh7E76oxnP', N'EfremovaNS', N'efremova.n.s@unn.ru', N'Ефремова', N'Надежда', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (76, N'znamenskij.yu.a', N'rOmNUpqvBs3LgqGMYZZw1Ia3Fi8i1uWq0g==', N'ZnamenskijYUA', N'znamenskij.yu.a@unn.ru', N'Знаменский', N'Юрий', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (77, N'kalyakulina.a.i', N'/hjqC7Cq0ptKeBg8e1iCx1NAVi0C8wnZvpyx', N'KalyakulinaAI', N'kalyakulina.a.i@unn.ru', N'Калякулина', N'Алена', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (78, N'kolesov.m.v', N'zwq7B3v5WQABG42V2UI7RSU8aVniX3dN', N'KolesovMV', N'kolesov.m.v@unn.ru', N'Колесов', N'Максим', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (79, N'korovin.n.m', N'c/YBcDLKHZ0mpmOmyQJes/oG9ccKQf88', N'KorovinNM', N'korovin.n.m@unn.ru', N'Коровин', N'Никита', N'Максимович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (80, N'krajnov.o.a', N'uutaBth/lCQ4dBPzHoirFi6gpCim+qLs37iU', N'KrajnovOA', N'krajnov.o.a@unn.ru', N'Крайнов', N'Олег', N'Анатольевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (81, N'lebedeva.v.v', N'4WpuZ4UcXRjGL22OE65QKqeV0Fpa2oje374=', N'LebedevaVV', N'lebedeva.v.v@unn.ru', N'Лебедева', N'Виктория', N'Вячеславовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (82, N'mamatulina.a.v', N's9DItw7LBRI5nz0JfUcv+7+zvjhEvhUwcJM=', N'MamatulinaAV', N'mamatulina.a.v@unn.ru', N'Маматулина', N'Александра', N'Викторовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (83, N'mitina.a.a', N'lj4WcvCJwBF1BW9tjmMZ+Jt6Y1/GjbGHTaEI', N'MitinaAA', N'mitina.a.a@unn.ru', N'Митина', N'Анна', N'Алексеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (84, N'morosin.d.n', N'nUru58T45WYGhpVEQk9pUHs6Ca/+TZwdjg==', N'MorosinDN', N'morosin.d.n@unn.ru', N'Моросин', N'Дмитрий', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (85, N'nechaev.s.i', N'kezrpnZgJMk+VmmxZmnHpWhRyuc75J1E', N'NechaevSI', N'nechaev.s.i@unn.ru', N'Нечаев', N'Сергей', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (86, N'oshoev.k.e', N'0mKSnhkuv4A31kiyN3mm5+I1ZrMFuBs78B8=', N'OshoevKE', N'oshoev.k.e@unn.ru', N'Ошоев', N'Кирилл', N'Евгеньевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (87, N'snigura.k.yu', N'FlRQ/SXx1Emq1o4AaCYcK9KISXMlw5tg', N'SniguraKYU', N'snigura.k.yu@unn.ru', N'Снигура', N'Кристина', N'Юрьевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (88, N'filicheva.s.yu', N'ur8tn5VEGbRR30gpYtGEHzEzgbjBaDv4yn+5', N'FilichevaSYU', N'filicheva.s.yu@unn.ru', N'Филичева', N'Светлана', N'Юрьевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (89, N'xanova.t.a', N'heItbFTc6aPKnGO6/C0D3mJHsqXRD9m/6A==', N'XanovaTA', N'xanova.t.a@unn.ru', N'Ханова', N'Татьяна', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (90, N'xozina.m.a', N'V0Jxa39Hz7iedGGVDik2tbQIyELQen8p+w8=', N'XozinaMA', N'xozina.m.a@unn.ru', N'Хозина', N'Мария', N'Анатольевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (91, N'xoxlov.a.v', N'T3XUMH0BWWcY+0JsTjI5Im5g86o8c6Ep7U0=', N'XoxlovAV', N'xoxlov.a.v@unn.ru', N'Хохлов', N'Александр', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (92, N'chirkov.b.a', N'q7uKDh4GI1h6M8i0jaZgfU1EFRw9TNwz', N'ChirkovBA', N'chirkov.b.a@unn.ru', N'Чирков', N'Борис', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (93, N'shalnov.k.l', N'hwi03nSuXrIOcLSNbtVJPeAhkfFjIAS5sa0=', N'ShalnovKL', N'shalnov.k.l@unn.ru', N'Шальнов', N'Кирилл', N'Леонидович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (94, N'yusipov.i.i', N'4Xowm+0aYIZelG1LhoWxOytS32RRQyc9', N'YusipovII', N'yusipov.i.i@unn.ru', N'Юсипов', N'Игорь', N'Ильясович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (95, N'ambarcumyan.v.a', N'wsqFu07/A4IlMbJ1neQnAVP/XThODR5G', N'AmbarcumyanVA', N'ambarcumyan.v.a@unn.ru', N'Амбарцумян', N'Ваагн', N'Ашотович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (96, N'babinceva.a.n', N'm2VavCuOVkTIW4ziLeV81tqTOEGqpXPZCbjL', N'BabincevaAN', N'babinceva.a.n@unn.ru', N'Бабинцева', N'Анна', N'Николаевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (97, N'baukina.m.a', N'cNSpLriqnyRH2Xxnc9Z+2nWWMBoO2dq6Gr4=', N'BaukinaMA', N'baukina.m.a@unn.ru', N'Баукина', N'Мария', N'Алексеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (98, N'bogdanova.yu.v', N'xmafRnqVPhRQQ9xraWTwmA1JLXbNYyWbNPSX', N'BogdanovaYUV', N'bogdanova.yu.v@unn.ru', N'Богданова', N'Юлия', N'Валерьевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (99, N'buzanov.v.v', N'eRmXhHqNyqpHMfVeDsWOKnmpT7DutCss', N'BuzanovVV', N'buzanov.v.v@unn.ru', N'Бузанов', N'Виктор', N'Васильевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (100, N'bulavina.e.s', N'Z3ZFbD0zIasVQ1a8P7DC3t/0StgFinLVeA==', N'BulavinaES', N'bulavina.e.s@unn.ru', N'Булавина', N'Екатерина', N'Станиславовна', N'Student', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (101, N'dudchenko.v.n', N'5dMlbGGqhB1XdlFhEUffJ8jqGJRfHocqAZtH', N'DudchenkoVN', N'dudchenko.v.n@unn.ru', N'Дудченко', N'Валерия', N'Николаевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (102, N'isaev.n.o', N'80QgnO8kRaGbdT7vyrRY9953XKe7T9oe', N'IsaevNO', N'isaev.n.o@unn.ru', N'Исаев', N'Никита', N'Олегович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (103, N'kalinina.o.a', N'visn/QLw2wAe9S1hxrrx06gl6UkKEekWp+c=', N'KalininaOA', N'kalinina.o.a@unn.ru', N'Калинина', N'Ольга', N'Алексеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (104, N'karashtin.p.b', N'QJ5rgjOG165ptYri/NpgAlqovq8Evz/Chzbb', N'KarashtinPB', N'karashtin.p.b@unn.ru', N'Караштин', N'Павел', N'Борисович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (105, N'kozlikina.k.e', N'HAhxpqX3xvcay7oxXZoGOvwjYtX13dXuWMw=', N'KozlikinaKE', N'kozlikina.k.e@unn.ru', N'Козликина', N'Ксения', N'Евгеньевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (106, N'koryukina.v.i', N'0xmXNKiqxAIAvgD1FbnNHhCd62vLWysSzmk=', N'KoryukinaVI', N'koryukina.v.i@unn.ru', N'Корюкина', N'Валерия', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (107, N'kosov.e.o', N'UTqGihS4LSb5Nz3SXMGa9a6gHcndrmf2qQ==', N'KosovEO', N'kosov.e.o@unn.ru', N'Косов', N'Евгений', N'Олегович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (108, N'lozhakova.t.a', N'bGye8jhsEI+uzBDlF1dgnxZDnFk372SmcUo=', N'LozhakovaTA', N'lozhakova.t.a@unn.ru', N'Ложакова', N'Татьяна', N'Андреевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (109, N'mineev.a.v', N'ct8q4bOsWjVWa8QzQMD2WbcEpxvFTMX0lmg=', N'MineevAV', N'mineev.a.v@unn.ru', N'Минеев', N'Александр', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (110, N'mitryakov.a.v', N'4Lc/q2XRRKT5OvIcj+aSdDVF19b1qN5l', N'MitryakovAV', N'mitryakov.a.v@unn.ru', N'Митряков', N'Алексей', N'Валерьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (111, N'mixajlov.v.s', N'6cKBV439EQMbEVLcDwLUT0aGyKLiUkrFbf8=', N'MixajlovVS', N'mixajlov.v.s@unn.ru', N'Михайлов', N'Владислав', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (112, N'moskina.e.o', N'RQ6mZPm5M2z5D04oiddCFPvcGJc0SixZm1w=', N'MoskinaEO', N'moskina.e.o@unn.ru', N'Моськина', N'Елена', N'Олеговна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (113, N'nuzhdin.a.d', N'p3OWqYdg+q/cB6xdt+mvtx06bji7aLAraCKf', N'NuzhdinAD', N'nuzhdin.a.d@unn.ru', N'Нуждин', N'Александр', N'Дмитриевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (114, N'prokudin.k.o', N'Q9OqoNB4g2qzOxUDAsQYc92pHNGtc1IMUmEj', N'ProkudinKO', N'prokudin.k.o@unn.ru', N'Прокудин', N'Кирилл', N'Олегович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (115, N'rodionova.k.a', N'OlrU0BHxI/xMo7MnshLbSaN+Sq+KhmoYQUo=', N'RodionovaKA', N'rodionova.k.a@unn.ru', N'Родионова', N'Ксения', N'Андреевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (116, N'saltykov.v.i', N'3It/u0JJa0MjX8eRVMYZydtToFv5v67i', N'SaltykovVI', N'saltykov.v.i@unn.ru', N'Салтыков', N'Валерий', N'Иванович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (117, N'undalov.s.a', N'jvGXagWNHfuGhv4Q5YRwfqH10Q2kCEkO', N'UndalovSA', N'undalov.s.a@unn.ru', N'Ундалов', N'Сергей', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (118, N'ushatkin.a.n', N'VpHzQUDt9MkhNaqncoAkFPdnH64hRwq0BQ==', N'UshatkinAN', N'ushatkin.a.n@unn.ru', N'Ушаткин', N'Антон', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (119, N'08103.a.p', N'MAZeLYE7KzpJ2y4xYdVmBI8mLFN82oqZNdI=', N'08103AP', N'08103.a.p@unn.ru', N'08103', N'а', N'приклдня мтемтик и информтик', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (120, N'danilov.i.a', N'NhCoEMUU8/XjUM9+a23qD2hcQeLOwQjeJeta', N'DanilovIA', N'danilov.i.a@unn.ru', N'Данилов', N'Иван', N'Алексеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (121, N'lebedev.yu.i', N'P479z0KhM0nFukmvP8FBf/CuipUwffLM+YEu', N'LebedevYUI', N'lebedev.yu.i@unn.ru', N'Лебедев', N'Юрий', N'Иванович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (122, N'sevrikov.i.e', N'd7Nysr5IVQpaJFFgi6iHSe+WUMV00K3oAQ==', N'SevrikovIE', N'sevrikov.i.e@unn.ru', N'Севриков', N'Илья', N'Евгеньевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (123, N'belova.a.i', N'ZFF8jyuao/xUd0hJ0QkUdncRq6dK5otKtLY=', N'BelovaAI', N'belova.a.i@unn.ru', N'Белова', N'Алена', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (124, N'dubrovskij.a.s', N'jNvdBbf4WrThNHigi8mM57AXfvsra2qYmC0=', N'DubrovskijAS', N'dubrovskij.a.s@unn.ru', N'Дубровский', N'Алексей', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (125, N'epifancev.a.v', N'CyoZHpsGbxF7JpfsCnkXUesHSrcldg+w4t70', N'EpifancevAV', N'epifancev.a.v@unn.ru', N'Епифанцев', N'Артем', N'Вячеславович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (126, N'zavylov.a.s', N'7DQzwygwg+M95fetAI1h16862btn9aaBCg==', N'ZavylovAS', N'zavylov.a.s@unn.ru', N'Завылов', N'Алексей', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (127, N'zykov.i.m', N'2FiwWidaG3MFdaXaGk0yCwBbvX+EZvNLlppH', N'ZykovIM', N'zykov.i.m@unn.ru', N'Зыков', N'Илья', N'Михайлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (128, N'korshikov.m.s', N'2LfTFcLPVW/urdpoRte4HjDer2LB9NTC', N'KorshikovMS', N'korshikov.m.s@unn.ru', N'Коршиков', N'Максим', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (129, N'kroshko.d.a', N'j+ZVd/7nD63FqscBa6D+/VrOjwosR8VZxRvH', N'KroshkoDA', N'kroshko.d.a@unn.ru', N'Крошко', N'Дмитрий', N'Анатольевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (130, N'lebedev.d.v', N'ICRtiqAVOrKA5pZwz+4NLJ8SgcSFlBtgiQ==', N'LebedevDV', N'lebedev.d.v@unn.ru', N'Лебедев', N'Дмитрий', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (131, N'lykina.o.a', N'k3PcbbnB/WX91qUMh4AtROcvAsoD0Qns', N'LykinaOA', N'lykina.o.a@unn.ru', N'Лыкина', N'Ольга', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (132, N'menzheres.k.n', N'H41GNNPO1Cec5l+YwbRO2K45d1VOP9N3hT+d', N'MenzheresKN', N'menzheres.k.n@unn.ru', N'Менжерес', N'Константин', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (133, N'meshheryakov.v.s', N'l6zwOXVl75sWKRVKX0q6cm7/MHXNlIOKNrE=', N'MeshheryakovVS', N'meshheryakov.v.s@unn.ru', N'Мещеряков', N'Владислав', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (134, N'mixejkina.e.n', N'Ubpn5H6fpVrTU0mQMZUxkLplIxY7NnjYyV4=', N'MixejkinaEN', N'mixejkina.e.n@unn.ru', N'Михейкина', N'Елена', N'Николаевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (135, N'murzaev.a.l', N'D8jZ282ZUjUZKDYrhiCVrSV+iOb8klCv+RL9', N'MurzaevAL', N'murzaev.a.l@unn.ru', N'Мурзаев', N'Андрей', N'Леонидович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (136, N'rozhkov.i.a', N'llWjAY31U9AjZmsNPlVQ/p/V7V5qTxOHXBc=', N'RozhkovIA', N'rozhkov.i.a@unn.ru', N'Рожков', N'Иван', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (137, N'rudenko.v.o', N'XMkc8xU8O8sVP5AsGUq/jRq1nBxrQViQ71+0', N'RudenkoVO', N'rudenko.v.o@unn.ru', N'Руденко', N'Валерий', N'Олегович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (138, N'semyanov.i.a', N'oz5NjP4pf6Qb3tASvNuDR04X54KaCDfyQ8o=', N'SemyanovIA', N'semyanov.i.a@unn.ru', N'Семьянов', N'Илья', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (139, N'sidorov.a.i', N'zy75gsSG+xjhSFjoacfg6N/NkYo2IMsSpP4=', N'SidorovAI', N'sidorov.a.i@unn.ru', N'Сидоров', N'Алексей', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (140, N'smirnova.a.s', N'+kGuw3tZNH9QcontKrcv4XphNOk2o1SxlQ==', N'SmirnovaAS', N'smirnova.a.s@unn.ru', N'Смирнова', N'Анастасия', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (141, N'sulin.d.a', N'BhqyGDPofI1LeBbOEANfYGhNuLBufAffvA4=', N'SulinDA', N'sulin.d.a@unn.ru', N'Сулин', N'Дмитрий', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (142, N'filippov.v.a', N'zUnoJMXUq7VV8/GYXAzjtB2yAyvG0pfXOq8=', N'FilippovVA', N'filippov.v.a@unn.ru', N'Филиппов', N'Валерий', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (143, N'fokin.a.s', N'F7TLkA8c4z5z8TbGu8xDOlVIOPBsKyeGHRE=', N'FokinAS', N'fokin.a.s@unn.ru', N'Фокин', N'Антон', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (144, N'francuzova.n.s', N'arNMl0LCjI+3edsszeMmxRH0Ofnatx7kHkQ=', N'FrancuzovaNS', N'francuzova.n.s@unn.ru', N'Французова', N'Наталья', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (145, N'xryuchkin.v.v', N'OvanY8yH5Zg6EGaH9XKgM7wcVM1RDJmznw==', N'XryuchkinVV', N'xryuchkin.v.v@unn.ru', N'Хрючкин', N'Валерий', N'Викторович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (146, N'burov.a.a', N'PTC/r/iJMgoWkLEES4JoZT4qDY8Oe8MWGw==', N'BurovAA', N'burov.a.a@unn.ru', N'Буров', N'Алексей', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (147, N'moxova.t.a', N'JJW0JorZS1BICxPR5H6PDeW0QVnwguO4', N'MoxovaTA', N'moxova.t.a@unn.ru', N'Мохова', N'Татьяна', N'Анатольевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (148, N'parygina.m.a', N'n6l2WkVbjBYuGEENJwcw1A1nwKQiGHrHVsYE', N'ParyginaMA', N'parygina.m.a@unn.ru', N'Парыгина', N'Марина', N'Александровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (149, N'sorokin.a.v', N'BnSDerZ8KvORLEEfH8hHvRPXFpSJczLiNw==', N'SorokinAV', N'sorokin.a.v@unn.ru', N'Сорокин', N'Артем', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (150, N'xarin.v.g', N'HWh+0Dm41XhvDj2dULctmX+7orwry1Ufz1w=', N'XarinVG', N'xarin.v.g@unn.ru', N'Харин', N'Владислав', N'Геннадьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (151, N'xramov.a.a', N'nFS3eo8EX4OFAO7yFKR7buPRphO7YJd2', N'XramovAA', N'xramov.a.a@unn.ru', N'Храмов', N'Александр', N'Андреевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (152, N'abramova.e.v', N'bJZP2dI1MJf0Vb4hNUEo0ENt8B1siRXf', N'AbramovaEV', N'abramova.e.v@unn.ru', N'Абрамова', N'Елена', N'Валерьевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (153, N'baldenkova.yu.p', N'HLXCD9IVJqpSLXytQKb6NLsNFKj27X9n', N'BaldenkovaYUP', N'baldenkova.yu.p@unn.ru', N'Балденкова', N'Юлия', N'Петровна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (154, N'burdina.o.i', N'pAG4r8sOa34Q8exDOEZB1364xXwZQFtGaQ==', N'BurdinaOI', N'burdina.o.i@unn.ru', N'Бурдина', N'Ольга', N'Игоревна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (155, N'kurevin.n.a', N'sVKi1ZTZvKqRsVbOHZ1zCtnqrliUcdVgvpcl', N'KurevinNA', N'kurevin.n.a@unn.ru', N'Куревин', N'Николай', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (156, N'noskova.m.k', N'5wjOdJ0bvuDUizhZqOcJzuldndIDGfkQ22bd', N'NoskovaMK', N'noskova.m.k@unn.ru', N'Носкова', N'Марина', N'Константиновна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (157, N'pervova.a.a', N'IVVqV88Y/9XrHKLaQOEORBbPdiEn6NB/kBI=', N'PervovaAA', N'pervova.a.a@unn.ru', N'Первова', N'Анастасия', N'Андреевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (158, N'sedova.a.e', N'qhjybQDLjx6FVdMhuns0VxULw4cKSxpB/w==', N'SedovaAE', N'sedova.a.e@unn.ru', N'Седова', N'Алёна', N'Евгеньевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (159, N'filimonova.a.a', N'k70kMy/EH/NNynALrFknPFNVB1RuoBgrGIg=', N'FilimonovaAA', N'filimonova.a.a@unn.ru', N'Филимонова', N'Анастасия', N'Алексеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (160, N'cverova.yu.s', N'cZL4y+EUsDtRRqfxDYH1k9ly55kVY3G1C1A=', N'CverovaYUS', N'cverova.yu.s@unn.ru', N'Цверова', N'Юлия', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (161, N'shherbakov.a.e', N'Fs9WbwkT12+eJIoXdFU8K79mrWl7EGN0cQ==', N'ShherbakovAE', N'shherbakov.a.e@unn.ru', N'Щербаков', N'Артем', N'Евгеньевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (162, N'bajgulov.i.v', N'BvOP/lpeHo1kKDF27dzLf4tbkdODDmoHPDI=', N'BajgulovIV', N'bajgulov.i.v@unn.ru', N'Байгулов', N'Игнатий', N'Валерьевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (163, N'gerasimov.a.m', N'm5qKwIGzR384mC6O1QBFUZcXMwStXYDo1c1k', N'GerasimovAM', N'gerasimov.a.m@unn.ru', N'Герасимов', N'Александр', N'Михайлович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (164, N'danilin.i.n', N'89gSfdp57VA6FDhb6iDUUedE/vcXpp3n0DVr', N'DanilinIN', N'danilin.i.n@unn.ru', N'Данилин', N'Илья', N'Николаевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (165, N'efremenko.a.s', N'LPo1bpR6b/xuAJdg2ZdPGutdUmFZ3Jtc5bg=', N'EfremenkoAS', N'efremenko.a.s@unn.ru', N'Ефременко', N'Артём', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (166, N'zajceva.v.v', N'xD8x6RjQpcLz5WnhO79dDJnLX14F4fbm7Q==', N'ZajcevaVV', N'zajceva.v.v@unn.ru', N'Зайцева', N'Виталия', N'Викторовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (167, N'kalinchev.a.v', N'mvYzqa/tdyqSgZvmshAnf2ENcVJEPdQk', N'KalinchevAV', N'kalinchev.a.v@unn.ru', N'Калинчев', N'Артём', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (168, N'kirin.i.d', N'D8nyugMuDl3wZFYrCJQL0W51RpwV7NB15x8=', N'KirinID', N'kirin.i.d@unn.ru', N'Кирин', N'Игорь', N'Дмитриевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (169, N'klimanov.v.a', N'6pA7UUobFZhR33Odi+fwMtt9ArIK6cGgscQ=', N'KlimanovVA', N'klimanov.v.a@unn.ru', N'Климанов', N'Виктор', N'Алексеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (170, N'kurochkina.a.k', N'FdOoivAUIDbiHGdB2mP9TW2wLmcp+p9o3AU=', N'KurochkinaAK', N'kurochkina.a.k@unn.ru', N'Курочкина', N'Александра', N'Константиновна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (171, N'lyskovcev.a.a', N'tIlhIcG1UWDlHfuLgyEb3Cm07+ctiZTg/WS7', N'LyskovcevAA', N'lyskovcev.a.a@unn.ru', N'Лысковцев', N'Артем', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (172, N'makarov.a.o', N'ipStwWoDmxGe/IrqVGjC2dVXfyXU+aYD', N'MakarovAO', N'makarov.a.o@unn.ru', N'Макаров', N'Александр', N'ович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (173, N'morev.s.e', N'mc8VKkX2yJhHO8qa35YuBu5iuEG1ocF10Q==', N'MorevSE', N'morev.s.e@unn.ru', N'Морев', N'Сергей', N'Евгеньевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (174, N'morozova.t.s', N'srr9FkXFccYOH5HltirrzI142OhSntutoIUN', N'MorozovaTS', N'morozova.t.s@unn.ru', N'Морозова', N'Татьяна', N'Сергеевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (175, N'perceva.m.v', N'K38xJ+sgCuESUuq4wxO+NB58V8LgAXJ7mCw=', N'PercevaMV', N'perceva.m.v@unn.ru', N'Перцева', N'Мария', N'Викторовна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (176, N'ryzhov.i.i', N'd7TPNgAdPK8HzkDJ3lQ4CqeoJl0mQrrDVg==', N'RyzhovII', N'ryzhov.i.i@unn.ru', N'Рыжов', N'Илья', N'Игоревич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (177, N'sabanova.t.m', N'BLZb03m6E4JsHQIAIsw+Zs/g5TE7UWEbgejJ', N'SabanovaTM', N'sabanova.t.m@unn.ru', N'Сабанова', N'Татьяна', N'Михайловна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (178, N'smirnova.a.a', N'leaNimXzTubqbtk+k8h2L/PWB5BBZVGdlw==', N'SmirnovaAA', N'smirnova.a.a@unn.ru', N'Смирнова', N'Анна', N'Андреевна', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (179, N'stolyarov.p.a', N'+AIIutBBhWhr2DlG1XCU/OGg1llBfszH', N'StolyarovPA', N'stolyarov.p.a@unn.ru', N'Столяров', N'Павел', N'Алексеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (180, N'suyarov.a.v', N'y8KFfGJeiL2kmXJ90Qa7mhvAF1XeizCJ', N'SuyarovAV', N'suyarov.a.v@unn.ru', N'Суяров', N'Александр', N'Владимирович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (181, N'tokarevskij.p.a', N'QbabvT1JaRFBwCvnWHhGmgiFKu+J/ljyeps=', N'TokarevskijPA', N'tokarevskij.p.a@unn.ru', N'Токаревский', N'Павел', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (182, N'tropichev.p.a', N'qUUZ7qrteLwh4/WFybnfXnWghNo62aYf', N'TropichevPA', N'tropichev.p.a@unn.ru', N'Тропичев', N'Павел', N'Александрович', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (183, N'shanin.d.s', N'HMtIh8ITm+YXDPiby99W6Z4I0JbKyuejdI0=', N'ShaninDS', N'shanin.d.s@unn.ru', N'Шанин', N'Дмитрий', N'Сергеевич', N'Student', NULL)
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role], [Photo]) VALUES (184, N'shatalov.b.e', N'Ua9+BcvtcjofIOtDwwIKDvLABUI5DCeHIiMr', N'ShatalovBE', N'shatalov.b.e@unn.ru', N'Шаталов', N'Богдан', N'Евгеньевич', N'Student', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[Specialities]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (1, 1, N'Прикладная математика и информатика', N'PMI', N'ПМИ', N'010500')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (2, 1, N'Прикладная информатика', N'PI', N'ПИ', N'080800')
INSERT [dbo].[Specialities] ([Id], [DepartmentId], [Title], [Alias], [Abbreviation], [Code]) VALUES (3, 1, N'Информационные технологии', N'IT', N'ИТ', N'010400')
SET IDENTITY_INSERT [dbo].[Specialities] OFF
/****** Object:  Table [dbo].[Chairs]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (2, 1, N'Отсутствует', N'Отсутствует', N'Otsutstvuet', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (3, 1, N'Кафедра теории управления и динамики машин', N'ТУДМ', N'TUDM', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (4, 1, N'Кафедра численного и функционального анализа', N'ЧиФА', N'CHiFA', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (5, 1, N'Кафедра математической логики и высшей алгебры', N'МЛиВА', N'MLiVA', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (6, 1, N'Кафедра прикладной математики', N'ПМ', N'PM', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (7, 1, N'Кафедра математического обеспечения ЭВМ', N'МОЭВМ', N'MOEVM', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (8, 1, N'Кафедра информатики и автоматизации научных исследований', N'ИАНИ', N'IANI', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (9, 1, N'Кафедра прикладной теории вероятностей', N'ПТВ', N'PTV', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (10, 1, N'Кафедра интеллектуальных информационных систем и геоинформатики', N'ИИСГео', N'IISGeo', NULL)
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (11, 1, N'Центр прикладной информатики', N'ЦПИ', N'CPI', NULL)
SET IDENTITY_INSERT [dbo].[Chairs] OFF
/****** Object:  Table [dbo].[Professors]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (2, 7, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (3, 7, N'д.т.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (4, 7, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (5, 7, N'к.т.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (6, 7, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (7, 7, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (8, 7, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (9, 7, N'к.т.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (10, 7, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (11, 7, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (12, 7, N'д.т.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (13, 5, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (14, 5, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (15, 5, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (16, 5, N'Отсутствует', N'ст.пр.', NULL, N'ст.пр.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (17, 5, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (18, 5, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (19, 5, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (20, 5, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (21, 5, N'д.ф.-м.н.', N'проф.', NULL, N'проф.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (22, 5, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (23, 11, N'к.т.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (24, 4, N'к.ф.-м.н.', N'доц.', NULL, N'доц.')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (25, 4, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (26, 4, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (27, 4, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (28, 4, N'Отсутствует', N'ассистент', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (29, 4, N'Отсутствует', N'ст.пр.', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (30, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (31, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (32, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (33, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (34, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About], [Rank]) VALUES (35, 2, N'Отсутствует', N'Отсутствует', NULL, N'Отсутствует')
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
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
	[Required] [bit] NOT NULL,
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] ON
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (1, 1, 2, 5, N'DM', N'Основы дискретной математики', N'МАТЕМАТИЧЕСКИЕ И ЕСТЕСТВЕННО-НАУЧНЫЕ ДИСЦИПЛИНЫ:Федеральный компонент', N'001', N'ДМ', 0)
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (2, 1, 2, 4, N'MA', N'Математический анализ', N'МАТЕМАТИЧЕСКИЕ И ЕСТЕСТВЕННО-НАУЧНЫЕ ДИСЦИПЛИНЫ:Федеральный компонент', N'002', N'МА', 0)
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (3, 1, 2, 5, N'GA', N'Геометрия и алгебра', N'МАТЕМАТИЧЕСКИЕ И ЕСТЕСТВЕННО-НАУЧНЫЕ ДИСЦИПЛИНЫ:Вузовский компонент', N'003', N'ГА', 0)
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (4, 1, 2, 7, N'Informatika', N'Информатика', N'ОБЩЕПРОФЕССИОНАЛЬНЫЕ ДИСЦИПЛИНЫ:Федеральный компонент', N'004', N'Информатика', 0)
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (5, 1, 2, 2, N'AYA', N'Английский язык', N'ОБЩЕПРОФЕССИОНАЛЬНЫЕ ДИСЦИПЛИНЫ:Федеральный компонент', N'005', N'АЯ', 0)
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [Alias], [Title], [Category], [Code], [Abbreviation], [Required]) VALUES (6, 1, 2, 7, N'MOOP', N'Методы объектно-ориентированного программирования', N'ОБЩЕПРОФЕССИОНАЛЬНЫЕ ДИСЦИПЛИНЫ:Вузовский компонент', N'006', N'МООП', 0)
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (1, 3, 7, 3, N'IPO', N'Инженерия программного обеспечения', N'ИПО', N'511921')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (2, 3, 7, 4, N'OtsutstvuetMOEVMIT', N'ОтсутствуетМОЭВМИТ', N'ОтсутствуетМОЭВМИТ', N'ОтсутствуетМОЭВМИТ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (3, 3, 7, 3, N'KG', N'Компьютерная графика', N'КГ', N'511908')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (4, 3, 5, 3, N'KN', N'Компьютерные науки', N'КН', N'Отсутствует')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (5, 3, 5, 4, N'OtsutstvuetMLiVAIT', N'ОтсутствуетМЛиВАИТ', N'ОтсутствуетМЛиВАИТ', N'ОтсутствуетМЛиВАИТ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (6, 1, 2, 4, N'OtsutstvuetOtsutstvuetPMI', N'ОтсутствуетОтсутствуетПМИ', N'ОтсутствуетОтсутствуетПМИ', N'ОтсутствуетОтсутствуетПМИ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (7, 2, 2, 4, N'OtsutstvuetOtsutstvuetPI', N'ОтсутствуетОтсутствуетПИ', N'ОтсутствуетОтсутствуетПИ', N'ОтсутствуетОтсутствуетПИ')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title], [Abbreviation], [Code]) VALUES (8, 3, 2, 4, N'OtsutstvuetOtsutstvuetIT', N'ОтсутствуетОтсутствуетИТ', N'ОтсутствуетОтсутствуетИТ', N'ОтсутствуетОтсутствуетИТ')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
/****** Object:  Table [dbo].[Groups]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (1, 1, 1, N'8101', N'8101')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (2, 1, 1, N'8102', N'8102')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (3, 1, 1, N'8103', N'8103')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (4, 1, 1, N'8104', N'8104')
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (5, 2, 1, N'8105', N'8105')
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (1, 6, 6, 1, 6, N'Вторник', N'9:40', 6, 102, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (2, 6, 1, 1, 22, N'Среда', N'14:40', 6, 512, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (3, 6, 2, 1, 28, N'Среда', N'16:20', 6, 514, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (4, 6, 3, 1, 15, N'Среда', N'18:00', 6, 509, N'Нижняя', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (5, 6, 5, 1, 31, N'Четверг', N'9:40', 2, 310, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (6, 6, 5, 1, 31, N'Суббота', N'13:00', 6, 102, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (7, 6, 3, 1, 15, N'Суббота', N'14:40', 6, 515, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (8, 6, 2, 1, 28, N'Суббота', N'16:20', 6, 102, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (9, 6, 6, 1, 4, N'Вторник', N'14:40', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (10, 6, 5, 1, 32, N'Вторник', N'18:00', 2, 8, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (11, 6, 1, 1, 22, N'Среда', N'14:40', 6, 512, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (12, 6, 2, 1, 28, N'Среда', N'16:20', 6, 514, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (13, 6, 3, 1, 15, N'Среда', N'18:00', 6, 509, N'Нижняя', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (14, 6, 5, 1, 32, N'Суббота', N'13:00', 6, 506, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (15, 6, 3, 1, 15, N'Суббота', N'14:40', 6, 515, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (16, 6, 2, 1, 28, N'Суббота', N'16:20', 6, 102, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (17, 6, 2, 2, 25, N'Понедельник', N'11:20', 2, 306, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (18, 6, 3, 2, 13, N'Вторник', N'14:40', 6, 502, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (19, 6, 5, 2, 34, N'Вторник', N'16:20', 6, 502, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (20, 6, 3, 2, 13, N'Среда', N'14:40', 2, 310, N'Нижняя', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (21, 6, 1, 2, 19, N'Среда', N'16:20', 6, 515, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (22, 6, 5, 2, 34, N'Пятница', N'13:00', 6, 514, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (23, 6, 6, 2, 6, N'Суббота', N'11:20', 2, 317, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (24, 6, 2, 2, 25, N'Суббота', N'13:00', 2, 338, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (25, 6, 2, 2, 25, N'Понедельник', N'11:20', 2, 306, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (26, 6, 3, 2, 13, N'Вторник', N'14:40', 6, 502, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (27, 6, 3, 2, 13, N'Среда', N'14:40', 2, 310, N'Нижняя', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (28, 6, 1, 2, 19, N'Среда', N'16:20', 6, 515, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (29, 6, 5, 2, 32, N'Суббота', N'9:40', 2, 8, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (30, 6, 5, 2, 32, N'Суббота', N'11:20', 2, 8, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (31, 6, 2, 2, 25, N'Суббота', N'13:00', 2, 338, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (32, 6, 6, 2, 11, N'Суббота', N'14:40', 6, 506, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (33, 6, 1, 3, 21, N'Понедельник', N'11:20', 2, 307, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (34, 6, 3, 3, 14, N'Вторник', N'14:40', 6, 102, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (35, 6, 3, 3, 14, N'Вторник', N'16:20', 6, 102, N'Верхняя', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (36, 6, 2, 3, 29, N'Среда', N'8:00', 2, 324, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (37, 6, 2, 3, 29, N'Среда', N'9:40', 2, 307, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (38, 6, 5, 3, 33, N'Среда', N'11:20', 2, 8, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (39, 6, 5, 3, 33, N'Пятница', N'13:00', 2, 8, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (40, 6, 6, 3, 7, N'Суббота', N'14:40', 6, 514, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (41, 6, 1, 3, 21, N'Понедельник', N'11:20', 2, 307, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (42, 6, 5, 3, 30, N'Понедельник', N'13:00', 2, 8, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (43, 6, 3, 3, 14, N'Вторник', N'14:40', 6, 102, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (44, 6, 3, 3, 14, N'Вторник', N'16:20', 6, 102, N'Верхняя', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (45, 6, 2, 3, 29, N'Среда', N'8:00', 2, 324, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (46, 6, 2, 3, 29, N'Среда', N'9:40', 2, 307, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (47, 6, 5, 3, 30, N'Среда', N'11:20', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (48, 6, 6, 3, 8, N'Суббота', N'16:20', 6, 515, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (49, 6, 6, 4, 3, N'Понедельник', N'11:20', 2, 317, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (50, 6, 1, 4, 22, N'Вторник', N'8:00', 2, 303, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (51, 6, 2, 4, 26, N'Вторник', N'9:40', 2, 310, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (52, 6, 5, 4, 33, N'Среда', N'13:00', 2, 8, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (53, 6, 3, 4, 15, N'Среда', N'16:20', 6, 102, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (54, 6, 3, 4, 15, N'Среда', N'18:00', 6, 509, N'Верхняя', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (55, 6, 5, 4, 33, N'Пятница', N'11:20', 2, 8, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (56, 6, 2, 4, 26, N'Пятница', N'13:00', 0, 0, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (57, 6, 6, 4, 4, N'Понедельник', N'13:00', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (58, 6, 1, 4, 22, N'Вторник', N'8:00', 2, 303, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (59, 6, 2, 4, 26, N'Вторник', N'9:40', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (60, 6, 5, 4, 30, N'Среда', N'13:00', 6, 509, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (61, 6, 5, 4, 30, N'Среда', N'14:40', 6, 515, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (62, 6, 3, 4, 15, N'Среда', N'16:20', 6, 102, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (63, 6, 3, 4, 15, N'Среда', N'18:00', 6, 509, N'Верхняя', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (64, 6, 2, 4, 26, N'Пятница', N'13:00', 0, 0, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (65, 6, 2, 5, 27, N'Вторник', N'8:00', 2, 234, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (66, 6, 1, 5, 22, N'Вторник', N'9:40', 2, 234, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (67, 6, 6, 5, 7, N'Среда', N'8:00', 2, 310, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (68, 6, 3, 5, 16, N'Среда', N'11:20', 2, 324, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (69, 6, 2, 5, 27, N'Среда', N'13:00', 2, 310, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (70, 6, 3, 5, 16, N'Пятница', N'13:00', 2, 234, N'Верхняя', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (71, 6, 5, 5, 35, N'Суббота', N'11:20', 4, 505, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (72, 6, 5, 5, 35, N'Суббота', N'13:00', 6, 515, N'Каждая', N'Практика', N'Первая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (73, 6, 2, 5, 27, N'Вторник', N'8:00', 2, 234, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (74, 6, 1, 5, 22, N'Вторник', N'9:40', 2, 234, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (75, 6, 6, 5, 11, N'Среда', N'9:40', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (76, 6, 3, 5, 16, N'Среда', N'11:20', 2, 324, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (77, 6, 2, 5, 27, N'Среда', N'13:00', 2, 310, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (78, 6, 3, 5, 16, N'Пятница', N'13:00', 2, 234, N'Верхняя', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (79, 6, 5, 5, 35, N'Суббота', N'14:40', 2, 307, N'Каждая', N'Практика', N'Вторая')
INSERT [dbo].[PracticeAndLabTimetables] ([Id], [SpecializationId], [SpecialityDisciplineId], [GroupId], [ProfessorId], [Day], [Time], [Building], [Room], [Week], [Type], [Part]) VALUES (80, 6, 5, 5, 35, N'Суббота', N'16:20', 2, 307, N'Каждая', N'Практика', N'Вторая')
SET IDENTITY_INSERT [dbo].[PracticeAndLabTimetables] OFF
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (1, 1, 20, N'Понедельник', N'8:00', 4, 221, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (2, 2, 24, N'Понедельник', N'9:40', 4, 221, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (3, 2, 24, N'Вторник', N'13:00', 2, 338, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (4, 3, 17, N'Четверг', N'13:00', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (5, 4, 23, N'Четверг', N'14:40', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (6, 4, 23, N'Четверг', N'16:20', 2, 314, N'Верхняя')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (7, 6, 9, N'Пятница', N'14:40', 2, 314, N'Каждая')
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (8, 6, 9, N'Пятница', N'16:20', 2, 314, N'Каждая')
SET IDENTITY_INSERT [dbo].[LectureTimetables] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 10/27/2010 22:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityDisciplineTopics](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_SpecialityDisciplineTopics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (1, 1, 1, 2, 2, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (2, 2, 1, 4, 4, 0, 18, N'Зачет, Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (3, 3, 1, 2, 3, 0, 18, N'Зачет, Экзамен')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (4, 4, 1, 3, 0, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (5, 5, 1, 0, 4, 0, 18, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [WeeksVolume], [Reporting]) VALUES (6, 6, 1, 4, 2, 0, 18, N'Экзамен')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Table [dbo].[SpecialityDisciplinesProfessors]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (1, 19)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (1, 20)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (1, 21)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (1, 22)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 24)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 25)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 26)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 27)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 28)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (2, 29)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 13)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 14)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 15)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 16)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (3, 17)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (4, 23)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 30)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 31)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 32)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 33)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 34)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (5, 35)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 3)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 4)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 6)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 7)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 8)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 9)
INSERT [dbo].[SpecialityDisciplinesProfessors] ([SpecialityDisciplineId], [ProfessorId]) VALUES (6, 11)
/****** Object:  Table [dbo].[SpecialityDisciplineProgram]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (36, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (37, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (38, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (39, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (40, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (41, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (42, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (43, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (44, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (45, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (46, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (47, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (48, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (49, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (50, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (51, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (52, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (53, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (54, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (55, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (56, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (57, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (58, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (59, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (60, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (61, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (62, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (63, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (64, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (65, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (66, 1, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (67, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (68, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (69, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (70, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (71, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (72, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (73, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (74, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (75, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (76, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (77, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (78, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (79, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (80, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (81, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (82, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (83, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (84, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (85, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (86, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (87, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (88, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (89, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (90, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (91, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (92, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (93, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (94, 2, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (95, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (96, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (97, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (98, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (99, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (100, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (101, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (102, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (103, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (104, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (105, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (106, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (107, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (108, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (109, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (110, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (111, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (112, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (113, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (114, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (115, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (116, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (117, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (118, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (119, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (120, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (121, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (122, 3, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (123, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (124, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (125, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (126, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (127, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (128, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (129, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (130, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (131, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (132, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (133, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (134, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (135, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (136, 4, 2, 6)
GO
print 'Processed 100 total records'
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (137, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (138, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (139, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (140, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (141, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (142, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (143, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (144, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (145, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (146, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (147, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (148, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (149, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (150, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (151, 4, 2, 6)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (152, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (153, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (154, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (155, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (156, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (157, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (158, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (159, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (160, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (161, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (162, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (163, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (164, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (165, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (166, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (167, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (168, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (169, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (170, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (171, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (172, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (173, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (174, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (175, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (176, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (177, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (178, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (179, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (180, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (181, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (182, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (183, 5, 2, 7)
INSERT [dbo].[Students] ([UserId], [GroupId], [ChairId], [SpecializationId]) VALUES (184, 5, 2, 7)
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[GroupsLectureTimetables]    Script Date: 10/27/2010 22:14:05 ******/
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
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (1, 1, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (2, 1, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (3, 1, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (4, 1, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (5, 1, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (6, 1, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (7, 1, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (8, 1, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (9, 1, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (10, 1, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (11, 1, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (12, 1, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (13, 1, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (14, 1, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (15, 1, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (16, 1, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (17, 2, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (18, 2, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (19, 2, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (20, 2, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (21, 2, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (22, 2, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (23, 2, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (24, 2, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (25, 2, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (26, 2, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (27, 2, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (28, 2, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (29, 2, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (30, 2, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (31, 2, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (32, 2, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (33, 3, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (34, 3, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (35, 3, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (36, 3, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (37, 3, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (38, 3, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (39, 3, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (40, 3, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (41, 3, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (42, 3, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (43, 3, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (44, 3, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (45, 3, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (46, 3, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (47, 3, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (48, 3, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (49, 4, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (50, 4, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (51, 4, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (52, 4, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (53, 4, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (54, 4, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (55, 4, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (56, 4, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (57, 4, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (58, 4, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (59, 4, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (60, 4, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (61, 4, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (62, 4, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (63, 4, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (64, 4, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (65, 5, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (66, 5, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (67, 5, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (68, 5, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (69, 5, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (70, 5, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (71, 5, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (72, 5, 8)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (73, 5, 1)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (74, 5, 2)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (75, 5, 3)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (76, 5, 4)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (77, 5, 5)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (78, 5, 6)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (79, 5, 7)
INSERT [dbo].[GroupsLectureTimetables] ([Id], [GroupId], [LectureTimetableId]) VALUES (80, 5, 8)
SET IDENTITY_INSERT [dbo].[GroupsLectureTimetables] OFF
/****** Object:  Table [dbo].[Razdels]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 10/27/2010 22:14:05 ******/
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
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 10/27/2010 22:14:05 ******/
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
/****** Object:  Default [DF_SpecialityDisciplines_Required]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplines] ADD  CONSTRAINT [DF_SpecialityDisciplines_Required]  DEFAULT ((1)) FOR [Required]
GO
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_Groups_Specialities]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Specialities]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplinesProfessors_Professors]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplinesProfessors_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors] CHECK CONSTRAINT [FK_SpecialityDisciplinesProfessors_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplinesProfessors] CHECK CONSTRAINT [FK_SpecialityDisciplinesProfessors_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineProgram_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[SpecialityDisciplineProgram]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineProgram_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineProgram] CHECK CONSTRAINT [FK_SpecialityDisciplineProgram_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_Students_Chairs]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Chairs]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Specializations]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Specializations]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_GroupsLectureTimetables_Groups]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GroupsLectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_GroupsLectureTimetables_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectureTimetables] CHECK CONSTRAINT [FK_GroupsLectureTimetables_Groups]
GO
/****** Object:  ForeignKey [FK_GroupsLectureTimetables_LectureTimetables]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GroupsLectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_GroupsLectureTimetables_LectureTimetables] FOREIGN KEY([LectureTimetableId])
REFERENCES [dbo].[LectureTimetables] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectureTimetables] CHECK CONSTRAINT [FK_GroupsLectureTimetables_LectureTimetables]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 10/27/2010 22:14:05 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
