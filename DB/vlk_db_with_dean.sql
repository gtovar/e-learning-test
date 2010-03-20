SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[id] [bigint] NOT NULL,
	[login] [nvarchar](64) NOT NULL,
	[email] [nvarchar](64) NOT NULL,
	[role] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[departments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[razdels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[razdels](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[questions_count] [int] NOT NULL,
 CONSTRAINT [PK_razdels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[generated_tests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[generated_tests](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL,
	[variants_count] [int] NOT NULL,
	[generated_date] [datetime] NOT NULL,
	[questions_count] [int] NOT NULL,
 CONSTRAINT [PK_generated_tests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questions](
	[id] [bigint] NOT NULL,
	[razdel_id] [bigint] NOT NULL,
	[type] [int] NOT NULL,
	[text] [text] NOT NULL,
	[assigned_count] [bigint] NOT NULL,
	[right_answers_count] [bigint] NOT NULL,
	[wrong_answers_count] [bigint] NOT NULL,
	[double_group] [int] NOT NULL,
	[exclusion_group] [int] IDENTITY(1,1) NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[generated_test_variants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[generated_test_variants](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[generated_test_id] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_test_variants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[practice_and_lab_timetables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[practice_and_lab_timetables](
	[id] [bigint] NOT NULL,
	[specialization_id] [bigint] NOT NULL,
	[speciality_discipline_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[professor_id] [bigint] NOT NULL,
	[day] [nvarchar](255) NOT NULL,
	[time] [datetime] NOT NULL,
	[building] [smallint] NOT NULL,
	[room] [smallint] NOT NULL,
 CONSTRAINT [PK_practices_and_labs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[specializations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[specializations](
	[id] [bigint] NOT NULL,
	[speciality_id] [bigint] NOT NULL,
	[chair_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_specializations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[speciality_disciplines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[speciality_disciplines](
	[id] [bigint] NOT NULL,
	[speciality_id] [bigint] NOT NULL,
	[chair_id] [bigint] NOT NULL,
	[professor_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[category] [nvarchar](255) NOT NULL,
	[vol_lecture] [smallint] NULL,
	[vol_practice] [smallint] NULL,
	[vol_lab] [smallint] NULL,
	[reporting] [nvarchar](255) NOT NULL,
	[term] [smallint] NOT NULL,
 CONSTRAINT [PK_speciality_disciplines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[professors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[professors](
	[id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[chair_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[degree] [nvarchar](50) NOT NULL,
	[position] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_professors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lecture_timetables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lecture_timetables](
	[id] [bigint] NOT NULL,
	[speciality_discipline_id] [bigint] NOT NULL,
	[professor_id] [bigint] NOT NULL,
	[day] [nvarchar](255) NOT NULL,
	[time] [datetime] NOT NULL,
	[building] [smallint] NOT NULL,
	[room] [smallint] NOT NULL,
 CONSTRAINT [PK_lectures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lecture_plans]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lecture_plans](
	[id] [bigint] NOT NULL,
	[speciality_discipline_id] [bigint] NOT NULL,
	[topic] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_lecture_plans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[practice_plans]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[practice_plans](
	[id] [bigint] NOT NULL,
	[speciality_discipline_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[topic] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_practice_plans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[chairs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[chairs](
	[id] [bigint] NOT NULL,
	[speciality_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_chairs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[topics](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[discipline_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[answers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NOT NULL,
	[text] [text] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[generated_questions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[generated_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[generated_test_variant_id] [bigint] NOT NULL,
	[question_id] [bigint] NOT NULL,
 CONSTRAINT [PK_generated_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[assigned_test_variants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[assigned_test_variants](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[generated_test_variant_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[assigned_date] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[score] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[path] [text] NOT NULL,
 CONSTRAINT [PK_assigned_test_variants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[speciality_id] [bigint] NOT NULL,
	[department_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[specialities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[specialities](
	[id] [bigint] NOT NULL,
	[department_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_specialities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[disciplines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[disciplines](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[department_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_disciplines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_razdels_topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[razdels]'))
ALTER TABLE [dbo].[razdels]  WITH CHECK ADD  CONSTRAINT [FK_razdels_topics] FOREIGN KEY([topic_id])
REFERENCES [dbo].[topics] ([id])
GO
ALTER TABLE [dbo].[razdels] CHECK CONSTRAINT [FK_razdels_topics]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_tests_topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[generated_tests]'))
ALTER TABLE [dbo].[generated_tests]  WITH CHECK ADD  CONSTRAINT [FK_generated_tests_topics] FOREIGN KEY([topic_id])
REFERENCES [dbo].[topics] ([id])
GO
ALTER TABLE [dbo].[generated_tests] CHECK CONSTRAINT [FK_generated_tests_topics]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_questions_razdels]') AND parent_object_id = OBJECT_ID(N'[dbo].[questions]'))
ALTER TABLE [dbo].[questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_razdels] FOREIGN KEY([razdel_id])
REFERENCES [dbo].[razdels] ([id])
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [FK_questions_razdels]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_test_variants_generated_tests1]') AND parent_object_id = OBJECT_ID(N'[dbo].[generated_test_variants]'))
ALTER TABLE [dbo].[generated_test_variants]  WITH CHECK ADD  CONSTRAINT [FK_generated_test_variants_generated_tests1] FOREIGN KEY([generated_test_id])
REFERENCES [dbo].[generated_tests] ([id])
GO
ALTER TABLE [dbo].[generated_test_variants] CHECK CONSTRAINT [FK_generated_test_variants_generated_tests1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_and_lab_timetables]'))
ALTER TABLE [dbo].[practice_and_lab_timetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[practice_and_lab_timetables] CHECK CONSTRAINT [FK_practices_and_labs_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_and_lab_timetables]'))
ALTER TABLE [dbo].[practice_and_lab_timetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_professors] FOREIGN KEY([professor_id])
REFERENCES [dbo].[professors] ([id])
GO
ALTER TABLE [dbo].[practice_and_lab_timetables] CHECK CONSTRAINT [FK_practices_and_labs_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_and_lab_timetables]'))
ALTER TABLE [dbo].[practice_and_lab_timetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_speciality_disciplines] FOREIGN KEY([speciality_discipline_id])
REFERENCES [dbo].[speciality_disciplines] ([id])
GO
ALTER TABLE [dbo].[practice_and_lab_timetables] CHECK CONSTRAINT [FK_practices_and_labs_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practices_and_labs_specializations]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_and_lab_timetables]'))
ALTER TABLE [dbo].[practice_and_lab_timetables]  WITH CHECK ADD  CONSTRAINT [FK_practices_and_labs_specializations] FOREIGN KEY([specialization_id])
REFERENCES [dbo].[specializations] ([id])
GO
ALTER TABLE [dbo].[practice_and_lab_timetables] CHECK CONSTRAINT [FK_practices_and_labs_specializations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specializations_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[specializations]'))
ALTER TABLE [dbo].[specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_chairs] FOREIGN KEY([chair_id])
REFERENCES [dbo].[chairs] ([id])
GO
ALTER TABLE [dbo].[specializations] CHECK CONSTRAINT [FK_specializations_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specializations_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[specializations]'))
ALTER TABLE [dbo].[specializations]  WITH CHECK ADD  CONSTRAINT [FK_specializations_specialities] FOREIGN KEY([speciality_id])
REFERENCES [dbo].[specialities] ([id])
GO
ALTER TABLE [dbo].[specializations] CHECK CONSTRAINT [FK_specializations_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[speciality_disciplines]'))
ALTER TABLE [dbo].[speciality_disciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_chairs] FOREIGN KEY([chair_id])
REFERENCES [dbo].[chairs] ([id])
GO
ALTER TABLE [dbo].[speciality_disciplines] CHECK CONSTRAINT [FK_speciality_disciplines_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[speciality_disciplines]'))
ALTER TABLE [dbo].[speciality_disciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_professors] FOREIGN KEY([professor_id])
REFERENCES [dbo].[professors] ([id])
GO
ALTER TABLE [dbo].[speciality_disciplines] CHECK CONSTRAINT [FK_speciality_disciplines_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_speciality_disciplines_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[speciality_disciplines]'))
ALTER TABLE [dbo].[speciality_disciplines]  WITH CHECK ADD  CONSTRAINT [FK_speciality_disciplines_specialities] FOREIGN KEY([speciality_id])
REFERENCES [dbo].[specialities] ([id])
GO
ALTER TABLE [dbo].[speciality_disciplines] CHECK CONSTRAINT [FK_speciality_disciplines_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_professors_chairs]') AND parent_object_id = OBJECT_ID(N'[dbo].[professors]'))
ALTER TABLE [dbo].[professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_chairs] FOREIGN KEY([chair_id])
REFERENCES [dbo].[chairs] ([id])
GO
ALTER TABLE [dbo].[professors] CHECK CONSTRAINT [FK_professors_chairs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_professors_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[professors]'))
ALTER TABLE [dbo].[professors]  WITH CHECK ADD  CONSTRAINT [FK_professors_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[professors] CHECK CONSTRAINT [FK_professors_users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lectures_professors]') AND parent_object_id = OBJECT_ID(N'[dbo].[lecture_timetables]'))
ALTER TABLE [dbo].[lecture_timetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_professors] FOREIGN KEY([professor_id])
REFERENCES [dbo].[professors] ([id])
GO
ALTER TABLE [dbo].[lecture_timetables] CHECK CONSTRAINT [FK_lectures_professors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lectures_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[lecture_timetables]'))
ALTER TABLE [dbo].[lecture_timetables]  WITH CHECK ADD  CONSTRAINT [FK_lectures_speciality_disciplines] FOREIGN KEY([speciality_discipline_id])
REFERENCES [dbo].[speciality_disciplines] ([id])
GO
ALTER TABLE [dbo].[lecture_timetables] CHECK CONSTRAINT [FK_lectures_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_lecture_plans_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[lecture_plans]'))
ALTER TABLE [dbo].[lecture_plans]  WITH CHECK ADD  CONSTRAINT [FK_lecture_plans_speciality_disciplines] FOREIGN KEY([speciality_discipline_id])
REFERENCES [dbo].[speciality_disciplines] ([id])
GO
ALTER TABLE [dbo].[lecture_plans] CHECK CONSTRAINT [FK_lecture_plans_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practice_plans_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_plans]'))
ALTER TABLE [dbo].[practice_plans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[practice_plans] CHECK CONSTRAINT [FK_practice_plans_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_practice_plans_speciality_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[practice_plans]'))
ALTER TABLE [dbo].[practice_plans]  WITH CHECK ADD  CONSTRAINT [FK_practice_plans_speciality_disciplines] FOREIGN KEY([speciality_discipline_id])
REFERENCES [dbo].[speciality_disciplines] ([id])
GO
ALTER TABLE [dbo].[practice_plans] CHECK CONSTRAINT [FK_practice_plans_speciality_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_students_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[students]'))
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_students_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[students]'))
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_chairs_specialities]') AND parent_object_id = OBJECT_ID(N'[dbo].[chairs]'))
ALTER TABLE [dbo].[chairs]  WITH CHECK ADD  CONSTRAINT [FK_chairs_specialities] FOREIGN KEY([speciality_id])
REFERENCES [dbo].[specialities] ([id])
GO
ALTER TABLE [dbo].[chairs] CHECK CONSTRAINT [FK_chairs_specialities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_topics_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[topics]'))
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_disciplines] FOREIGN KEY([discipline_id])
REFERENCES [dbo].[disciplines] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_disciplines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_answers_questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[answers]'))
ALTER TABLE [dbo].[answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[answers] CHECK CONSTRAINT [FK_answers_questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_questions_generated_test_variants1]') AND parent_object_id = OBJECT_ID(N'[dbo].[generated_questions]'))
ALTER TABLE [dbo].[generated_questions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_generated_test_variants1] FOREIGN KEY([generated_test_variant_id])
REFERENCES [dbo].[generated_test_variants] ([id])
GO
ALTER TABLE [dbo].[generated_questions] CHECK CONSTRAINT [FK_generated_questions_generated_test_variants1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_generated_questions_questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[generated_questions]'))
ALTER TABLE [dbo].[generated_questions]  WITH CHECK ADD  CONSTRAINT [FK_generated_questions_questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[generated_questions] CHECK CONSTRAINT [FK_generated_questions_questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_assigned_test_variants_generated_test_variants]') AND parent_object_id = OBJECT_ID(N'[dbo].[assigned_test_variants]'))
ALTER TABLE [dbo].[assigned_test_variants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_generated_test_variants] FOREIGN KEY([generated_test_variant_id])
REFERENCES [dbo].[generated_test_variants] ([id])
GO
ALTER TABLE [dbo].[assigned_test_variants] CHECK CONSTRAINT [FK_assigned_test_variants_generated_test_variants]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_assigned_test_variants_students]') AND parent_object_id = OBJECT_ID(N'[dbo].[assigned_test_variants]'))
ALTER TABLE [dbo].[assigned_test_variants]  WITH CHECK ADD  CONSTRAINT [FK_assigned_test_variants_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[assigned_test_variants] CHECK CONSTRAINT [FK_assigned_test_variants_students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_groups_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[groups]'))
ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_specialities_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[specialities]'))
ALTER TABLE [dbo].[specialities]  WITH CHECK ADD  CONSTRAINT [FK_specialities_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[specialities] CHECK CONSTRAINT [FK_specialities_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_disciplines_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[disciplines]'))
ALTER TABLE [dbo].[disciplines]  WITH CHECK ADD  CONSTRAINT [FK_disciplines_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[disciplines] CHECK CONSTRAINT [FK_disciplines_departments]
