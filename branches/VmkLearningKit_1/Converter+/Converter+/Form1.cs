using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Converter;

namespace Converter_
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            progressBar1.Style = ProgressBarStyle.Continuous;
            progressBar1.Minimum = 0;
            progressBar1.Step = 1;
            progressBar1.Value = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {

            OpenFileDialog dialog = new OpenFileDialog();
            dialog.ShowDialog();
            textBox1.Text = dialog.FileName;

            textBox2.Text = textBox1.Text.ToLower().Replace(".docx", ".xml");
            textBox2.Text = textBox2.Text.ToLower().Replace(".doc", ".xml");
            textBox2.Text = textBox2.Text.ToLower().Replace(".xls", ".xml");

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text.Substring(textBox1.Text.LastIndexOf("\\") + 1);
            name = name.Replace(".doc", "");
            name = name.Replace(".xls", "");
            name = name.Trim();

            progressBar1.Value = 0;

            List<string> structPlan = new List<string>();
            for (int i = 0; i < richTextBox2.Lines.Count(); i++)
            {
                structPlan.Add(richTextBox2.Lines[i]);
            }
            switch ((string)comboBox1.SelectedItem)
            {
                case "Список кафедр":
                    ChairConverter conv1 = new ChairConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv1.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv1.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Список преподавателей":
                    TeacherConverter conv2 = new TeacherConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv2.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv2.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Список специальностей":
                    SpecialityConverter conv3 = new SpecialityConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv3.ConvertDocument(textBox1.Text, textBox2.Text);
                    foreach (string s in conv3.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Список студентов":
                    StudentConverter conv4 = new StudentConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv4.ConvertDocument(textBox1.Text, textBox2.Text);
                    foreach (string s in conv4.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Список групп":
                    GroupConverter conv5 = new GroupConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv5.ConvertDocument(textBox1.Text, textBox2.Text);
                    foreach (string s in conv5.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Программа дисциплины":
                    DisciplineProgramConverter conv6 = new DisciplineProgramConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv6.ConvertDocument(textBox1.Text, textBox2.Text, structPlan);
                    foreach (string s in conv6.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Учебный план":
                    EducationPlanConverter conv7 = new EducationPlanConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv7.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv7.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
                case "Расписание":
                    ScheduleConverter conv8 = new ScheduleConverter();
                    richTextBox1.Text = "Подождите несколько секунд - идет конвертирование\n";
                    conv8.ConvertDocument(textBox1.Text, textBox2.Text, null, progressBar1);
                    richTextBox1.Text = "";
                    foreach (string s in conv8.Message)
                    {
                        richTextBox1.Text += s + "\n";
                    }
                    break;
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                label4.Visible = true;
                richTextBox2.Visible = true;
                this.Height = 500;
            }
            else
            {
                label4.Visible = false;
                richTextBox2.Visible = false;
                this.Height = 305;
            }
        }
    }
}
