namespace WordToScorm
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            // Заканчиваем запись стандартного вывода в файл
            redicrectOutputWriter.Flush();
            redirectOutputStream.Flush();
            redicrectOutputWriter.Close();
            redirectOutputStream.Close();
            
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblCount = new System.Windows.Forms.Label();
            this.btnReCalc = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.dgGroups = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtGroupsCount = new System.Windows.Forms.TextBox();
            this.txtQuestionsCount = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dgGuestions = new System.Windows.Forms.DataGridView();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtQuestionsInVariantCount = new System.Windows.Forms.TextBox();
            this.txtVariantsCount = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.backgroundWordDocReader = new System.ComponentModel.BackgroundWorker();
            this.backgroundScormBuilder = new System.ComponentModel.BackgroundWorker();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.lblStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.progressBar = new System.Windows.Forms.ToolStripProgressBar();
            this.labelTime = new System.Windows.Forms.ToolStripStatusLabel();
            this.txtScormPackPath = new System.Windows.Forms.TextBox();
            this.txtDocFile = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnOpenWordDoc = new System.Windows.Forms.Button();
            this.btnSaveScormPack = new System.Windows.Forms.Button();
            this.btnCreateScormPacks = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.txtScormPackName = new System.Windows.Forms.TextBox();
            this.btnReadWordDoc = new System.Windows.Forms.Button();
            this.cbShowInfo = new System.Windows.Forms.CheckBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.lblDistrQuestCount = new System.Windows.Forms.Label();
            this.lblAlterQuestCount = new System.Windows.Forms.Label();
            this.lblQuestionsCount = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.lblYourAnsQuestCount = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.OnlyPositiveMark = new System.Windows.Forms.RadioButton();
            this.cbNegativeMark = new System.Windows.Forms.RadioButton();
            this.printingTimer = new System.Windows.Forms.Timer(this.components);
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgGroups)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgGuestions)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblCount);
            this.groupBox1.Controls.Add(this.btnReCalc);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.dgGroups);
            this.groupBox1.Controls.Add(this.txtGroupsCount);
            this.groupBox1.Controls.Add(this.txtQuestionsCount);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Location = new System.Drawing.Point(7, 9);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(238, 367);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Список тестовых вопросов: ";
            // 
            // lblCount
            // 
            this.lblCount.AutoSize = true;
            this.lblCount.Location = new System.Drawing.Point(52, 344);
            this.lblCount.Name = "lblCount";
            this.lblCount.Size = new System.Drawing.Size(13, 13);
            this.lblCount.TabIndex = 8;
            this.lblCount.Text = "0";
            // 
            // btnReCalc
            // 
            this.btnReCalc.Location = new System.Drawing.Point(146, 336);
            this.btnReCalc.Name = "btnReCalc";
            this.btnReCalc.Size = new System.Drawing.Size(83, 23);
            this.btnReCalc.TabIndex = 7;
            this.btnReCalc.Text = "Пересчитать";
            this.btnReCalc.UseVisualStyleBackColor = true;
            this.btnReCalc.Click += new System.EventHandler(this.btnReCalc_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 344);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(40, 13);
            this.label7.TabIndex = 5;
            this.label7.Text = "Итого:";
            // 
            // dgGroups
            // 
            this.dgGroups.AllowUserToAddRows = false;
            this.dgGroups.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgGroups.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4});
            this.dgGroups.Location = new System.Drawing.Point(9, 71);
            this.dgGroups.Name = "dgGroups";
            this.dgGroups.RowHeadersVisible = false;
            this.dgGroups.Size = new System.Drawing.Size(220, 258);
            this.dgGroups.TabIndex = 4;
            this.dgGroups.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgGroups_CellEndEdit);
            this.dgGroups.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.sgrGrp_CellClick);
            // 
            // Column1
            // 
            this.Column1.FillWeight = 50F;
            this.Column1.HeaderText = "Номер";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column1.Width = 50;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "Кол-во";
            this.Column2.Name = "Column2";
            this.Column2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column2.Width = 50;
            // 
            // Column3
            // 
            this.Column3.HeaderText = "С";
            this.Column3.Name = "Column3";
            this.Column3.ReadOnly = true;
            this.Column3.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column3.Width = 50;
            // 
            // Column4
            // 
            this.Column4.HeaderText = "По";
            this.Column4.Name = "Column4";
            this.Column4.ReadOnly = true;
            this.Column4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column4.Width = 50;
            // 
            // txtGroupsCount
            // 
            this.txtGroupsCount.Location = new System.Drawing.Point(129, 45);
            this.txtGroupsCount.Name = "txtGroupsCount";
            this.txtGroupsCount.Size = new System.Drawing.Size(100, 20);
            this.txtGroupsCount.TabIndex = 3;
            this.txtGroupsCount.Text = "4";
            this.txtGroupsCount.TextChanged += new System.EventHandler(this.edKGV_TextChanged);
            // 
            // txtQuestionsCount
            // 
            this.txtQuestionsCount.Location = new System.Drawing.Point(129, 19);
            this.txtQuestionsCount.Name = "txtQuestionsCount";
            this.txtQuestionsCount.ReadOnly = true;
            this.txtQuestionsCount.Size = new System.Drawing.Size(100, 20);
            this.txtQuestionsCount.TabIndex = 2;
            this.txtQuestionsCount.Text = "0";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 48);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(87, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Групп вопросов";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 22);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(117, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Количество вопросов";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgGuestions);
            this.groupBox2.Controls.Add(this.txtQuestionsInVariantCount);
            this.groupBox2.Controls.Add(this.txtVariantsCount);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Location = new System.Drawing.Point(251, 9);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(178, 367);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Тестовые варианты: ";
            // 
            // dgGuestions
            // 
            this.dgGuestions.AllowUserToAddRows = false;
            this.dgGuestions.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgGuestions.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column5,
            this.Column6});
            this.dgGuestions.Location = new System.Drawing.Point(9, 71);
            this.dgGuestions.Name = "dgGuestions";
            this.dgGuestions.RowHeadersVisible = false;
            this.dgGuestions.Size = new System.Drawing.Size(160, 286);
            this.dgGuestions.TabIndex = 4;
            // 
            // Column5
            // 
            this.Column5.HeaderText = "Вопрос";
            this.Column5.Name = "Column5";
            this.Column5.ReadOnly = true;
            this.Column5.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column5.Width = 70;
            // 
            // Column6
            // 
            this.Column6.HeaderText = "Группа";
            this.Column6.Name = "Column6";
            this.Column6.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.Column6.Width = 70;
            // 
            // txtQuestionsInVariantCount
            // 
            this.txtQuestionsInVariantCount.Location = new System.Drawing.Point(134, 45);
            this.txtQuestionsInVariantCount.Name = "txtQuestionsInVariantCount";
            this.txtQuestionsInVariantCount.Size = new System.Drawing.Size(35, 20);
            this.txtQuestionsInVariantCount.TabIndex = 3;
            this.txtQuestionsInVariantCount.Text = "0";
            this.txtQuestionsInVariantCount.TextChanged += new System.EventHandler(this.edKQR_TextChanged);
            // 
            // txtVariantsCount
            // 
            this.txtVariantsCount.Location = new System.Drawing.Point(134, 19);
            this.txtVariantsCount.Name = "txtVariantsCount";
            this.txtVariantsCount.Size = new System.Drawing.Size(35, 20);
            this.txtVariantsCount.TabIndex = 2;
            this.txtVariantsCount.Text = "5";
            this.txtVariantsCount.TextChanged += new System.EventHandler(this.edKVR_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 48);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(117, 13);
            this.label6.TabIndex = 1;
            this.label6.Text = "Количество вопросов";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(122, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Количество вариантов";
            // 
            // backgroundWordDocReader
            // 
            this.backgroundWordDocReader.WorkerReportsProgress = true;
            this.backgroundWordDocReader.WorkerSupportsCancellation = true;
            this.backgroundWordDocReader.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundReadWordDocDoWork);
            this.backgroundWordDocReader.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundReadWordDocRunWorkerCompleted);
            this.backgroundWordDocReader.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundReadWordDocProgressChanged);
            // 
            // backgroundScormBuilder
            // 
            this.backgroundScormBuilder.WorkerReportsProgress = true;
            this.backgroundScormBuilder.WorkerSupportsCancellation = true;
            this.backgroundScormBuilder.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundScormBuilderDoWork);
            this.backgroundScormBuilder.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundScormBuilderRunWorkerCompleted);
            this.backgroundScormBuilder.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundScormBuilderProgressChanged);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblStatus,
            this.progressBar,
            this.labelTime});
            this.statusStrip1.Location = new System.Drawing.Point(0, 380);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(723, 22);
            this.statusStrip1.TabIndex = 24;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // lblStatus
            // 
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(543, 17);
            this.lblStatus.Spring = true;
            this.lblStatus.Text = "Выберите Word документ...";
            // 
            // progressBar
            // 
            this.progressBar.Name = "progressBar";
            this.progressBar.Size = new System.Drawing.Size(100, 16);
            // 
            // labelTime
            // 
            this.labelTime.Name = "labelTime";
            this.labelTime.Size = new System.Drawing.Size(63, 17);
            this.labelTime.Text = "0 мин 0 сек";
            // 
            // txtScormPackPath
            // 
            this.txtScormPackPath.Location = new System.Drawing.Point(52, 19);
            this.txtScormPackPath.Name = "txtScormPackPath";
            this.txtScormPackPath.Size = new System.Drawing.Size(143, 20);
            this.txtScormPackPath.TabIndex = 0;
            // 
            // txtDocFile
            // 
            this.txtDocFile.Location = new System.Drawing.Point(52, 19);
            this.txtDocFile.Name = "txtDocFile";
            this.txtDocFile.Size = new System.Drawing.Size(143, 20);
            this.txtDocFile.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Путь";
            // 
            // btnOpenWordDoc
            // 
            this.btnOpenWordDoc.Location = new System.Drawing.Point(201, 17);
            this.btnOpenWordDoc.Name = "btnOpenWordDoc";
            this.btnOpenWordDoc.Size = new System.Drawing.Size(75, 23);
            this.btnOpenWordDoc.TabIndex = 1;
            this.btnOpenWordDoc.Text = "Обзор...";
            this.btnOpenWordDoc.UseVisualStyleBackColor = true;
            this.btnOpenWordDoc.Click += new System.EventHandler(this.btnOpenWordDocClick);
            // 
            // btnSaveScormPack
            // 
            this.btnSaveScormPack.Location = new System.Drawing.Point(201, 17);
            this.btnSaveScormPack.Name = "btnSaveScormPack";
            this.btnSaveScormPack.Size = new System.Drawing.Size(75, 23);
            this.btnSaveScormPack.TabIndex = 1;
            this.btnSaveScormPack.Text = "Browse...";
            this.btnSaveScormPack.UseVisualStyleBackColor = true;
            this.btnSaveScormPack.Click += new System.EventHandler(this.btnSaveScormPackClick);
            // 
            // btnCreateScormPacks
            // 
            this.btnCreateScormPacks.Location = new System.Drawing.Point(44, 72);
            this.btnCreateScormPacks.Name = "btnCreateScormPacks";
            this.btnCreateScormPacks.Size = new System.Drawing.Size(106, 23);
            this.btnCreateScormPacks.TabIndex = 3;
            this.btnCreateScormPacks.Text = "Создать";
            this.btnCreateScormPacks.UseVisualStyleBackColor = true;
            this.btnCreateScormPacks.Click += new System.EventHandler(this.btnCreateScormPacksClick);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 48);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(29, 13);
            this.label8.TabIndex = 9;
            this.label8.Text = "Имя";
            // 
            // txtScormPackName
            // 
            this.txtScormPackName.Location = new System.Drawing.Point(52, 45);
            this.txtScormPackName.Name = "txtScormPackName";
            this.txtScormPackName.Size = new System.Drawing.Size(143, 20);
            this.txtScormPackName.TabIndex = 2;
            // 
            // btnReadWordDoc
            // 
            this.btnReadWordDoc.Location = new System.Drawing.Point(44, 45);
            this.btnReadWordDoc.Name = "btnReadWordDoc";
            this.btnReadWordDoc.Size = new System.Drawing.Size(106, 23);
            this.btnReadWordDoc.TabIndex = 2;
            this.btnReadWordDoc.Text = "Обработать";
            this.btnReadWordDoc.UseVisualStyleBackColor = true;
            this.btnReadWordDoc.Click += new System.EventHandler(this.btnReadWordDocClick);
            // 
            // cbShowInfo
            // 
            this.cbShowInfo.AutoSize = true;
            this.cbShowInfo.Location = new System.Drawing.Point(171, 76);
            this.cbShowInfo.Name = "cbShowInfo";
            this.cbShowInfo.Size = new System.Drawing.Size(105, 17);
            this.cbShowInfo.TabIndex = 4;
            this.cbShowInfo.Text = "Показать отчёт";
            this.cbShowInfo.UseVisualStyleBackColor = true;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(10, 20);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(95, 13);
            this.label9.TabIndex = 19;
            this.label9.Text = "Дистрибутывные";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(10, 40);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(92, 13);
            this.label10.TabIndex = 20;
            this.label10.Text = "Альтернативные";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(10, 80);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(91, 13);
            this.label11.TabIndex = 21;
            this.label11.Text = "Всего вопросов:";
            // 
            // lblDistrQuestCount
            // 
            this.lblDistrQuestCount.AutoSize = true;
            this.lblDistrQuestCount.Location = new System.Drawing.Point(220, 20);
            this.lblDistrQuestCount.Name = "lblDistrQuestCount";
            this.lblDistrQuestCount.Size = new System.Drawing.Size(13, 13);
            this.lblDistrQuestCount.TabIndex = 22;
            this.lblDistrQuestCount.Text = "0";
            // 
            // lblAlterQuestCount
            // 
            this.lblAlterQuestCount.AutoSize = true;
            this.lblAlterQuestCount.Location = new System.Drawing.Point(220, 40);
            this.lblAlterQuestCount.Name = "lblAlterQuestCount";
            this.lblAlterQuestCount.Size = new System.Drawing.Size(13, 13);
            this.lblAlterQuestCount.TabIndex = 23;
            this.lblAlterQuestCount.Text = "0";
            // 
            // lblQuestionsCount
            // 
            this.lblQuestionsCount.AutoSize = true;
            this.lblQuestionsCount.Location = new System.Drawing.Point(220, 80);
            this.lblQuestionsCount.Name = "lblQuestionsCount";
            this.lblQuestionsCount.Size = new System.Drawing.Size(13, 13);
            this.lblQuestionsCount.TabIndex = 24;
            this.lblQuestionsCount.Text = "0";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(10, 60);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(63, 13);
            this.label13.TabIndex = 26;
            this.label13.Text = "Свой ответ";
            // 
            // lblYourAnsQuestCount
            // 
            this.lblYourAnsQuestCount.AutoSize = true;
            this.lblYourAnsQuestCount.Location = new System.Drawing.Point(220, 60);
            this.lblYourAnsQuestCount.Name = "lblYourAnsQuestCount";
            this.lblYourAnsQuestCount.Size = new System.Drawing.Size(13, 13);
            this.lblYourAnsQuestCount.TabIndex = 28;
            this.lblYourAnsQuestCount.Text = "0";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Location = new System.Drawing.Point(13, 76);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(260, 1);
            this.panel1.TabIndex = 29;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.panel1);
            this.groupBox3.Controls.Add(this.lblYourAnsQuestCount);
            this.groupBox3.Controls.Add(this.label13);
            this.groupBox3.Controls.Add(this.lblQuestionsCount);
            this.groupBox3.Controls.Add(this.lblAlterQuestCount);
            this.groupBox3.Controls.Add(this.lblDistrQuestCount);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Controls.Add(this.label10);
            this.groupBox3.Controls.Add(this.label9);
            this.groupBox3.Location = new System.Drawing.Point(435, 9);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(282, 100);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Типы вопросов: ";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.label1);
            this.groupBox5.Controls.Add(this.txtDocFile);
            this.groupBox5.Controls.Add(this.btnOpenWordDoc);
            this.groupBox5.Controls.Add(this.btnReadWordDoc);
            this.groupBox5.Location = new System.Drawing.Point(435, 194);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(282, 73);
            this.groupBox5.TabIndex = 0;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Документ Word: ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Имя";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnCreateScormPacks);
            this.groupBox6.Controls.Add(this.txtScormPackPath);
            this.groupBox6.Controls.Add(this.label2);
            this.groupBox6.Controls.Add(this.btnSaveScormPack);
            this.groupBox6.Controls.Add(this.cbShowInfo);
            this.groupBox6.Controls.Add(this.label8);
            this.groupBox6.Controls.Add(this.txtScormPackName);
            this.groupBox6.Location = new System.Drawing.Point(435, 273);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(282, 103);
            this.groupBox6.TabIndex = 1;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "SCORM пакеты: ";
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.OnlyPositiveMark);
            this.groupBox7.Controls.Add(this.cbNegativeMark);
            this.groupBox7.Location = new System.Drawing.Point(435, 115);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(282, 73);
            this.groupBox7.TabIndex = 3;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "Обработка дистр вопросов:";
            // 
            // OnlyPositiveMark
            // 
            this.OnlyPositiveMark.AutoSize = true;
            this.OnlyPositiveMark.Location = new System.Drawing.Point(6, 42);
            this.OnlyPositiveMark.Name = "OnlyPositiveMark";
            this.OnlyPositiveMark.Size = new System.Drawing.Size(188, 17);
            this.OnlyPositiveMark.TabIndex = 1;
            this.OnlyPositiveMark.TabStop = true;
            this.OnlyPositiveMark.Text = "Ограничить количество ответов";
            this.OnlyPositiveMark.UseVisualStyleBackColor = true;
            // 
            // cbNegativeMark
            // 
            this.cbNegativeMark.AutoSize = true;
            this.cbNegativeMark.Checked = true;
            this.cbNegativeMark.Location = new System.Drawing.Point(6, 19);
            this.cbNegativeMark.Name = "cbNegativeMark";
            this.cbNegativeMark.Size = new System.Drawing.Size(197, 17);
            this.cbNegativeMark.TabIndex = 0;
            this.cbNegativeMark.TabStop = true;
            this.cbNegativeMark.Text = "Разрешить отрицательные баллы";
            this.cbNegativeMark.UseVisualStyleBackColor = true;
            // 
            // printingTimer
            // 
            this.printingTimer.Enabled = true;
            this.printingTimer.Tick += new System.EventHandler(this.printingTimer_Tick);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(723, 402);
            this.Controls.Add(this.groupBox7);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "WordToScorm v1.1.1";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgGroups)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgGuestions)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dgGroups;
        private System.Windows.Forms.TextBox txtGroupsCount;
        private System.Windows.Forms.TextBox txtQuestionsCount;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnReCalc;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridView dgGuestions;
        private System.Windows.Forms.TextBox txtQuestionsInVariantCount;
        private System.Windows.Forms.TextBox txtVariantsCount;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.Label lblCount;
        private System.ComponentModel.BackgroundWorker backgroundWordDocReader;
        private System.ComponentModel.BackgroundWorker backgroundScormBuilder;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel lblStatus;
        private System.Windows.Forms.ToolStripProgressBar progressBar;
        private System.Windows.Forms.ToolStripStatusLabel labelTime;
        private System.Windows.Forms.TextBox txtScormPackPath;
        private System.Windows.Forms.TextBox txtDocFile;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnOpenWordDoc;
        private System.Windows.Forms.Button btnSaveScormPack;
        private System.Windows.Forms.Button btnCreateScormPacks;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtScormPackName;
        private System.Windows.Forms.Button btnReadWordDoc;
        private System.Windows.Forms.CheckBox cbShowInfo;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label lblDistrQuestCount;
        private System.Windows.Forms.Label lblAlterQuestCount;
        private System.Windows.Forms.Label lblQuestionsCount;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label lblYourAnsQuestCount;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.RadioButton OnlyPositiveMark;
        private System.Windows.Forms.RadioButton cbNegativeMark;
        private System.Windows.Forms.Timer printingTimer;
    }
}

