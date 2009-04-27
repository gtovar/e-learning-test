using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UnnLearningKitLibrary;

namespace ULKSample
{
    public partial class ULKSampleForm : Form
    {
        ITable table;
        const int UPDATING_OBJ = -1;
        const int ADDING_OBJ = -2;
        const int NONE_OBJ = -3;
        const int FAKE_ID = -4;

        int chair_id = FAKE_ID;
        int department_id = FAKE_ID;
        Obj editing_obj = null;
        int status = NONE_OBJ;

        public ULKSampleForm()
        {
            InitializeComponent();
            MainPage();
        }

        public void MainPage()
        {
            ViewDepartments();
        }

        public void ViewDepartments()
        {
            table = new DepartmentTable();
            departmentsList.Rows.Clear();
            try
            {
                List<Obj> departments = table.GetAll();
                foreach (Obj department in departments)
                {
                    departmentsList.Rows.Add(department);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void ViewChairs(int departmentId)
        {
            table = new ChairTable();
            chairsList.Rows.Clear();
            try
            {
                List<Obj> chairs = ((IChairTable)table).GetAllByDepartmentId(departmentId);
                foreach (Obj chair in chairs)
                {
                    chairsList.Rows.Add(chair);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void ViewGroups(int departmentId)
        {
            table = new GroupTable();
            groupsList.Rows.Clear();
            try
            {
                List<Obj> groups = ((IGroupTable)table).GetAllByDepartmentId(departmentId);
                foreach (Obj group in groups)
                {
                    groupsList.Rows.Add(group);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void ViewDisciplines(int departmentId)
        {
            table = new DisciplineTable();
            disciplinesList.Rows.Clear();
            try
            {
                List<Obj> disciplines = ((IDisciplineTable)table).GetAllByDepartmentId(departmentId);
                foreach (Obj discipline in disciplines)
                {
                    disciplinesList.Rows.Add(discipline);
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void departmentsList_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int selectedIndex = e.RowIndex;
                department_id = ((Obj)departmentsList[0, selectedIndex].Value).Id;

                ViewChairs(department_id);
                ViewDisciplines(department_id);
                ViewGroups(department_id);
            }
            catch (Exception ex)
            {
            }
        }

        private void disciplinesList_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (disciplinesList[0, selectedIndex].Value != null)
            {
                string title = disciplinesList[0, selectedIndex].Value.ToString();
                table = new DisciplineTable();
                if (status == ADDING_OBJ)
                {
                    table.Add(new Discipline(FAKE_ID, department_id, chair_id, title));
                }
                else
                {
                    ((Discipline)editing_obj).Title = disciplinesList[0, selectedIndex].Value.ToString();
                    table.Update(editing_obj);
                }
            }
        }

        private void departmentsList_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (departmentsList[0, selectedIndex].Value is Obj)
            {
                editing_obj = (Obj)departmentsList[0, selectedIndex].Value;
                status = UPDATING_OBJ;
            }
            else
            {
                editing_obj = null;
                status = ADDING_OBJ;
            }
        }

        private void departmentsList_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (departmentsList[0, selectedIndex].Value != null)
            {
                string title = departmentsList[0, selectedIndex].Value.ToString();
                table = new DepartmentTable();
                if (status == ADDING_OBJ)
                {
                    table.Add(new Department(FAKE_ID, title));
                }
                else if(status == UPDATING_OBJ)
                {
                    ((Department)editing_obj).Title = departmentsList[0, selectedIndex].Value.ToString();
                    table.Update(editing_obj);
                }
                ViewDepartments();
            }
        }

        private void chairsList_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (chairsList[0, selectedIndex].Value != null)
            {
                string title = chairsList[0, selectedIndex].Value.ToString();
                table = new ChairTable();
                if (status == ADDING_OBJ)
                {
                    table.Add(new Chair(FAKE_ID, department_id, title));
                }
                else if (status == UPDATING_OBJ)                
                {
                    ((Chair)editing_obj).Title = chairsList[0, selectedIndex].Value.ToString();
                    table.Update(editing_obj);
                }

                ViewChairs(department_id);
            }
        }

        private void groupsList_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (groupsList[0, selectedIndex].Value != null)
            {
                string title = groupsList[0, selectedIndex].Value.ToString();
                table = new GroupTable();
                if (status == ADDING_OBJ)
                {
                    table.Add(new Group(FAKE_ID, department_id, title));
                }
                else if (status == UPDATING_OBJ)
                {
                    ((Group)editing_obj).Title = groupsList[0, selectedIndex].Value.ToString();
                    table.Update(editing_obj);
                }

                ViewGroups(department_id);
            }
        }

        private void chairsList_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (chairsList[0, selectedIndex].Value is Obj)
            {
                editing_obj = (Obj)chairsList[0, selectedIndex].Value;
                status = UPDATING_OBJ;
            }
            else
            {
                editing_obj = null;
                status = ADDING_OBJ;
            }
        }

        private void groupsList_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (groupsList[0, selectedIndex].Value is Obj)
            {
                editing_obj = (Obj)groupsList[0, selectedIndex].Value;
                status = UPDATING_OBJ;
            }
            else
            {
                editing_obj = null;
                status = ADDING_OBJ;
            }
        }

        private void disciplinesList_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            int selectedIndex = e.RowIndex;
            if (disciplinesList[0, selectedIndex].Value is Obj)
            {
                editing_obj = (Obj)disciplinesList[0, selectedIndex].Value;
                status = UPDATING_OBJ;
            }
            else
            {
                editing_obj = null;
                status = ADDING_OBJ;
            }
        }

        private void chairsList_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int selectedIndex = e.RowIndex;
                chair_id = ((Obj)chairsList[0, selectedIndex].Value).Id;
            }
            catch (Exception ex)
            {
            }
        }
    }
}
