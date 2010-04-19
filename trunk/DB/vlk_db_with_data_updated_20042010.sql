USE [VLK_DB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (7, N'pkunilov', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KunilovPE', N'pkunilov@mail.ru', N'Кунилов', N'Петр', N'Евгеньевич', N'Admin, Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (8, N'petrova.l.p', N'AN/bO/ZDTkR6Dyvww7LARv6p1I8ypFIBScLu', N'PetrovaLP', N'petrova.l.p@unn.ru', N'Петрова', N'Людмила', N'Прокофьевна', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (9, N'Ne_ukazan', N'BP7uGNGVAVxaHD/AQVlmuw6cUscWM6Vz', N'Ne_ukazan_201004131016262156', N'Ne_ukazan@unn.ru', N'Не указан', N' ', N' ', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (10, N'petrov.a.a', N'qzhhN86jNo5ofE7jMzld9AViHr3MK2lbCTg9', N'PetrovAA', N'petrov.a.a@unn.ru', N'Петров', N'А', N'А', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (11, N'kovzhbaya.l.s', N'grPZkuzS+kq4/FgoyuWjLnGkMqzw2a2xvkM=', N'KovzhbayaLS', N'kovzhbaya.l.s@unn.ru', N'Ковжбая', N'Л', N'С', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (12, N'maslovskij.m.v', N'er3Tzgb2SDTgqhk0w49ckPcgDFQJdpAW', N'MaslovskijMV', N'maslovskij.m.v@unn.ru', N'Масловский', N'М', N'В', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (13, N'dolgova.n.b', N'HD3kjYcvjH+hHjPMmSwRgXtiqHupw0MN3HDb', N'DolgovaNB', N'dolgova.n.b@unn.ru', N'Долгова', N'Н', N'Б', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (14, N'bondin.v.v', N'oM+uucLu7VlphbvsqL76VUJS0iuzYqRjQhM=', N'BondinVV', N'bondin.v.v@unn.ru', N'Бондин', N'В', N'В', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (15, N'sidorenko.d.e', N'IlKdkIlm76iGRYoRAytVNy/epDKZOCTrjw==', N'SidorenkoDE', N'sidorenko.d.e@unn.ru', N'Сидоренко', N'Д', N'Е', N'Professor')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (16, N'savelev.v.p', N'vV7QdT73CSx8erQrge5lpSepdaiGuWBLmJI=', N'SavelevVP', N'savelev.v.p@unn.ru', N'Савельев', N'В', N'П', N'Professor')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[Specialities]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[Chairs]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (2, 1, N'Кафедра численного и функционального анализа', N'ЧиФА            ', N'CHiFA', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (3, 1, N'Кафедра математической логики и высшей алгебры', N'МЛиВА           ', N'MLIVA', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (4, 1, N'Кафедра прикладной математики', N'ПМ              ', N'PM', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (5, 1, N'Кафедра математического обеспечения ЭВМ', N'МОЭВМ           ', N'MO', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (6, 1, N'Кафедра информатики и автоматизации научных исследований', N'ИАНИ            ', N'IANI', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (7, 1, N'Кафедра прикладной теории вероятностей', N'ПТВ             ', N'PTV', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (8, 1, N'Кафедра интеллектуальных информационных систем и геоинформатики', N'ИИСГЕО          ', N'IISGEO', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (9, 1, N'Центр прикладной информатики', N'ЦПИ             ', N'CPI', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (10, 1, N'Новая', N'Новая', N'New', N'О кафедре')
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (11, 1, N'Не указана', N'Не указана', N'None', N'О кафедре')
SET IDENTITY_INSERT [dbo].[Chairs] OFF
/****** Object:  Table [dbo].[Professors]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (8, 11, N'Не указана', N'ст. преп.', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (9, 11, N'Не указана', N'Не указана', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (10, 11, N'кин', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (11, 11, N'Не указана', N'Не указана', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (12, 11, N'кфн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (13, 11, N'кфн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (14, 11, N'кэн', N'доц', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (15, 11, N'Не указана', N'Не указана', N'О себе')
INSERT [dbo].[Professors] ([UserId], [ChairId], [Degree], [Position], [About]) VALUES (16, 11, N'кфмн', N'доц', N'О себе')
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 04/20/2010 01:03:03 ******/
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
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] ON
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (5, 3, 1, 1, 7, N'Matan', N'МатАн', N'ДС:1:СПД')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (6, 3, 2, 1, 7, N'FunCan', N'ФунКан', N'ДН:ФК')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (7, 3, 3, 11, 7, N'English', N'Английский язык', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (8, 3, 3, 11, 7, N'PhysicalTraining', N'Физическая культура', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (9, 3, 3, 11, 10, N'RussianHistory', N'Отечественная история', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (10, 3, 3, 11, 11, N'Jurisprudence', N'Правоведение', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (11, 3, 3, 11, 12, N'Sociology', N'Социология', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (12, 3, 3, 11, 13, N'Philosophy', N'Философия', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (13, 3, 3, 11, 9, N'RussianLanguage', N'Русский язык и культура речи', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (14, 3, 3, 11, 14, N'Economy', N'Экономика', N'ДН')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (15, 3, 3, 11, 15, N'OBJ', N'Защита населения в ЧС', N'ДН:ВК')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (16, 3, 3, 11, 16, N'NaturalSciences', N'Концепция современного естествознания', N'ДН:ВК')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 04/20/2010 01:03:03 ******/
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
SET IDENTITY_INSERT [dbo].[Specializations] ON
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title]) VALUES (1, 3, 1, 1, N'Spez1', N'Специализация1')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title]) VALUES (2, 3, 1, 1, N'Spez2', N'Специализация2')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title]) VALUES (3, 3, 4, 2, N'Spez3', N'Специализация1')
INSERT [dbo].[Specializations] ([Id], [SpecialityId], [ChairId], [EducationPlanId], [Alias], [Title]) VALUES (4, 3, 4, 2, N'Spez4', N'Специализация2')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (1, 5, N'Первая тема')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (2, 5, N'Вторая тема')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] OFF
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[Razdels]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (1, 1, N'Введение', -1)
SET IDENTITY_INSERT [dbo].[Razdels] OFF
/****** Object:  Table [dbo].[Questions]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (2, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image12.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (3, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (4, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image16" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (5, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image19" /> отображена в таблице):<br />  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image20" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (6, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image21" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (7, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image22.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (8, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="System.Web.HttpServerUtilityWrapper\Image23.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (9, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (10, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="System.Web.HttpServerUtilityWrapper\Image27" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (11, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="System.Web.HttpServerUtilityWrapper\Image30" /> отображена в таблице):<br />  <image src="System.Web.HttpServerUtilityWrapper\Image31" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (12, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.HttpServerUtilityWrapper\Image32" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (13, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.HttpServerUtilityWrapper\Image33.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (14, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="System.Web.HttpServerUtilityWrapper\Image34.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (15, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (16, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="System.Web.HttpServerUtilityWrapper\Image38" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (17, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="System.Web.HttpServerUtilityWrapper\Image41" /> отображена в таблице):<br />  <image src="System.Web.HttpServerUtilityWrapper\Image42" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (18, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.HttpServerUtilityWrapper\Image43" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (19, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.HttpServerUtilityWrapper\Image44.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (20, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="System.Web.Mvc.UrlHelper\Image45.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (21, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (22, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="System.Web.Mvc.UrlHelper\Image49" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (23, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="System.Web.Mvc.UrlHelper\Image52" /> отображена в таблице):<br />  <image src="System.Web.Mvc.UrlHelper\Image53" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (24, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.Mvc.UrlHelper\Image54" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (25, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.Mvc.UrlHelper\Image55.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (26, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="System.Web.Mvc.UrlHelper\Image56.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (27, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (28, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="System.Web.Mvc.UrlHelper\Image60" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (29, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="System.Web.Mvc.UrlHelper\Image63" /> отображена в таблице):<br />  <image src="System.Web.Mvc.UrlHelper\Image64" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (30, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.Mvc.UrlHelper\Image65" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (31, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="System.Web.Mvc.UrlHelper\Image66.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (32, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images\Image67.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (33, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (34, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images\Image71" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (35, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images\Image74" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images\Image75" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (36, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images\Image76" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (37, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images\Image77.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (38, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image78.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (39, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (40, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image82" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (41, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image85" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image86" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (42, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image87" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (43, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image88.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (44, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image89.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (45, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (46, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image93" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (47, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image96" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image97" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (48, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image98" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (49, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image99.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (50, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image100.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (51, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (52, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image104" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (53, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image107" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image108" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (54, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image109" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (55, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image110.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (56, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image111.jpg" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (57, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (58, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image115" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (59, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image118" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image119" /> <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (60, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image120" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (61, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image121.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (62, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image1.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (63, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (64, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image5.jpg" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (65, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image8.jpg" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image9.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (66, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image10.jpg" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (67, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image11.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (68, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image12.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (69, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (70, 1, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image16.jpg" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (71, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image19.jpg" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image20.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (72, 1, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image21.jpg" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (73, 1, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image22.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 1, 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[Groups]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Groups] ([Id], [SpecialityId], [DepartmentId], [Alias], [Title]) VALUES (2, 2, 1, N'86M1', N'86М1')
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 04/20/2010 01:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON
INSERT [dbo].[Students] ([UserId], [GroupId]) VALUES (7, 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 04/20/2010 01:03:03 ******/
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
 CONSTRAINT [PK_assigned_test_variants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 04/20/2010 01:03:03 ******/
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
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 04/20/2010 01:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_practice_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 04/20/2010 01:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[SpecialityDisciplineTopicId] [bigint] NOT NULL,
	[Date] [datetime] NULL,
	[Volume] [smallint] NOT NULL,
 CONSTRAINT [PK_lecture_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LecturePlans] ON
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date], [Volume]) VALUES (1, 5, 1, CAST(0x00009E1A00000000 AS DateTime), 2)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date], [Volume]) VALUES (5, 5, 2, NULL, 4)
SET IDENTITY_INSERT [dbo].[LecturePlans] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (1, 7, 1, 0, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (2, 7, 2, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (3, 7, 3, 0, 4, 0, N'Экзам.')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (4, 7, 4, 0, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (5, 8, 1, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (6, 8, 2, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (7, 8, 3, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (8, 8, 4, 0, 4, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (9, 9, 2, 2, 1, 0, N'Экзам.')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (10, 10, 8, 3, 0, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (11, 11, 6, 2, 1, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (12, 12, 4, 2, 2, 0, N'Экзам.')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (13, 13, 7, 0, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (14, 14, 5, 2, 1, 0, N'Экзам.')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (15, 15, 7, 2, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (16, 16, 6, 2, 2, 0, N'Кур. раб.')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (17, 5, 1, 2, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (18, 5, 2, 4, 2, 0, N'Экзамен')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 04/20/2010 01:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureTimetables](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
	[Day] [nvarchar](255) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Building] [smallint] NOT NULL,
	[Room] [smallint] NOT NULL,
 CONSTRAINT [PK_lectures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 04/20/2010 01:03:03 ******/
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
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (1, 2, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (2, 3, N' <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image13" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (3, 3, N' <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image14" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (4, 3, N' <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image15" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (5, 4, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (6, 4, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (7, 4, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (8, 4, N'функцией из класса  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image17" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (9, 4, N'функцией из класса  <image src="C:\Documents and Settings\Home\Рабочий стол\UNN\VmkLearningKit\VmkLearningKit\Uploads\Images\Image18" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (10, 5, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (11, 5, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (12, 6, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (13, 6, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (14, 6, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (15, 7, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (16, 8, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (17, 9, N' <image src="System.Web.HttpServerUtilityWrapper\Image24" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (18, 9, N' <image src="System.Web.HttpServerUtilityWrapper\Image25" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (19, 9, N' <image src="System.Web.HttpServerUtilityWrapper\Image26" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (20, 10, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (21, 10, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (22, 10, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (23, 10, N'функцией из класса  <image src="System.Web.HttpServerUtilityWrapper\Image28" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (24, 10, N'функцией из класса  <image src="System.Web.HttpServerUtilityWrapper\Image29" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (25, 11, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (26, 11, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (27, 12, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (28, 12, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (29, 12, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (30, 13, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (31, 14, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (32, 15, N' <image src="System.Web.HttpServerUtilityWrapper\Image35" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (33, 15, N' <image src="System.Web.HttpServerUtilityWrapper\Image36" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (34, 15, N' <image src="System.Web.HttpServerUtilityWrapper\Image37" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (35, 16, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (36, 16, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (37, 16, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (38, 16, N'функцией из класса  <image src="System.Web.HttpServerUtilityWrapper\Image39" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (39, 16, N'функцией из класса  <image src="System.Web.HttpServerUtilityWrapper\Image40" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (40, 17, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (41, 17, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (42, 18, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (43, 18, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (44, 18, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (45, 19, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (46, 20, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (47, 21, N' <image src="System.Web.Mvc.UrlHelper\Image46" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (48, 21, N' <image src="System.Web.Mvc.UrlHelper\Image47" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (49, 21, N' <image src="System.Web.Mvc.UrlHelper\Image48" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (50, 22, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (51, 22, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (52, 22, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (53, 22, N'функцией из класса  <image src="System.Web.Mvc.UrlHelper\Image50" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (54, 22, N'функцией из класса  <image src="System.Web.Mvc.UrlHelper\Image51" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (55, 23, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (56, 23, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (57, 24, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (58, 24, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (59, 24, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (60, 25, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (61, 26, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (62, 27, N' <image src="System.Web.Mvc.UrlHelper\Image57" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (63, 27, N' <image src="System.Web.Mvc.UrlHelper\Image58" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (64, 27, N' <image src="System.Web.Mvc.UrlHelper\Image59" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (65, 28, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (66, 28, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (67, 28, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (68, 28, N'функцией из класса  <image src="System.Web.Mvc.UrlHelper\Image61" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (69, 28, N'функцией из класса  <image src="System.Web.Mvc.UrlHelper\Image62" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (70, 29, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (71, 29, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (72, 30, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (73, 30, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (74, 30, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (75, 31, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (76, 32, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (77, 33, N' <image src="http://localhost:1111/Uploads/Images\Image68" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (78, 33, N' <image src="http://localhost:1111/Uploads/Images\Image69" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (79, 33, N' <image src="http://localhost:1111/Uploads/Images\Image70" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (80, 34, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (81, 34, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (82, 34, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (83, 34, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images\Image72" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (84, 34, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images\Image73" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (85, 35, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (86, 35, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (87, 36, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (88, 36, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (89, 36, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (90, 37, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (91, 38, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (92, 39, N' <image src="http://localhost:1111/Uploads/Images/Image79" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (93, 39, N' <image src="http://localhost:1111/Uploads/Images/Image80" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (94, 39, N' <image src="http://localhost:1111/Uploads/Images/Image81" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (95, 40, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (96, 40, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (97, 40, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (98, 40, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image83" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (99, 40, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image84" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (100, 41, N'да', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (101, 41, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (102, 42, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (103, 42, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (104, 42, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (105, 43, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (106, 44, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (107, 45, N' <image src="http://localhost:1111/Uploads/Images/Image90" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (108, 45, N' <image src="http://localhost:1111/Uploads/Images/Image91" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (109, 45, N' <image src="http://localhost:1111/Uploads/Images/Image92" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (110, 46, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (111, 46, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (112, 46, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (113, 46, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image94" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (114, 46, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image95" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (115, 47, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (116, 47, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (117, 48, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (118, 48, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (119, 48, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (120, 49, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (121, 50, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (122, 51, N' <image src="http://localhost:1111/Uploads/Images/Image101" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (123, 51, N' <image src="http://localhost:1111/Uploads/Images/Image102" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (124, 51, N' <image src="http://localhost:1111/Uploads/Images/Image103" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (125, 52, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (126, 52, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (127, 52, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (128, 52, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image105" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (129, 52, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image106" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (130, 53, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (131, 53, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (132, 54, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (133, 54, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (134, 54, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (135, 55, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (136, 56, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (137, 57, N' <image src="http://localhost:1111/Uploads/Images/Image112" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (138, 57, N' <image src="http://localhost:1111/Uploads/Images/Image113" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (139, 57, N' <image src="http://localhost:1111/Uploads/Images/Image114" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (140, 58, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (141, 58, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (142, 58, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (143, 58, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image116" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (144, 58, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image117" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (145, 59, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (146, 59, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (147, 60, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (148, 60, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (149, 60, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (150, 61, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (151, 62, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (152, 63, N' <image src="http://localhost:1111/Uploads/Images/Image2.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (153, 63, N' <image src="http://localhost:1111/Uploads/Images/Image3.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (154, 63, N' <image src="http://localhost:1111/Uploads/Images/Image4.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (155, 64, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (156, 64, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (157, 64, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (158, 64, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image6.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (159, 64, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image7.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (160, 65, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (161, 65, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (162, 66, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (163, 66, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (164, 66, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (165, 67, N'1 2 3 4 5 5 6 7# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (166, 68, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (167, 69, N' <image src="http://localhost:1111/Uploads/Images/Image13.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (168, 69, N' <image src="http://localhost:1111/Uploads/Images/Image14.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (169, 69, N' <image src="http://localhost:1111/Uploads/Images/Image15.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (170, 70, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (171, 70, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (172, 70, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (173, 70, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image17.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (174, 70, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image18.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (175, 71, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (176, 71, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (177, 72, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (178, 72, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (179, 72, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (180, 73, N'1 2 3 4 5 5 6 7# ', 10)
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_Professors]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_Professors]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 04/20/2010 01:03:03 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
