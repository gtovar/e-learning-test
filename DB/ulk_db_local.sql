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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[topics](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[discipline_id] [bigint] NOT NULL,
	[title] [s](255) NOT NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_groups_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[groups]'))
ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_disciplines_departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[disciplines]'))
ALTER TABLE [dbo].[disciplines]  WITH CHECK ADD  CONSTRAINT [FK_disciplines_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[disciplines] CHECK CONSTRAINT [FK_disciplines_departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_students_groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[students]'))
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_groups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_topics_disciplines]') AND parent_object_id = OBJECT_ID(N'[dbo].[topics]'))
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_disciplines] FOREIGN KEY([discipline_id])
REFERENCES [dbo].[disciplines] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_disciplines]
