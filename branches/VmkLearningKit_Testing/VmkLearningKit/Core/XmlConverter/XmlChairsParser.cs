using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlChairsParser : XmlAbstractParser
    {
        public override void DeleteNotExisted()
        {
        }
        
        public XmlChairsParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            ExistedDataIds.Clear();

            return true;
        }

        public override void ParseXml(string xmlUrl)
        {
            DeleteNotExisted();
            
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            // Извлекаемые данные
            string chairTitle, 
                   chairAbbreveation,
                   chairSite;

            //List<Chair> chairsList = new List<Chair>();

            Chair fakeChair         = new Chair();
            fakeChair.Title         = VLKConstants.FIELD_EMPTY;
            fakeChair.Abbreviation  = VLKConstants.FIELD_EMPTY;
            fakeChair.DepartmentId  = VLKConstants.VMK_DEPARTMENT_ID;
            fakeChair.Alias         = Transliteration.Front(VLKConstants.FIELD_EMPTY, TransliterationType.ISO);

            //chairsList.Add(fakeChair);
            repositoryManager.GetChairRepository.Add(fakeChair);

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element && 
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_CHAIR))
                {
                    chairTitle          = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);
                    chairAbbreveation   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION);
                    chairSite           = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SITE);

                    Chair chair         = new Chair();
                    chair.Title         = chairTitle;
                    chair.Abbreviation  = chairAbbreveation;
                    chair.DepartmentId  = VLKConstants.VMK_DEPARTMENT_ID;
                    chair.Alias         = Transliteration.Front(chairAbbreveation, TransliterationType.ISO);

                    if (chairSite != null &&
                        !chairSite.Equals(String.Empty))
                    {
                        chair.Description = HttpUtility.HtmlDecode("<a href=\"" + chairSite + "\">Сайт кафедры</a>");
                    }

                    //chairsList.Add(chair);
                    repositoryManager.GetChairRepository.Add(chair);
                }
            }

            //repositoryManager.GetChairRepository.Add(chairsList.AsEnumerable<Chair>());
        }
    }
}