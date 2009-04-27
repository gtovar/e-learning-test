namespace ULKSample
{
    partial class ULKSampleForm
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.FileMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.EditMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ServiceMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.факультетыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.группыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.кафедрыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.дисциплиныToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.operations = new System.Windows.Forms.TabControl();
            this.mainPage = new System.Windows.Forms.TabPage();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.disciplineOperationsBox = new System.Windows.Forms.GroupBox();
            this.disciplinesOperationsList = new System.Windows.Forms.ComboBox();
            this.groupsOperationsBox = new System.Windows.Forms.GroupBox();
            this.chairsOperationsList = new System.Windows.Forms.ComboBox();
            this.chairsOperationsBox = new System.Windows.Forms.GroupBox();
            this.groupsOperationsList = new System.Windows.Forms.ComboBox();
            this.departmentsBox = new System.Windows.Forms.GroupBox();
            this.departmentsList = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chairsBox = new System.Windows.Forms.GroupBox();
            this.chairsList = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupsBox = new System.Windows.Forms.GroupBox();
            this.groupsList = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.disciplineBox = new System.Windows.Forms.GroupBox();
            this.disciplinesList = new System.Windows.Forms.DataGridView();
            this.title = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.departmentsOperationsBox = new System.Windows.Forms.GroupBox();
            this.departmentsOperationsList = new System.Windows.Forms.ComboBox();
            this.departmentsPage = new System.Windows.Forms.TabPage();
            this.menuStrip1.SuspendLayout();
            this.operations.SuspendLayout();
            this.mainPage.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.disciplineOperationsBox.SuspendLayout();
            this.groupsOperationsBox.SuspendLayout();
            this.chairsOperationsBox.SuspendLayout();
            this.departmentsBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.departmentsList)).BeginInit();
            this.chairsBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chairsList)).BeginInit();
            this.groupsBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.groupsList)).BeginInit();
            this.disciplineBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.disciplinesList)).BeginInit();
            this.departmentsOperationsBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.FileMenuItem,
            this.EditMenuItem,
            this.ServiceMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(923, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // FileMenuItem
            // 
            this.FileMenuItem.Name = "FileMenuItem";
            this.FileMenuItem.Size = new System.Drawing.Size(45, 20);
            this.FileMenuItem.Text = "Файл";
            // 
            // EditMenuItem
            // 
            this.EditMenuItem.Name = "EditMenuItem";
            this.EditMenuItem.Size = new System.Drawing.Size(56, 20);
            this.EditMenuItem.Text = "Правка";
            // 
            // ServiceMenuItem
            // 
            this.ServiceMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.факультетыToolStripMenuItem,
            this.группыToolStripMenuItem,
            this.кафедрыToolStripMenuItem,
            this.дисциплиныToolStripMenuItem});
            this.ServiceMenuItem.Name = "ServiceMenuItem";
            this.ServiceMenuItem.Size = new System.Drawing.Size(55, 20);
            this.ServiceMenuItem.Text = "Сервис";
            // 
            // факультетыToolStripMenuItem
            // 
            this.факультетыToolStripMenuItem.Name = "факультетыToolStripMenuItem";
            this.факультетыToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.факультетыToolStripMenuItem.Text = "Факультеты";
            // 
            // группыToolStripMenuItem
            // 
            this.группыToolStripMenuItem.Name = "группыToolStripMenuItem";
            this.группыToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.группыToolStripMenuItem.Text = "Группы";
            // 
            // кафедрыToolStripMenuItem
            // 
            this.кафедрыToolStripMenuItem.Name = "кафедрыToolStripMenuItem";
            this.кафедрыToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.кафедрыToolStripMenuItem.Text = "Кафедры";
            // 
            // дисциплиныToolStripMenuItem
            // 
            this.дисциплиныToolStripMenuItem.Name = "дисциплиныToolStripMenuItem";
            this.дисциплиныToolStripMenuItem.Size = new System.Drawing.Size(149, 22);
            this.дисциплиныToolStripMenuItem.Text = "Дисциплины";
            // 
            // operations
            // 
            this.operations.Controls.Add(this.mainPage);
            this.operations.Controls.Add(this.departmentsPage);
            this.operations.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operations.Location = new System.Drawing.Point(0, 24);
            this.operations.Name = "operations";
            this.operations.SelectedIndex = 0;
            this.operations.Size = new System.Drawing.Size(923, 461);
            this.operations.TabIndex = 1;
            // 
            // mainPage
            // 
            this.mainPage.Controls.Add(this.tableLayoutPanel1);
            this.mainPage.Location = new System.Drawing.Point(4, 22);
            this.mainPage.Name = "mainPage";
            this.mainPage.Padding = new System.Windows.Forms.Padding(3);
            this.mainPage.Size = new System.Drawing.Size(915, 435);
            this.mainPage.TabIndex = 0;
            this.mainPage.Text = "Главная";
            this.mainPage.UseVisualStyleBackColor = true;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.AutoSize = true;
            this.tableLayoutPanel1.ColumnCount = 4;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.Controls.Add(this.disciplineOperationsBox, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.groupsOperationsBox, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.chairsOperationsBox, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.departmentsBox, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.chairsBox, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.groupsBox, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.disciplineBox, 3, 0);
            this.tableLayoutPanel1.Controls.Add(this.departmentsOperationsBox, 0, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60.68376F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 39.31624F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(909, 429);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // disciplineOperationsBox
            // 
            this.disciplineOperationsBox.Controls.Add(this.disciplinesOperationsList);
            this.disciplineOperationsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.disciplineOperationsBox.Location = new System.Drawing.Point(684, 263);
            this.disciplineOperationsBox.Name = "disciplineOperationsBox";
            this.disciplineOperationsBox.Size = new System.Drawing.Size(222, 163);
            this.disciplineOperationsBox.TabIndex = 7;
            this.disciplineOperationsBox.TabStop = false;
            this.disciplineOperationsBox.Text = "Операции";
            // 
            // disciplinesOperationsList
            // 
            this.disciplinesOperationsList.Dock = System.Windows.Forms.DockStyle.Top;
            this.disciplinesOperationsList.FormattingEnabled = true;
            this.disciplinesOperationsList.Items.AddRange(new object[] {
            "Просмотреть",
            "Добавить",
            "Редактировать ",
            "Удалить"});
            this.disciplinesOperationsList.Location = new System.Drawing.Point(3, 16);
            this.disciplinesOperationsList.Name = "disciplinesOperationsList";
            this.disciplinesOperationsList.Size = new System.Drawing.Size(216, 21);
            this.disciplinesOperationsList.TabIndex = 2;
            this.disciplinesOperationsList.Text = "Операции...";
            // 
            // groupsOperationsBox
            // 
            this.groupsOperationsBox.Controls.Add(this.chairsOperationsList);
            this.groupsOperationsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupsOperationsBox.Location = new System.Drawing.Point(230, 263);
            this.groupsOperationsBox.Name = "groupsOperationsBox";
            this.groupsOperationsBox.Size = new System.Drawing.Size(221, 163);
            this.groupsOperationsBox.TabIndex = 6;
            this.groupsOperationsBox.TabStop = false;
            this.groupsOperationsBox.Text = "Операции";
            // 
            // chairsOperationsList
            // 
            this.chairsOperationsList.Dock = System.Windows.Forms.DockStyle.Top;
            this.chairsOperationsList.FormattingEnabled = true;
            this.chairsOperationsList.Items.AddRange(new object[] {
            "Просмотреть",
            "Добавить",
            "Редактировать ",
            "Удалить"});
            this.chairsOperationsList.Location = new System.Drawing.Point(3, 16);
            this.chairsOperationsList.Name = "chairsOperationsList";
            this.chairsOperationsList.Size = new System.Drawing.Size(215, 21);
            this.chairsOperationsList.TabIndex = 2;
            this.chairsOperationsList.Text = "Операции...";
            // 
            // chairsOperationsBox
            // 
            this.chairsOperationsBox.Controls.Add(this.groupsOperationsList);
            this.chairsOperationsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chairsOperationsBox.Location = new System.Drawing.Point(457, 263);
            this.chairsOperationsBox.Name = "chairsOperationsBox";
            this.chairsOperationsBox.Size = new System.Drawing.Size(221, 163);
            this.chairsOperationsBox.TabIndex = 5;
            this.chairsOperationsBox.TabStop = false;
            this.chairsOperationsBox.Text = "Операции";
            // 
            // groupsOperationsList
            // 
            this.groupsOperationsList.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupsOperationsList.FormattingEnabled = true;
            this.groupsOperationsList.Items.AddRange(new object[] {
            "Просмотреть",
            "Добавить",
            "Редактировать ",
            "Удалить"});
            this.groupsOperationsList.Location = new System.Drawing.Point(3, 16);
            this.groupsOperationsList.Name = "groupsOperationsList";
            this.groupsOperationsList.Size = new System.Drawing.Size(215, 21);
            this.groupsOperationsList.TabIndex = 2;
            this.groupsOperationsList.Text = "Операции...";
            // 
            // departmentsBox
            // 
            this.departmentsBox.Controls.Add(this.departmentsList);
            this.departmentsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentsBox.Location = new System.Drawing.Point(3, 3);
            this.departmentsBox.Name = "departmentsBox";
            this.departmentsBox.Size = new System.Drawing.Size(221, 254);
            this.departmentsBox.TabIndex = 0;
            this.departmentsBox.TabStop = false;
            this.departmentsBox.Text = "Факультеты";
            // 
            // departmentsList
            // 
            this.departmentsList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.departmentsList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn2});
            this.departmentsList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentsList.Location = new System.Drawing.Point(3, 16);
            this.departmentsList.Name = "departmentsList";
            this.departmentsList.Size = new System.Drawing.Size(215, 235);
            this.departmentsList.TabIndex = 0;
            this.departmentsList.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.departmentsList_CellBeginEdit);
            this.departmentsList.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.departmentsList_CellEndEdit);
            this.departmentsList.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.departmentsList_CellClick);
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.HeaderText = "Название";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.Width = 200;
            // 
            // chairsBox
            // 
            this.chairsBox.Controls.Add(this.chairsList);
            this.chairsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chairsBox.Location = new System.Drawing.Point(230, 3);
            this.chairsBox.Name = "chairsBox";
            this.chairsBox.Size = new System.Drawing.Size(221, 254);
            this.chairsBox.TabIndex = 1;
            this.chairsBox.TabStop = false;
            this.chairsBox.Text = "Кафедры";
            // 
            // chairsList
            // 
            this.chairsList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.chairsList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn4});
            this.chairsList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chairsList.Location = new System.Drawing.Point(3, 16);
            this.chairsList.Name = "chairsList";
            this.chairsList.Size = new System.Drawing.Size(215, 235);
            this.chairsList.TabIndex = 1;
            this.chairsList.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.chairsList_CellBeginEdit);
            this.chairsList.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.chairsList_CellEndEdit);
            this.chairsList.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.chairsList_CellClick);
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.HeaderText = "Название";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            this.dataGridViewTextBoxColumn4.Width = 200;
            // 
            // groupsBox
            // 
            this.groupsBox.Controls.Add(this.groupsList);
            this.groupsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupsBox.Location = new System.Drawing.Point(457, 3);
            this.groupsBox.Name = "groupsBox";
            this.groupsBox.Size = new System.Drawing.Size(221, 254);
            this.groupsBox.TabIndex = 2;
            this.groupsBox.TabStop = false;
            this.groupsBox.Text = "Группы";
            // 
            // groupsList
            // 
            this.groupsList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.groupsList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn6});
            this.groupsList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupsList.Location = new System.Drawing.Point(3, 16);
            this.groupsList.Name = "groupsList";
            this.groupsList.Size = new System.Drawing.Size(215, 235);
            this.groupsList.TabIndex = 1;
            this.groupsList.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.groupsList_CellBeginEdit);
            this.groupsList.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.groupsList_CellEndEdit);
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.HeaderText = "Название";
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            this.dataGridViewTextBoxColumn6.Width = 200;
            // 
            // disciplineBox
            // 
            this.disciplineBox.Controls.Add(this.disciplinesList);
            this.disciplineBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.disciplineBox.Location = new System.Drawing.Point(684, 3);
            this.disciplineBox.Name = "disciplineBox";
            this.disciplineBox.Size = new System.Drawing.Size(222, 254);
            this.disciplineBox.TabIndex = 3;
            this.disciplineBox.TabStop = false;
            this.disciplineBox.Text = "Дисциплины";
            // 
            // disciplinesList
            // 
            this.disciplinesList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.title});
            this.disciplinesList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.disciplinesList.Location = new System.Drawing.Point(3, 16);
            this.disciplinesList.Name = "disciplinesList";
            this.disciplinesList.Size = new System.Drawing.Size(216, 235);
            this.disciplinesList.TabIndex = 1;
            this.disciplinesList.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.disciplinesList_CellBeginEdit);
            this.disciplinesList.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.disciplinesList_CellEndEdit);
            // 
            // title
            // 
            this.title.HeaderText = "Название";
            this.title.Name = "title";
            this.title.Width = 200;
            // 
            // departmentsOperationsBox
            // 
            this.departmentsOperationsBox.Controls.Add(this.departmentsOperationsList);
            this.departmentsOperationsBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentsOperationsBox.Location = new System.Drawing.Point(3, 263);
            this.departmentsOperationsBox.Name = "departmentsOperationsBox";
            this.departmentsOperationsBox.Size = new System.Drawing.Size(221, 163);
            this.departmentsOperationsBox.TabIndex = 4;
            this.departmentsOperationsBox.TabStop = false;
            this.departmentsOperationsBox.Text = "Операции";
            // 
            // departmentsOperationsList
            // 
            this.departmentsOperationsList.Dock = System.Windows.Forms.DockStyle.Top;
            this.departmentsOperationsList.FormattingEnabled = true;
            this.departmentsOperationsList.Items.AddRange(new object[] {
            "Просмотреть",
            "Добавить",
            "Редактировать ",
            "Удалить"});
            this.departmentsOperationsList.Location = new System.Drawing.Point(3, 16);
            this.departmentsOperationsList.Name = "departmentsOperationsList";
            this.departmentsOperationsList.Size = new System.Drawing.Size(215, 21);
            this.departmentsOperationsList.TabIndex = 1;
            this.departmentsOperationsList.Text = "Операции...";
            // 
            // departmentsPage
            // 
            this.departmentsPage.Location = new System.Drawing.Point(4, 22);
            this.departmentsPage.Name = "departmentsPage";
            this.departmentsPage.Padding = new System.Windows.Forms.Padding(3);
            this.departmentsPage.Size = new System.Drawing.Size(915, 435);
            this.departmentsPage.TabIndex = 1;
            this.departmentsPage.Text = "Факультеты";
            this.departmentsPage.UseVisualStyleBackColor = true;
            // 
            // ULKSampleForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(923, 485);
            this.Controls.Add(this.operations);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "ULKSampleForm";
            this.Text = "Демо работы с БД";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.operations.ResumeLayout(false);
            this.mainPage.ResumeLayout(false);
            this.mainPage.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.disciplineOperationsBox.ResumeLayout(false);
            this.groupsOperationsBox.ResumeLayout(false);
            this.chairsOperationsBox.ResumeLayout(false);
            this.departmentsBox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.departmentsList)).EndInit();
            this.chairsBox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.chairsList)).EndInit();
            this.groupsBox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.groupsList)).EndInit();
            this.disciplineBox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.disciplinesList)).EndInit();
            this.departmentsOperationsBox.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem FileMenuItem;
        private System.Windows.Forms.ToolStripMenuItem EditMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ServiceMenuItem;
        private System.Windows.Forms.ToolStripMenuItem факультетыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem группыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem кафедрыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem дисциплиныToolStripMenuItem;
        private System.Windows.Forms.TabControl operations;
        private System.Windows.Forms.TabPage mainPage;
        private System.Windows.Forms.TabPage departmentsPage;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.GroupBox departmentsBox;
        private System.Windows.Forms.GroupBox chairsBox;
        private System.Windows.Forms.GroupBox groupsBox;
        private System.Windows.Forms.GroupBox disciplineBox;
        private System.Windows.Forms.GroupBox departmentsOperationsBox;
        private System.Windows.Forms.GroupBox groupsOperationsBox;
        private System.Windows.Forms.GroupBox chairsOperationsBox;
        private System.Windows.Forms.GroupBox disciplineOperationsBox;
        private System.Windows.Forms.ComboBox disciplinesOperationsList;
        private System.Windows.Forms.ComboBox chairsOperationsList;
        private System.Windows.Forms.ComboBox groupsOperationsList;
        private System.Windows.Forms.ComboBox departmentsOperationsList;
        private System.Windows.Forms.DataGridView departmentsList;
        private System.Windows.Forms.DataGridView chairsList;
        private System.Windows.Forms.DataGridView groupsList;
        private System.Windows.Forms.DataGridView disciplinesList;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private System.Windows.Forms.DataGridViewTextBoxColumn title;
    }
}

