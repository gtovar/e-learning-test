namespace UnnLearningKit
{
    partial class TestForm
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
            departmentTable.Finalize();
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.DGVDepartments = new System.Windows.Forms.DataGridView();
            this.Id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Title = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TBDTitle = new System.Windows.Forms.TextBox();
            this.BDAdd = new System.Windows.Forms.Button();
            this.BDUpdate = new System.Windows.Forms.Button();
            this.BDDelete = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.DGVDepartments)).BeginInit();
            this.SuspendLayout();
            // 
            // DGVDepartments
            // 
            this.DGVDepartments.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGVDepartments.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Id,
            this.Title});
            this.DGVDepartments.Location = new System.Drawing.Point(12, 47);
            this.DGVDepartments.Name = "DGVDepartments";
            this.DGVDepartments.Size = new System.Drawing.Size(438, 313);
            this.DGVDepartments.TabIndex = 0;
            this.DGVDepartments.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.DGVDepartments_CellClick);
            // 
            // Id
            // 
            this.Id.HeaderText = "Идентификатор";
            this.Id.Name = "Id";
            this.Id.Width = 90;
            // 
            // Title
            // 
            this.Title.HeaderText = "Название";
            this.Title.Name = "Title";
            this.Title.Width = 300;
            // 
            // TBDTitle
            // 
            this.TBDTitle.Location = new System.Drawing.Point(12, 13);
            this.TBDTitle.Name = "TBDTitle";
            this.TBDTitle.Size = new System.Drawing.Size(208, 20);
            this.TBDTitle.TabIndex = 1;
            // 
            // BDAdd
            // 
            this.BDAdd.Location = new System.Drawing.Point(229, 11);
            this.BDAdd.Name = "BDAdd";
            this.BDAdd.Size = new System.Drawing.Size(75, 23);
            this.BDAdd.TabIndex = 2;
            this.BDAdd.Text = "Добавить";
            this.BDAdd.UseVisualStyleBackColor = true;
            this.BDAdd.Click += new System.EventHandler(this.BDAdd_Click);
            // 
            // BDUpdate
            // 
            this.BDUpdate.Location = new System.Drawing.Point(306, 11);
            this.BDUpdate.Name = "BDUpdate";
            this.BDUpdate.Size = new System.Drawing.Size(75, 23);
            this.BDUpdate.TabIndex = 3;
            this.BDUpdate.Text = "Обновить";
            this.BDUpdate.UseVisualStyleBackColor = true;
            this.BDUpdate.Click += new System.EventHandler(this.BDUpdate_Click);
            // 
            // BDDelete
            // 
            this.BDDelete.Location = new System.Drawing.Point(383, 11);
            this.BDDelete.Name = "BDDelete";
            this.BDDelete.Size = new System.Drawing.Size(75, 23);
            this.BDDelete.TabIndex = 4;
            this.BDDelete.Text = "Удалить";
            this.BDDelete.UseVisualStyleBackColor = true;
            this.BDDelete.Click += new System.EventHandler(this.BDDelete_Click);
            // 
            // TestForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(462, 372);
            this.Controls.Add(this.BDDelete);
            this.Controls.Add(this.BDUpdate);
            this.Controls.Add(this.BDAdd);
            this.Controls.Add(this.TBDTitle);
            this.Controls.Add(this.DGVDepartments);
            this.Name = "TestForm";
            this.Text = "Факультеты";
            ((System.ComponentModel.ISupportInitialize)(this.DGVDepartments)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView DGVDepartments;
        private System.Windows.Forms.DataGridViewTextBoxColumn Id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Title;
        private System.Windows.Forms.TextBox TBDTitle;
        private System.Windows.Forms.Button BDAdd;
        private System.Windows.Forms.Button BDUpdate;
        private System.Windows.Forms.Button BDDelete;
    }
}

