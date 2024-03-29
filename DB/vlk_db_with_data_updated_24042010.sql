USE [VLK_DB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[Users] ([Id], [Login], [Password], [NickName], [Email], [SecondName], [FirstName], [Patronymic], [Role]) VALUES (17, N'karpenko.s.n', N'oeM/KKYemBLdLdmvER8iKBUxbMfDb41xI6a6', N'KarpenkoSN', N'karpenko.s.n@unn.ru', N'Карпенко', N'С', N'Н', N'Professor')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[EducationPlan]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Specialities]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Chairs]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Professors]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[SpecialityDisciplines]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (17, 3, 2, 5, 17, N'Inzhenernye_osnovy_informacionnyx_texnologij', N'Инженерные основы информационных технологий', N'ДН:ВК')
INSERT [dbo].[SpecialityDisciplines] ([Id], [SpecialityId], [EducationPlanId], [ChairId], [ProfessorId], [Alias], [Title], [Category]) VALUES (18, 3, 1, 5, 17, N'Metody_obektno-orientirovannogo_programmirovaniya', N'Методы объектно-ориентированного программирования', N'ДН:ВК')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplines] OFF
/****** Object:  Table [dbo].[Specializations]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Groups]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[PracticeAndLabTimetables]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[LectureTimetables]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[LectureTimetables] ([Id], [SpecialityDisciplineId], [ProfessorId], [Day], [Time], [Building], [Room], [Week]) VALUES (2, 18, 17, N'Вторник', N'11:20', 6, 114, N'Верхняя')
SET IDENTITY_INSERT [dbo].[LectureTimetables] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTopics]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (20, 18, N'Использование шаблонов')
INSERT [dbo].[SpecialityDisciplineTopics] ([Id], [SpecialityDisciplineId], [Title]) VALUES (21, 18, N'Пример: класс TSet')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTopics] OFF
/****** Object:  Table [dbo].[LecturePlans]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (6, 17, 3, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (7, 17, 4, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (8, 17, 5, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (9, 17, 6, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (10, 17, 7, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (11, 17, 8, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (12, 18, 9, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (13, 18, 10, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (14, 18, 11, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (15, 18, 12, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (16, 18, 13, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (17, 18, 14, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (18, 18, 15, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (19, 18, 16, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (20, 18, 17, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (21, 18, 18, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (22, 18, 19, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (23, 18, 20, NULL)
INSERT [dbo].[LecturePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [Date]) VALUES (24, 18, 21, NULL)
SET IDENTITY_INSERT [dbo].[LecturePlans] OFF
/****** Object:  Table [dbo].[SpecialityDisciplineTerms]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (19, 17, 10, 2, 0, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (20, 18, 2, 2, 2, 0, N'Зачет')
INSERT [dbo].[SpecialityDisciplineTerms] ([Id], [SpecialityDisciplineId], [Term], [LectureVolume], [PracticeVolume], [LabVolume], [Reporting]) VALUES (21, 18, 3, 2, 2, 0, N'Экзам.')
SET IDENTITY_INSERT [dbo].[SpecialityDisciplineTerms] OFF
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[PracticePlans] ([Id], [SpecialityDisciplineId], [SpecialityDisciplineTopicId], [GroupId], [Date]) VALUES (13, 18, 21, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PracticePlans] OFF
/****** Object:  Table [dbo].[GeneratedTests]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Razdels]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[Razdels] ([Id], [SpecialityDisciplineTopicId], [Title], [QuestionsCount]) VALUES (2, 17, N'Раздел_1', -1)
SET IDENTITY_INSERT [dbo].[Razdels] OFF
/****** Object:  Table [dbo].[GeneratedTestVariants]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (78, 2, 0, N'Краткое название отсутствует (документ старого образца)', N'Найти радиус r(G) графа G заданного следующей матрицей смежности:<br />  <image src="http://localhost:1111/Uploads/Images/Image45.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (79, 2, 1, N'Краткое название отсутствует (документ старого образца)', N'Укажите, какие дистрибутивные законы справедливы:<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (80, 2, 2, N'Краткое название отсутствует (документ старого образца)', N'Для функции  <image src="http://localhost:1111/Uploads/Images/Image49.jpg" /> определить, является ли она: <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (81, 2, 1, N'Краткое название отсутствует (документ старого образца)', N'Полна ли система функций {f, g, h} (принадлежность функций классам   <image src="http://localhost:1111/Uploads/Images/Image52.jpg" /> отображена в таблице):<br />  <image src="http://localhost:1111/Uploads/Images/Image53.jpg" /> <br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (82, 2, 1, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image54.jpg" /> <br /> выбрать вариант соответствующему этом дереву кода Прюфера P(t):<br /> ', -1, -1, -1, -1, -1, 0, 0)
INSERT [dbo].[Questions] ([Id], [RazdelId], [Type], [Title], [Text], [AssignedCount], [RightAnswersCount], [WrongAnswersCount], [DoubleGroup], [ExclusionGroup], [IsDeleted], [CanCommented]) VALUES (83, 2, 0, N'Краткое название отсутствует (документ старого образца)', N'Для представленного на рисунке дерева<br />  <image src="http://localhost:1111/Uploads/Images/Image55.jpg" /> <br /> определить соответствующему этом дереву кода Прюфера P(t). представить в виде последовательности цифр, разделенных одним и только одним пробелом. Пример:<br /> 2 4 6 6 7 3 1 5<br /> ', -1, -1, -1, -1, -1, 0, 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[GeneratedQuestions]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[AssignedTestVariants]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 04/24/2010 16:50:03 ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 04/24/2010 16:50:03 ******/
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
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (181, 78, N'3# ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (182, 79, N' <image src="http://localhost:1111/Uploads/Images/Image46.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (183, 79, N' <image src="http://localhost:1111/Uploads/Images/Image47.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (184, 79, N' <image src="http://localhost:1111/Uploads/Images/Image48.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (185, 80, N'линейной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (186, 80, N'монотонной', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (187, 80, N'самодвойственной ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (188, 80, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image50.jpg" /> ', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (189, 80, N'функцией из класса  <image src="http://localhost:1111/Uploads/Images/Image51.jpg" /> ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (190, 81, N'да', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (191, 81, N'нет ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (192, 82, N'P(t) = (1 2 3 4 5 6 6 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (193, 82, N'P(t) = (1 2 3 4 5 5 6 7) ', 10)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (194, 82, N'P(t) = (1 2 3 4 5 6 7 7)', 0)
INSERT [dbo].[Answers] ([Id], [QuestionId], [Text], [Score]) VALUES (195, 83, N'1 2 3 4 5 5 6 7# ', 10)
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Default [DF_Questions_IsDeleted]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Questions_CanCommented]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_CanCommented]  DEFAULT ((0)) FOR [CanCommented]
GO
/****** Object:  ForeignKey [FK_specialities_departments]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
/****** Object:  ForeignKey [FK_Chairs_Departments]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_Chairs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_Chairs_Departments]
GO
/****** Object:  ForeignKey [FK_professors_chairs]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
/****** Object:  ForeignKey [FK_Professors_Users]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_chairs]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
/****** Object:  ForeignKey [FK_speciality_disciplines_specialities]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_EducationPlan]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_EducationPlan]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplines_Professors]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplines_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_SpecialityDisciplines_Professors]
GO
/****** Object:  ForeignKey [FK_specializations_chairs]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
/****** Object:  ForeignKey [FK_Specializations_EducationPlan]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_EducationPlan] FOREIGN KEY([EducationPlanId])
REFERENCES [dbo].[EducationPlan] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_EducationPlan]
GO
/****** Object:  ForeignKey [FK_specializations_specialities]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
/****** Object:  ForeignKey [FK_groups_departments]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
/****** Object:  ForeignKey [FK_PracticeAndLabTimetables_Professors]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_PracticeAndLabTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_PracticeAndLabTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_groups]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_speciality_disciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_practices_and_labs_specializations]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
/****** Object:  ForeignKey [FK_lectures_speciality_disciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
/****** Object:  ForeignKey [FK_LectureTimetables_Professors]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_LectureTimetables_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([UserId])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_LectureTimetables_Professors]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTopics_SpecialityDisciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTopics]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTopics] CHECK CONSTRAINT [FK_SpecialityDisciplineTopics_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_LecturePlans_SpecialityDisciplineTopics]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_LecturePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_SpecialityDisciplineTerm_SpecialityDisciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[SpecialityDisciplineTerms]  WITH CHECK ADD  CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplineTerms] CHECK CONSTRAINT [FK_SpecialityDisciplineTerm_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_practice_plans_groups]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplines]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplines]
GO
/****** Object:  ForeignKey [FK_PracticePlans_SpecialityDisciplineTopics]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_PracticePlans_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_GeneratedTests_SpecialityDisciplineTopics]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_GeneratedTests_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_Razdels_SpecialityDisciplineTopics]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics] FOREIGN KEY([SpecialityDisciplineTopicId])
REFERENCES [dbo].[SpecialityDisciplineTopics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_Razdels_SpecialityDisciplineTopics]
GO
/****** Object:  ForeignKey [FK_generated_test_variants_generated_tests1]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
/****** Object:  ForeignKey [FK_questions_razdels]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
/****** Object:  ForeignKey [FK_generated_questions_generated_test_variants1]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
/****** Object:  ForeignKey [FK_generated_questions_questions]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
/****** Object:  ForeignKey [FK_students_groups]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
/****** Object:  ForeignKey [FK_Students_Users]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
/****** Object:  ForeignKey [FK_assigned_test_variants_generated_test_variants]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
/****** Object:  ForeignKey [FK_AssignedTestVariants_Students]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTestVariants_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_AssignedTestVariants_Students]
GO
/****** Object:  ForeignKey [FK_Comments_Questions1]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Questions1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Questions1]
GO
/****** Object:  ForeignKey [FK_comments_students]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_comments_students]
GO
/****** Object:  ForeignKey [FK_answers_questions]    Script Date: 04/24/2010 16:50:03 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
