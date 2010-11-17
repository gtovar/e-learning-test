using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace VmkLearningKit.Models.Repository
{
    public class Index
    {
        public void Write(string FileName)
        {
            FileStream fs = new FileStream(FileName, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine("<?xml version=\"1.0\" ?> ");
            sw.WriteLine("<LearningResource xmlns=\"urn:schemas-microsoft-com:learning-resource\" Version=\"1.0\">");
            sw.WriteLine("<PackageDescription>");
            sw.WriteLine("<General>");
            sw.WriteLine("<Language>" + "ru" + "</Language> ");//*
            sw.WriteLine("<Title>" + "TestName" + "</Title> ");//*
            sw.WriteLine("<Description /> ");
            sw.WriteLine("<Keywords /> ");
            sw.WriteLine("<LearningResourceData SubjectTopicList=\"GEM\" Icon=\"\" RelatedStandard=\"\" DateCreated=\"39070.6310532407\" RegionID=\"1201\" PointsPossible=\"" + "test.MaxScore" + "\" Attachment=\"\" Type=\"\" UnitName=\"\" ChapterName=\"\" Author=\"\" AuthorEmail=\"\" Publisher=\"\" CurriculumSeries=\"" + "TestName" + "\" Copyright=\"\" CurriculumSequence=\"0\" LastModifiedBy=\"" + "test.Author" + "\" Subject=\"\" Topic=\"\" KeyStage=\"\" AgeMin=\"\" AgeMax=\"\" IsPublishable=\"1\" IsTemplate=\"0\" IsLocked=\"0\" SuitableFor=\"\" BloomTaxonomy=\"\" GardnerMultipleIntelligences=\"\" DateModified=\"39070.6310532407\">");//*
            sw.WriteLine("<Instructions /> ");
            sw.WriteLine("<Assessment /> ");
            sw.WriteLine("<PublisherURL /> ");
            sw.WriteLine("<ID CreationID=\"CD7E43D2-0C18-4834-B6DD-C02F97F72113\" BranchID=\"F41A6835-8E0E-4005-9254-140F62AA346C\" /> ");
            sw.WriteLine("<Format VersionModifiedMax=\"3.0\" VersionModifiedLast=\"3.0\" DateModifiedVersion=\"39070.6310532407\" /> ");
            sw.WriteLine("<Licenses /> ");
            sw.WriteLine("</LearningResourceData>");
            sw.WriteLine("</General>");
            sw.WriteLine("<Technical>");
            sw.WriteLine("<Duration>3600</Duration>");
            sw.WriteLine("</Technical>");
            sw.WriteLine("<Classification>");
            sw.WriteLine("<EducationalObjective /> ");
            sw.WriteLine("</Classification>");
            sw.WriteLine("</PackageDescription>");
            sw.WriteLine("<Organization>");
            sw.WriteLine("<TableOfContents>");
            sw.WriteLine("<Page PageID=\"1000\" Title=\"" + "test.UnitName" + "\" />");//*
            sw.WriteLine("</TableOfContents>");
            sw.WriteLine("</Organization>");
            sw.WriteLine("</LearningResource>");

            sw.Close();
            fs.Close();
        }
    }
}
