using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Threading;
using System.Diagnostics;

namespace WordToScorm
{
    #region Structs

    /// <summary>
    /// Информация о scorm пакете, передаваемая в дочерний поток
    /// </summary>
    public struct ScormPackInfo
    {
        public string scormPackPath;
        public string scormPackName;
        public int variantsCount;

        public ScormPackInfo(string scormPackPath, string scormPackName, int variantsCount)
        {
            this.scormPackPath = scormPackPath;
            this.scormPackName = scormPackName;
            this.variantsCount = variantsCount;

        }
    }

    #endregion

    public partial class frmMain : Form
    {
        # region Private Fields

        /// <summary>
        /// Объект для чтения word документа
        /// </summary>
        private Reader reader;

        /// <summary>
        /// Список вопросов, содержащихся в word документе
        /// </summary>
        private AllQuestions allQuestions = new AllQuestions();

        /// <summary>
        /// Выходной набор тестов
        /// </summary>
        private TestsSet testsSet = new TestsSet();

        // Параметры списка вопросов -------------------------------------
        private int QuestionsCount;     // всего вопросов
        private int GroupsCount;        // всего групп вопросов
        private int QuestionsInGroup;   // к-во вопросов в группе
        private int[] QuestionsInGroups = new int[300];      // к-ва вопросов в группах
        private int[] FirstQuestionInGroup = new int[300];   // номер первого вопроса в группе
        private int[] LastQuestionInGroup = new int[300];    // номер последнего вопроса в группе

        // Параметры тестовых вариантов ----------------------------------
        private int VariantsCount;                  // всего вариантов
        private int QuestionsInVariant;             // к-во вопросов в вариантах
        private int[] QuestionGroup = new int[200]; // группа вопроса в варианте
        //------------------------------------------------------------------------
        private string DocName = string.Empty;
        private string DocPath = string.Empty;
        private string ScormName = string.Empty;
        private string ScormPath = string.Empty;

        //-----------------------------------------------------------------------

        #endregion

        #region Generate Test Variants

        private string ToStr(int nn, int npos, string sym)
        {
            string s, s1 = "";
            s = Convert.ToString(nn);
            int k = npos - s.Length;
            while (k-- != 0) s1 = s1 + sym;
            return s1 + s;
        }

        private int my_rand(int num)
        {
            int nv;
            double r, rnd;
            Random rand = new Random();
            rnd = int.MaxValue * 0.9;
            r = rand.Next();
            r = r / rnd;
            r = num * r;
            nv = (int)r;
            if ((r - nv) > 0.5) nv++;
            if (nv == num + 1) nv--;
            return nv;
        }

        private void DGGroupsCreate()
        {
            // Параметры списка вопросов
            if ((txtQuestionsCount.Text != "")&&(txtGroupsCount.Text != ""))
            {
                QuestionsCount = Convert.ToInt32(txtQuestionsCount.Text);  // к-во вопросов в списке вопросов
                GroupsCount = Convert.ToInt32(txtGroupsCount.Text);  // к-во групп вопросов

                // Формирование номеров вопросов в группах
                QuestionsInGroup = QuestionsCount / GroupsCount;
                int res = QuestionsCount % GroupsCount;
                for (int i = 0; i < GroupsCount; i++)
                {
                    QuestionsInGroups[i] = QuestionsInGroup;
                    if (res != 0) 
                    {
                        QuestionsInGroups[i]++;
                        res--;
                    }
                }
                dgGroups.RowCount = GroupsCount;

                DGGroupsUpdate();
            }
        }

        private void DGQuestionsCreate()
        {
            // Параметры тестовых вариантов
            if ((txtVariantsCount.Text != "") && (txtQuestionsInVariantCount.Text != ""))
            {
                VariantsCount = Convert.ToInt32(txtVariantsCount.Text);  // к-во вариантов требуемое
                QuestionsInVariant = Convert.ToInt32(txtQuestionsInVariantCount.Text);  // к-во вопросов в требуемых вариантах

                dgGuestions.RowCount = QuestionsInVariant;

                for (int i = 0; i < QuestionsInVariant; i++)
                {
                    dgGuestions.Rows[i].Cells[0].Value = Convert.ToString(i);
                }

                DGQuestionsUpdate();
            }
        }

        private void DGGroupsUpdate()
        {
            int nq = 1, s = 0;
            for (int i = 0; i < dgGroups.RowCount; i++)
            {
                dgGroups.Rows[i].Cells[0].Value = Convert.ToString(i + 1);
                dgGroups.Rows[i].Cells[1].Value = Convert.ToString(QuestionsInGroups[i]);
                FirstQuestionInGroup[i] = nq;
                LastQuestionInGroup[i] = nq + QuestionsInGroups[i] - 1;
                if (Convert.ToInt32(dgGroups.Rows[i].Cells[1].Value) != 0)
                {
                    dgGroups.Rows[i].Cells[2].Value = Convert.ToString(FirstQuestionInGroup[i]);
                    dgGroups.Rows[i].Cells[3].Value = Convert.ToString(LastQuestionInGroup[i]);
                }
                else
                {
                    dgGroups.Rows[i].Cells[2].Value = "-";
                    dgGroups.Rows[i].Cells[3].Value = "-";
                }
                nq += QuestionsInGroups[i];
                s += QuestionsInGroups[i];
            }
            lblCount.Text = s.ToString();
        }

        private void DGQuestionsUpdate()
        {
            double d = (double) QuestionsInVariant / QuestionsCount;
            int s = 0;
            int i;
            int[] qvg = new int[300]; // к-ва вопросов в группах тестового варианта
            for (i = 0; i < GroupsCount; i++)
            {
                qvg[i] = (int)(d * QuestionsInGroups[i]);
                s += qvg[i];
            }
            s = QuestionsInVariant - s;
            i = 0;
            while ((s != 0) && (i < GroupsCount))
            {
                if (d * QuestionsInGroups[i] - qvg[i] > 0.5)
                {
                    qvg[i]++; s--;
                }
                i++;
            }
            i = 0;
            while ( s != 0 ) 
            { 
                qvg[i]++; 
                s--; 
            }

            int j = 0;
            for (i = 0; i < QuestionsInVariant; i++)
            {
                QuestionGroup[i] = -1;
                while (QuestionGroup[i] == -1)
                {
                    if (qvg[j] != 0) 
                    { 
                        qvg[j]--; 
                        QuestionGroup[i] = j; 
                    }
                    else j++;
                }
            }

            for (i = 0; i < QuestionsInVariant; i++)
            {
                dgGuestions.Rows[i].Cells[0].Value = Convert.ToString(i + 1);
                dgGuestions.Rows[i].Cells[1].Value = Convert.ToString(QuestionGroup[i] + 1);
            }

        }

        private void CreateTestSets()
        {
            int i, j, i1, j1, n;

            VariantsCount = Convert.ToInt32(txtVariantsCount.Text);  // к-во вариантов требуемое
            QuestionsInVariant = Convert.ToInt32(txtQuestionsInVariantCount.Text);  // к-во вопросов в требуемых вариантах

            for (i = 0; i < dgGroups.RowCount - 1; i++)
            {
                QuestionsInGroups[i] = Convert.ToInt32(dgGroups.Rows[i].Cells[1].Value);
                FirstQuestionInGroup[i] = Convert.ToInt32(dgGroups.Rows[i].Cells[2].Value);
                LastQuestionInGroup[i] = Convert.ToInt32(dgGroups.Rows[i].Cells[3].Value);
            }
            for (i = 0; i < QuestionsInVariant; i++)
                QuestionGroup[i] = Convert.ToInt32(dgGuestions.Rows[i].Cells[1].Value) - 1;

            // Номера вопросов по группам
            int[,] Qnums = new int[300, 200];
            for (i = 0; i < GroupsCount; i++)
            {
                i1 = 0;
                for (j = 0; j < QuestionsInGroups[i]; j++)
                    Qnums[i, j] = FirstQuestionInGroup[i] + j;
            }
            // ------------------------------------------------
            // формирование вариантов --------------------------
            int[,] Vars = new int[200, 200];
            int ng, nv = 0;
            int[,] Mnums = new int[200, 200];  // Маски оставшихся вопросов в группе
            int[] kMnums = new int[200];      // К-ва оставшихся вопросов в группе
            int flg;

            for (i1 = 0; i1 < GroupsCount; i1++)
            {
                kMnums[i1] = QuestionsInGroups[i1];
                for (j1 = 0; j1 < QuestionsInGroups[i1]; j1++)
                {
                    Mnums[i1, j1] = 1;
                }
            }

            for (i = 0; i < VariantsCount; i++)
            {
                for (j = 0; j < QuestionsInVariant; j++)
                {
                    ng = QuestionGroup[j];
                    do
                    {
                        if (kMnums[ng] == 1)
                        {
                            for (j1 = 0; j1 < QuestionsInGroups[ng]; j1++)
                                if (Mnums[ng, j1] != 0) nv = j1;

                            kMnums[ng] = QuestionsInGroups[ng];
                            for (j1 = 0; j1 < QuestionsInGroups[ng]; j1++)
                                Mnums[ng, j1] = 1;

                            flg = 1;
                        }
                        else
                        {
                            nv = my_rand(QuestionsInGroups[ng] - 1);
                            if ((flg = Mnums[ng, nv]) != 0)
                            {
                                int ii = 0;
                                while ((flg != 0) && (ii < j))
                                    if (Vars[i, ii] == Qnums[ng, nv]) flg = 0; else ii++;
                                if (flg != 0)
                                {
                                    Mnums[ng, nv] = 0;
                                    kMnums[ng]--;
                                }
                            }
                        }
                    } while (flg == 0);
                    Vars[i, j] = Qnums[ng, nv];
                }
            }

            // Анализ результата ------------------------------
            int[] Qu = new int[500];
            int[] SQu = new int[500];
            n = 0;
            for (i = 0; i < GroupsCount; i++)
                for (j = 0; j < QuestionsInGroups[i]; j++)
                {
                    Qu[n] = Qnums[i, j];
                    SQu[n] = 0;
                    for (i1 = 0; i1 < VariantsCount; i1++)
                        for (j1 = 0; j1 < QuestionsInVariant; j1++)
                            if (Qu[n] == Vars[i1, j1]) SQu[n]++;
                    n++;
                }

            // Вывод результата --------------------------------
            for (i = 0; i < VariantsCount; i++)
            {
                Test test = new Test();
                for (j = 0; j < QuestionsInVariant; j++)
                {
                    test.InsertQuestion(allQuestions[Vars[i, j] - 1]);
                }

                int score = 0;
                for (int k = 0; k < test.Count; k++)
                    for (int p = 0; p < test[k].AnswersCount; p++)
                        score += test[k][p].Score;
                test.Author = "None";
                test.Language = "RU";
                test.MaxScore = score;
                test.UnitName = "Вариант " + (i + 1);
                test.Title = "";
                test.NegativeMarks = cbNegativeMark.Checked;
                testsSet.InsertTest(test);
            }

            
            List<string> lst = new List<string>();
            string s;
            for (i = 0; i < n; i++)
            {
                s = ToStr(SQu[i], 2, "0") + " " + ToStr(Qu[i], 4, " ");
                lst.Add(s);
            }
            lst.Sort();
            s = "   ";
            for (i = 0; i < VariantsCount; i++)
            {
                s = s + ToStr(i + 1, 5, " ");
            }
            lst.Add(s);

            for (j = 0; j < QuestionsInVariant; j++)
            {
                s = ToStr(j + 1, 2, " ") + ")";
                for (i = 0; i < VariantsCount; i++)
                {
                    s = s + ToStr(Vars[i, j], 5, " ");
                }
                lst.Add(s);
            }

            string InfoFile = Path.GetDirectoryName(txtDocFile.Text) + "\\info.txt";
            FileStream fs = new FileStream(InfoFile, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            for (i = 0; i < lst.Count; i++)
                sw.WriteLine(lst[i]);
            sw.Close();
            fs.Close();

            if (cbShowInfo.Checked == true)
                System.Diagnostics.Process.Start("notepad.exe", InfoFile);

        }

        #endregion

        #region Public Methods

        public frmMain()
        {
            InitializeComponent();
        }

        #endregion

        #region File Dialogs

        private void btnOpenWordDocClick(object sender, EventArgs e)
        {
            System.Windows.Forms.OpenFileDialog openfiledlg = new System.Windows.Forms.OpenFileDialog();
            openfiledlg.Filter = "Документы Mocrosoft Word|*.doc";
            openfiledlg.Title = "Выберите документ Mocrosoft Word...";

            if (openfiledlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtDocFile.Text = openfiledlg.FileName;
                txtScormPackPath.Text = Path.GetDirectoryName(openfiledlg.FileName);
                txtScormPackName.Text = Path.GetFileNameWithoutExtension(openfiledlg.FileName) + "_Вар_";
            }
            lblStatus.Text = "Нажмите кнопку \"Обработать\"...";
        }

        private void btnSaveScormPackClick(object sender, EventArgs e)
        {
            System.Windows.Forms.SaveFileDialog savefiledlg = new System.Windows.Forms.SaveFileDialog();
            savefiledlg.Filter = "SCORM пакеты|*.zip";
            savefiledlg.Title = "Введите имя файла SCORM пакета...";
            if (savefiledlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtScormPackPath.Text = Path.GetDirectoryName(savefiledlg.FileName);
                txtScormPackName.Text = Path.GetFileNameWithoutExtension(savefiledlg.FileName);
            }
        }

        #endregion

        #region Create Scorm Packs

        /// <summary>
        /// Выполняется создание scorm пакетов в дочернем потоке
        /// </summary>
        /// <param name="scormPackInfo"></param>
        /// <param name="backgroundScormBuilder"></param>
        private void CreateScormPacks(ScormPackInfo scormPackInfo, 
            BackgroundWorker backgroundScormBuilder)
        {
            int variantsCount = scormPackInfo.variantsCount;
            string ScormPack = scormPackInfo.scormPackPath + "\\" +
                               scormPackInfo.scormPackName;
            DateTime startTime = DateTime.Now;
            for (int i = 0; i < variantsCount; i++)
            {
                ScormBuilder sb = new ScormBuilder(testsSet[i], ScormPack + (i + 1) + ".zip");
                sb.CreateScorm();

                backgroundScormBuilder.ReportProgress((int)((100f / (float)variantsCount) * i),
                    DateTime.Now - startTime);
            }
        }

        /// <summary>
        /// Обработчик события - создания scorm пакетов
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCreateScormPacksClick(object sender, EventArgs e)
        {
            progressBar.Value = 0;
            labelTime.Text = "0 мин 0 сек";

            CreateTestSets();
            if (txtScormPackPath.Text == string.Empty)
                MessageBox.Show("Выберите каталог для SCORM пакетов!");
            else if (txtScormPackName.Text == string.Empty)
                MessageBox.Show("Выберите имя файла для SCORM пакета!");
            else if (testsSet.Count == 0)
                MessageBox.Show("Нет тестов для упаковки в SCORM!");
            else
            {
                ScormPackInfo scormPackInfo = new ScormPackInfo(txtScormPackPath.Text,
                    txtScormPackName.Text, testsSet.Count);
                btnCreateScormPacks.Enabled = false;
                backgroundScormBuilder.RunWorkerAsync(scormPackInfo);
            }
        }

        /// <summary>
        /// Выполняет создание дочерних потоков в дочернем потоке
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundScormBuilderDoWork(object sender, DoWorkEventArgs e)
        {
            CreateScormPacks((ScormPackInfo)e.Argument, backgroundScormBuilder);
        }

        /// <summary>
        /// Выполняет обновление progressBar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundScormBuilderProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            if (e.ProgressPercentage < progressBar.Maximum)
            {
                progressBar.Value = e.ProgressPercentage;
            }

            labelTime.Text = ((TimeSpan)e.UserState).Minutes.ToString() + " мин " + ((TimeSpan)e.UserState).Seconds.ToString() + " сек";
        }

        /// <summary>
        /// Завершает выполнение потока
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundScormBuilderRunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            progressBar.Value = progressBar.Maximum;
            btnCreateScormPacks.Enabled = true;
        }

        #endregion

        #region Read Word Document

        /// <summary>
        /// Запускает дочерний поток
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundReadWordDocDoWork(object sender, DoWorkEventArgs e)
        {
            e.Result = RunReader((string)e.Argument);
        }

        /// <summary>
        /// Обновляет состояние progressBar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundReadWordDocProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            if (e.ProgressPercentage < progressBar.Maximum)
            {
                progressBar.Value = e.ProgressPercentage;
            }

            labelTime.Text = ((TimeSpan)e.UserState).Minutes.ToString() + " мин " + ((TimeSpan)e.UserState).Seconds.ToString() + " сек";
        }

        /// <summary>
        /// Завершает выполнение потока
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundReadWordDocRunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            allQuestions = (AllQuestions)e.Result;

            lblQuestionsCount.Text = allQuestions.Count.ToString();
            txtQuestionsCount.Text = allQuestions.Count.ToString();
            txtQuestionsInVariantCount.Text = allQuestions.Count.ToString();
            lblAlterQuestCount.Text = "0";
            lblDistrQuestCount.Text = "0";
            lblYourAnsQuestCount.Text = "0";
            for (int i = 0; i < allQuestions.Count; i++)
            {
                if (allQuestions[i].Type == QuestionType.Alternative)
                    lblAlterQuestCount.Text = Convert.ToString(Convert.ToInt32(lblAlterQuestCount.Text) + 1);
                if (allQuestions[i].Type == QuestionType.Distributive)
                    lblDistrQuestCount.Text = Convert.ToString(Convert.ToInt32(lblDistrQuestCount.Text) + 1);
                if (allQuestions[i].Type == QuestionType.YourAnswer)
                    lblYourAnsQuestCount.Text = Convert.ToString(Convert.ToInt32(lblYourAnsQuestCount.Text) + 1);
            }
            DGGroupsCreate();
            DGQuestionsCreate();

            progressBar.Value = progressBar.Maximum;
            btnReadWordDoc.Enabled = true;
            lblStatus.Text = "Обработка документа Word завершена...";
        }

        /// <summary>
        /// Чтение документа word в дочернем потоке
        /// </summary>
        /// <param name="pathDocument"></param>
        /// <returns></returns>
        private AllQuestions RunReader(string pathDocument)
        {
            return reader.ReadWordDocument(backgroundWordDocReader);
        }

        /// <summary>
        /// Обработчик события -  прочитать word документ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnReadWordDocClick(object sender, EventArgs e)
        {
            progressBar.Value = 0;
            labelTime.Text = "0 мин 0 сек";

            if (txtDocFile.Text != string.Empty)
            {
                lblStatus.Text = "Обработка документа Word начата...";
                btnReadWordDoc.Enabled = false;
                ProcessingQuestion processQuestion = ProcessingQuestion.withOnlyPositiveMark;
                if (cbNegativeMark.Checked == true)
                {
                    processQuestion = ProcessingQuestion.withNegativeMark;
                }
                else
                {
                    if (OnlyPositiveMark.Checked == true)
                    {
                        processQuestion = ProcessingQuestion.withOnlyPositiveMark;
                    }
                }
                reader = new Reader(txtDocFile.Text, processQuestion);
                reader.OpenWordDocument();
                reader.SaveAllImages();
                lblStatus.Text = "Обработка документа Word в процессе...";
                backgroundWordDocReader.RunWorkerAsync(txtDocFile.Text);
            }
            else
                MessageBox.Show("Выберите файл с тестами!");

        }

        #endregion

        #region Handlers

        private void dgGroups_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            if (Convert.ToInt32(dgGroups.CurrentCell.Value) < 0)
            {
                MessageBox.Show("Было введено отрицательное значение!");
                dgGroups.CurrentCell.Value = "0";
            }
        }

        private void edKVR_TextChanged(object sender, EventArgs e)
        {
            DGQuestionsCreate();
        }

        private void btnReCalc_Click(object sender, EventArgs e)
        {
            int q = 0, k = 0;
            for (int i = 0; i < dgGroups.RowCount; i++)
            {
                k = Convert.ToInt32(dgGroups.Rows[i].Cells[1].Value);
                if (k < 0)
                {
                    dgGroups.Rows[i].Cells[1].Value = "0";
                    k = 0;
                }
                q += k;
            }
            if (q > allQuestions.Count)
                MessageBox.Show("Суммарное количество вопросов в группах превышает общее число вопросов!");
            else if (q == 0)
                MessageBox.Show("Невозможно создать тест без вопросов!");
            else
            {
                DGGroupsUpdate();
                DGQuestionsUpdate();
            }
        }

        private void sgrGrp_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int nq = 1, s = 0;
            for (int i = 0; i < dgGroups.RowCount; i++)
            {
                dgGroups.Rows[i].Cells[0].Value = Convert.ToString(i + 1);
                QuestionsInGroups[i] = Convert.ToInt32(dgGroups.Rows[i].Cells[1].Value);
                dgGroups.Rows[i].Cells[2].Value = "";
                dgGroups.Rows[i].Cells[3].Value = "";
                nq += QuestionsInGroups[i];
                s += QuestionsInGroups[i];
            }
            lblCount.Text = s.ToString();
        }

        private void edKGV_TextChanged(object sender, EventArgs e)
        {
            DGGroupsCreate();
        }

        private void edKQR_TextChanged(object sender, EventArgs e)
        {
            if (txtQuestionsInVariantCount.Text != string.Empty)
            {
                if (Convert.ToInt32(txtQuestionsInVariantCount.Text) > allQuestions.Count)
                {
                    MessageBox.Show("Количество вопросов в тесте не может быть больше общего числа вопросов!");
                    txtQuestionsInVariantCount.Text = allQuestions.Count.ToString();
                }
                else
                    DGQuestionsCreate();
            }
            else
                txtQuestionsInVariantCount.Text = "0";
        }

        private void btnCloseClick(object sender, EventArgs e)
        {
            Close();
        }

        #endregion

    }
}