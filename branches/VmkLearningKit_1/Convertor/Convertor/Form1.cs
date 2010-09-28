using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Converter
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.ShowDialog();
            textBox1.Text = dialog.FileName;

            textBox2.Text = textBox1.Text.Replace(".docx", ".xml");
            textBox2.Text = textBox2.Text.Replace(".doc", ".xml");
            textBox2.Text = textBox2.Text.Replace(".xls", ".xml");

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text.Substring(textBox1.Text.LastIndexOf("\\")+1);
            name = name.Replace(".doc", "");
            name = name.Replace(".xls", "");
            name = name.Trim();
            switch (name)
            {
                case "Список кафедр":
                    ChairConverter conv1 = new ChairConverter();
                    conv1.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach(string s in conv1.Message)
                    {
                        richTextBox1.Text += s + "\r\a";
                    }
                    break;
                case "Список преподавателей":
                    TeacherConverter conv2 = new TeacherConverter();
                    conv2.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv2.Message)
                    {
                        richTextBox1.Text += s + "\r\a";
                    }
                    break;
                case "Список специальностей":
                    SpecialityConverter conv3 = new SpecialityConverter();
                    conv3.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv3.Message)
                    {
                        richTextBox1.Text += s + "\r\a";
                    }
                    break;
                case "Список студентов":
                    StudentConverter conv4 = new StudentConverter();
                    conv4.ConvertDocument(textBox1.Text, textBox2.Text);
                    break;
                case "Список групп":
                    GroupConverter conv5 = new GroupConverter();
                    conv5.ConvertDocument(textBox1.Text, textBox2.Text);                  
                    break;
                case "Программа дисциплин":
                    DisciplineProgramConverter conv6 = new DisciplineProgramConverter();
                    conv6.ConvertDocument(textBox1.Text, textBox2.Text);
                    richTextBox1.Text = "";
                    foreach (string s in conv6.text)
                    {
                        richTextBox1.Text += s + "\r\a";
                    }
                    break;
                   
            }
        }
    }
}
