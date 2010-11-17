using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace VmkLearningKit.Models.Repository
{
    public class Theme
    {
        public void Write(string FileName)
        {
            FileStream fs = new FileStream(FileName, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine("/* Standard HTML styles */");
            sw.WriteLine("body	{ background-color: white; color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif }");
            sw.WriteLine("p 	{ margin-top: 0; margin-bottom: 0 }");
            sw.WriteLine("ol 	{ margin-top: 0; margin-bottom: 0 }");
            sw.WriteLine("ul 	{ margin-top: 0; margin-bottom: 0 }");
            sw.WriteLine("table 	{ color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif }");
            sw.WriteLine("/* The main text regions of the template are defined by these styles */");
            sw.WriteLine("table.bodytable	{ border-collapse: collapse; color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif; background-color: white }");
            sw.WriteLine("td.banner	{ color: black; font-weight: bold; font-size: medium; padding: 8px }");
            sw.WriteLine("td.bodycell	{ color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif; padding: 8px }");
            sw.WriteLine("/* Styles specific to Class Server question tables */");
            sw.WriteLine("/* QTable	The overall table containing the question and rubric	 	*/");
            sw.WriteLine("/* QNum		The cell containing the question number				*/");
            sw.WriteLine("/* QPts		The cell containing the number of points the question is worth	*/");
            sw.WriteLine("/* AText	Cells containing answers or answer blanks			*/");
            sw.WriteLine("/* RTable	The overall table containing a rubric				*/");
            sw.WriteLine("/* RTitle	Used for the title row of the rubric and for major headings	*/");
            sw.WriteLine("/* RHeader	Used for performance objectives or minor headings		*/");
            sw.WriteLine("/* RText	General text cells in a rubric					*/");
            sw.WriteLine("/* RPts		The checkboxes and point values for the rubric elements		*/");
            sw.WriteLine("table.QTable	{ width: 99%; border-collapse: collapse; color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif; margin-top: 15px; margin-bottom: 15px }");
            sw.WriteLine("td.QNum		{ font-weight: bold }");
            sw.WriteLine("td.QText	{ }");
            sw.WriteLine("td.QPts		{ font-weight: bold; color: gray }");
            sw.WriteLine("td.AText	{ }");
            sw.WriteLine("table.RTable	{ color: black; font-size: x-small; font-family: Arial, Helvetica, sans-serif; border: 1px solid black; border-collapse: collapse; background-color: #F1F1F1 }");
            sw.WriteLine("td.RTitle	{ background-color: black; color: #F1F1F1; font-weight: bold }");
            sw.WriteLine("td.RHeader	{ font-weight: bold }");
            sw.WriteLine("td.RText	{ }");
            sw.WriteLine("td.RPts		{ width: 0% }");

            sw.Close();
            fs.Close();
        }
    }
}
