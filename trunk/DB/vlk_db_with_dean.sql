SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](64) NOT NULL,
	[Password] [text] NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[SecondName] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](64) NOT NULL,
	[Patronymic] [nvarchar](64) NOT NULL,
	[Role] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Razdels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Razdels](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[QuestionsCount] [int] NOT NULL,
 CONSTRAINT [PK_razdels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneratedTests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneratedTests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicId] [bigint] NOT NULL,
	[VariantsCount] [int] NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
	[QuestionsCount] [int] NOT NULL,
 CONSTRAINT [PK_generated_tests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Questions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Questions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RazdelId] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[Text] [text] NOT NULL,
	[AssignedCount] [bigint] NOT NULL,
	[RightAnswersCount] [bigint] NOT NULL,
	[WrongAnswersCount] [bigint] NOT NULL,
	[DoubleGroup] [int] NOT NULL,
	[ExclusionGroup] [int] NOT NULL,
	[IsDeleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneratedTestVariants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneratedTestVariants](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestId] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_test_variants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneratedQuestions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneratedQuestions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratedTestVariantId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Answers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Answers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[Text] [text] NOT NULL,
	[Score] [float] NOT NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chairs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chairs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_chairs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specializations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Specializations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_specializations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialityDisciplines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SpecialityDisciplines](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
	[LectureVolume] [smallint] NULL,
	[PracticeVolume] [smallint] NULL,
	[LabVolume] [smallint] NULL,
	[Reporting] [nvarchar](255) NOT NULL,
	[Term] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PracticePlans]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PracticePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[Topic] [nvarchar](255) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_practice_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LecturePlans]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LecturePlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityDisciplineId] [bigint] NOT NULL,
	[Topic] [nvarchar](255) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_lecture_plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LectureTimetables]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PracticeAndLabTimetables]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Topics](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DisciplineId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssignedTestVariants]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Professors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Professors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ChairId] [bigint] NOT NULL,
	[Degree] [nvarchar](64) NOT NULL,
	[Position] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_professors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [bigint] NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Disciplines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Disciplines](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specialities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Specialities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_specialities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_razdels_topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Razdels]'))
ALTER TABLE [dbo].[Razdels]  WITH CHECK ADD  CONSTRAINT [FK_razdels_topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Razdels] CHECK CONSTRAINT [FK_razdels_topics]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_tests_topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeneratedTests]'))
ALTER TABLE [dbo].[GeneratedTests]  WITH CHECK ADD  CONSTRAINT [FK_generated_tests_topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTests] CHECK CONSTRAINT [FK_generated_tests_topics]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_questions_razdels]') AND parent_object_id = OBJECT_ID(N'[dbo].[Questions]'))
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([RazdelId])
REFERENCES [dbo].[Razdels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_test_variants_generated_tests1]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeneratedTestVariants]'))
ALTER TABLE [dbo].[GeneratedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([GeneratedTestId])
REFERENCES [dbo].[GeneratedTests] ([Id])
GO
ALTER TABLE [dbo].[GeneratedTestVariants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_questions_generated_test_variants1]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeneratedQuestions]'))
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_questions_questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeneratedQuestions]'))
ALTER TABLE [dbo].[GeneratedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[GeneratedQuestions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_answers_questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Answers]'))
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_answers_questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_chairs_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chairs]'))
ALTER TABLE [dbo].[Chairs]  WITH CHECK ADD  CONSTRAINT [FK_chairs_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Chairs] CHECK CONSTRAINT [FK_chairs_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specializations_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Specializations]'))
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specializations_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Specializations]'))
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialityDisciplines]'))
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialityDisciplines]'))
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialityDisciplines]'))
ALTER TABLE [dbo].[SpecialityDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialities] ([Id])
GO
ALTER TABLE [dbo].[SpecialityDisciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practice_plans_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticePlans]'))
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practice_plans_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticePlans]'))
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans] CHECK CONSTRAINT [FK_practice_plans_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lecture_plans_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[LecturePlans]'))
ALTER TABLE [dbo].[LecturePlans]  WITH CHECK ADD  CONSTRAINT [FK_lecture_plans_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LecturePlans] CHECK CONSTRAINT [FK_lecture_plans_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lectures_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[LectureTimetables]'))
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lectures_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[LectureTimetables]'))
ALTER TABLE [dbo].[LectureTimetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[LectureTimetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticeAndLabTimetables]'))
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticeAndLabTimetables]'))
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticeAndLabTimetables]'))
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([SpecialityDisciplineId])
REFERENCES [dbo].[SpecialityDisciplines] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_specializations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PracticeAndLabTimetables]'))
ALTER TABLE [dbo].[PracticeAndLabTimetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[PracticeAndLabTimetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_students_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_students_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_students_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_students_users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_topics_disciplines1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Topics]'))
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_disciplines1] FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Disciplines] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_topics_disciplines1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_assigned_test_variants_generated_test_variants]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssignedTestVariants]'))
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([GeneratedTestVariantId])
REFERENCES [dbo].[GeneratedTestVariants] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_assigned_test_variants_students]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssignedTestVariants]'))
ALTER TABLE [dbo].[AssignedTestVariants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[AssignedTestVariants] CHECK CONSTRAINT [FK_assigned_test_variants_students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_professors_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Professors]'))
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([ChairId])
REFERENCES [dbo].[Chairs] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_professors_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Professors]'))
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_professors_users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_groups_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Groups]'))
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_groups_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_disciplines_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disciplines]'))
ALTER TABLE [dbo].[Disciplines]  WITH CHECK ADD  CONSTRAINT [FK_disciplines_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Disciplines] CHECK CONSTRAINT [FK_disciplines_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specialities_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Specialities]'))
ALTER TABLE [dbo].[Specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Specialities] CHECK CONSTRAINT [FK_specialities_departments]
