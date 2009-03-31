using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using ULKLibs;

namespace UnnLearningKit
{
    public partial class TestForm : Form
    {
        private IDepartmentTable departmentTable = new DepartmentTable((IDepartmentTable)(new LocalDepartmentTable()));
        public TestForm()
        {
            InitializeComponent();
            departmentTable.Initialize();

            List<Record> departmentList = departmentTable.GetAllRecords();
            foreach (Record tmpRecord in departmentList)
            {
                DGVDepartments.Rows.Add(tmpRecord.Id.Value, ((DepartmentRecord)tmpRecord).Title.Value);
            }
        }

        private void BDAdd_Click(object sender, EventArgs e)
        {
            bool result = departmentTable.AddRecord(new DepartmentRecord(new Id(0), new Title(TBDTitle.Text))); DGVDepartments.Rows.Clear();
            // загрузка данных в таблицу
            List<Record> departmentList = departmentTable.GetAllRecords();
            foreach (Record tmpRecord in departmentList)
            {
                DGVDepartments.Rows.Add(tmpRecord.Id.Value, ((DepartmentRecord)tmpRecord).Title.Value);
            }
        }

        private void BDUpdate_Click(object sender, EventArgs e)
        {
            int selectedIndex = DGVDepartments.SelectedCells[0].RowIndex;
            int selectedId = Convert.ToInt32(DGVDepartments[0, selectedIndex].Value);
            string newTitle = TBDTitle.Text;
            bool result = departmentTable.UpdateRecord(new DepartmentRecord(new Id(selectedId), new Title(newTitle)));

            DGVDepartments.Rows.Clear();
            // загрузка данных в таблицу
            List<Record> departmentList = departmentTable.GetAllRecords();
            foreach (Record tmpRecord in departmentList)
            {
                DGVDepartments.Rows.Add(tmpRecord.Id.Value, ((DepartmentRecord)tmpRecord).Title.Value);
            }
        }

        private void BDDelete_Click(object sender, EventArgs e)
        {
            int selectedIndex = DGVDepartments.SelectedCells[0].RowIndex;
            int selectedId = Convert.ToInt32(DGVDepartments[0, selectedIndex].Value);

            bool result = departmentTable.DeleteRecord(new Id(selectedId));

            DGVDepartments.Rows.Clear();
            // загрузка данных в таблицу
            List<Record> departmentList = departmentTable.GetAllRecords();
            foreach (Record tmpRecord in departmentList)
            {
                DGVDepartments.Rows.Add(tmpRecord.Id.Value, ((DepartmentRecord)tmpRecord).Title.Value);
            }
        }

        private void DGVDepartments_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int tmpId = Convert.ToInt32(DGVDepartments[0, e.RowIndex].Value.ToString());
                Record tmpRecord = departmentTable.GetRecordById(new Id(tmpId));
                TBDTitle.Text = ((DepartmentRecord)tmpRecord).Title.Value.ToString();
            }
            catch (Exception ex)
            {
                TBDTitle.Text = "";
            }
        }
    }
}