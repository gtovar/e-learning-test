USE [VLK_DB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/04/2010 00:21:39 ******/
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
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (7, N'pkunilov', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KunilovPE', N'pkunilov@mail.ru', N'Кунилов', N'Петр', N'Евгеньевич', N'Student')
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (17, N'karpenko.s.n', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KarpenkoSN', N'karpenko.s.n@unn.ru', N'Карпенко', N'С', N'Н', N'Professor')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Specialities]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Chairs]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[Chairs] ([Id], [DepartmentId], [Title], [Abbreviation], [Alias], [Description]) VALUES (11, 1, N'Не указана', N'Не указана', N'None', N'О кафедре')
SET IDENTITY_INSERT [dbo].[Chairs] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Professors]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 05/04/2010 00:21:40 ******/
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
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Groups]    Script Date: 05/04/2010 00:21:40 ******/
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
SET IDENTITY_INSERT [dbo].[Groups] OFF
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (2, 18, 17, N'Вторник', N'11:20', 6, 114, N'Каждая')
SET IDENTITY_INSERT [dbo].[LectureTimetables] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 05/04/2010 00:21:40 ******/
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
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] OFF
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[GeneratedTests] ([Id], [SpecialityDisciplineTopicId], [VariantsCount], [GeneratedDate], [QuestionsCount]) VALUES (1, 17, 5, CAST(0x00009D6A00000000 AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[GeneratedTests] OFF
/****** Object:  Table [dbo].[Razdels]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (12, 18, 9, CAST(0x00009D1F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (13, 18, 10, CAST(0x00009D2600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (14, 18, 11, CAST(0x00009D2D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (15, 18, 12, CAST(0x00009D3400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (16, 18, 13, CAST(0x00009D3B00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (17, 18, 14, CAST(0x00009D4200000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (18, 18, 15, CAST(0x00009D4900000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (19, 18, 16, CAST(0x00009D5000000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (20, 18, 17, CAST(0x00009D5700000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (21, 18, 18, CAST(0x00009D5E00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (22, 18, 19, CAST(0x00009D6500000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (23, 18, 20, CAST(0x00009D6C00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (25, 17, 22, CAST(0x00009D4A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (26, 17, 23, CAST(0x00009D5100000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (27, 17, 24, CAST(0x00009D5800000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (28, 17, 25, CAST(0x00009D5F00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (29, 17, 26, CAST(0x00009D6600000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (30, 17, 27, CAST(0x00009D6D00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (31, 17, 28, CAST(0x00009D7400000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (32, 18, 29, CAST(0x00009D7300000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (33, 18, 30, CAST(0x00009D7A00000000 AS DateTime))
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (34, 17, 31, CAST(0x00009D7B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[LecturePlans] OFF
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (114, 6, 2, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие операторы используются для циклического выполнения кода? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (115, 6, 1, N'Краткое название отсутствует (документ старого образца)', N'В чем заключается назначение оператора перехода goto? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (116, 6, 2, N'Краткое название отсутствует (документ старого образца)', N'Выберите варианты выражений, в которых произойдет зацикливание программы: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (117, 6, 1, N'Краткое название отсутствует (документ старого образца)', N'Отметьте верное завершение фразы: «Операторы управления (for, while, switch, …) необходимы для: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (118, 6, 2, N'Краткое название отсутствует (документ старого образца)', N'Какие конструкции языка C позволяет проверять условие выхода из цикла после завершения тела цикла:: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (119, 6, 2, N'Краткое название отсутствует (документ старого образца)', N'Какие конструкции языка C позволяет проверять условие выхода из цикла до начала выполнения тела цикла:: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (120, 6, 2, N'Краткое название отсутствует (документ старого образца)', N'Какое операторы позволяет выйти из операторов for, while и do до завершения цикла по условию? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (121, 6, 1, N'Краткое название отсутствует (документ старого образца)', N'Что означает использование оператора continue в циклах for, while и do? Выберите один наиболее правильный ответ:<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (122, 6, 1, N'Краткое название отсутствует (документ старого образца)', N'Что означает использование оператора break в циклах while и do? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (123, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Является ли обязательным использование префикса default в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (124, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=3;<br /> switch(n) {<br /> case 2: cout << "ааа"; break;<br /> case 3: cout << "ббб"; break;<br /> default: cout << "ввв"; break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (125, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=45;<br /> switch(n) {<br /> case 23: cout << "ааа";<br /> case 45: cout << "ббб";<br /> default: cout << "ввв";<br /> break; }<br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (126, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что происходит при использовании break в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (127, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Чем должны быть помечены случаи case в конструкции switch? Выберите наиболее подходящий вариант: <br /> ', -1, -1, -1, -1, -1, 1, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (128, 7, 0, N'Краткое название отсутствует (документ старого образца)', N'Какое значение получит переменная Z в результате выполнения фрагмента кода: <br /> int Z, N = 2, A = 3, B = 4; if ( N > 0 ) if ( A > B ) Z = A; <br /> if ( A == B) N = A; else Z = B; <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (129, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:19197/Uploads/Images/Image1.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (130, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'Что будет выведено в результате выполнения следующего фрагмента кода: <br />  <img src="http://localhost:19197/Uploads/Images/Image2.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (131, 7, 2, N'Краткое название отсутствует (документ старого образца)', N'Какие значения получат переменные x, y, z после выполнения следующих действий: <br />  <img src="http://localhost:19197/Uploads/Images/Image3.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (132, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'В каком случае выполнится оператор4? <br /> if (выражение1) оператор1 else if (выражение2) оператор2 else if (выражение3) оператор3 else оператор4 <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (133, 7, 1, N'Краткое название отсутствует (документ старого образца)', N'if (A > B) {Z = A; A++;}; else Z = B; Должна ли после закрывающейся фигурной скобки стоять точка с запятой? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (134, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Является ли обязательным использование префикса default в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (135, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=3;<br /> switch(n) {<br /> case 2: cout << "ааа"; break;<br /> case 3: cout << "ббб"; break;<br /> default: cout << "ввв"; break; }<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (136, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующего фрагмента кода:<br /> int n=45;<br /> switch(n) {<br /> case 23: cout << "ааа";<br /> case 45: cout << "ббб";<br /> default: cout << "ввв";<br /> break; }<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (137, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Что происходит при использовании break в конструкции switch? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (138, 8, 1, N'Краткое название отсутствует (документ старого образца)', N'Чем должны быть помечены случаи case в конструкции switch? Выберите наиболее подходящий вариант: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (139, 9, 1, N'Краткое название отсутствует (документ старого образца)', N'Какой будет результат выполнения следующих действий: <br /> int i = 5;<br /> do { cout << (--i)-- << " "; }<br /> while ( i>=2 && i < 5 ) ;<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (140, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Что означает запись for (;;)? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (141, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'В каком случает точки с запятой могут отсутствовать в конструкции for? <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (142, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Что выведет следующая программа ? <br /> 	#include <iostream.h><br /> 	int main() {<br />    int i ;<br />    for(i = 0; i < 9; i++)<br />    cout << i+1;<br />    return 1;<br /> 	}<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (143, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (144, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (145, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (146, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (147, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (148, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (149, 10, 1, N'Краткое название отсутствует (документ старого образца)', N'Выберите правильные варианты кода определения s = 1 + 2*2 + 3*3 + …(т.е. те, которые не вызовут ошибку компиляции и дадут верный результат):<br /> ', -1, -1, -1, -1, -1, 0, 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 05/04/2010 00:21:40 ******/
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
SET IDENTITY_INSERT [dbo].[AssignedTestVariants] ON
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path]) VALUES (1, 1, 7, CAST(0x00009D6A00000000 AS DateTime), 1, 0, 0, N'/1.zip')
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path]) VALUES (2, 2, 7, CAST(0x00009D6A00000000 AS DateTime), 1, 0, 0, N'/2.zip')
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path]) VALUES (3, 3, 7, CAST(0x00009D6A00000000 AS DateTime), 2, 20, 0, N'/3.zip')
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path]) VALUES (4, 4, 7, CAST(0x00009D6A00000000 AS DateTime), 2, 30, 0, N'/4.zip')
INSERT [dbo].[AssignedTestVariants] ([Id], [GeneratedTestVariantId], [StudentId], [AssignedDate], [State], [Score], [Mark], [Path]) VALUES (5, 5, 7, CAST(0x00009D6A00000000 AS DateTime), 3, 40, 4, N'/5.zip')
SET IDENTITY_INSERT [dbo].[AssignedTestVariants] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 05/04/2010 00:21:40 ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 05/04/2010 00:21:40 ******/
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
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 05/04/2010 00:21:40 ******/
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
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (19, 17, 12, 2, 0, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (20, 18, 2, 2, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (21, 18, 3, 2, 2, 0, N'Экзам.')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_Professors]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_Professors]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 05/04/2010 00:21:40 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
