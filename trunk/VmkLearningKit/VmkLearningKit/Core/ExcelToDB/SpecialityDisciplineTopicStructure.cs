using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class SpecialityDisciplineTopicVolume
    {
        public short Volume;
        public long SpecialityDisciplineTopicId;
    }

    public class SpecialityDisciplineTopicStructureObj
    {
        public SpecialityDiscipline SpecialityDiscipline;
        public List<SpecialityDisciplineTopic> SpecialityDisciplineTopics;
        public List<SpecialityDisciplineTopicVolume> SpecialityDisciplineTopicLectureVolumes;
        public List<SpecialityDisciplineTopicVolume> SpecialityDisciplineTopicPracticeVolumes;

        public void Commit()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            long specialityDisciplineIdBeforeCommit = SpecialityDiscipline.Id;
            SpecialityDiscipline specialityDisciplineFromDB = repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(SpecialityDiscipline.Title);
            if (null != specialityDisciplineFromDB)
            {
                foreach (SpecialityDisciplineTopic specialityDisciplineTopic in SpecialityDisciplineTopics)
                {
                    if (specialityDisciplineTopic.SpecialityDisciplineId == specialityDisciplineIdBeforeCommit)
                    {
                        long specialityDisciplineTopicIdBeforeCommit = specialityDisciplineTopic.Id;
                        specialityDisciplineTopic.SpecialityDisciplineId = specialityDisciplineFromDB.Id;
                        SpecialityDisciplineTopic specialityDisciplineTopicFromDB = repositoryManager.GetSpecialityDisciplineTopicRepository.GetByTitle(specialityDisciplineTopic.Title);
                        
                        if (null == specialityDisciplineTopicFromDB)
                        {
                            specialityDisciplineTopicFromDB = repositoryManager.GetSpecialityDisciplineTopicRepository.Add(specialityDisciplineTopic);
                            if (null == specialityDisciplineTopicFromDB)
                            {
                                // FIXME: specialityDisciplineTopic isn't added
                            }
                        }
                        if (null != specialityDisciplineTopicFromDB)
                        {
                            foreach (SpecialityDisciplineTerm specialityDisciplineTerm in specialityDisciplineFromDB.SpecialityDisciplineTerms)
                            {
                                if (0 != specialityDisciplineTerm.LectureVolume)
                                {
                                    IEnumerable<LecturePlan> lecturePlans = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineTopicId(specialityDisciplineTopicFromDB.Id);
                                    if (null == lecturePlans || lecturePlans.Count() == 0)
                                    {
                                        LecturePlan lecturePlan = new LecturePlan();
                                        lecturePlan.Date = null;
                                        lecturePlan.SpecialityDisciplineId = specialityDisciplineFromDB.Id;
                                        lecturePlan.SpecialityDisciplineTopicId = specialityDisciplineTopicFromDB.Id;
                                        lecturePlan.Volume = 0;
                                        foreach (SpecialityDisciplineTopicVolume specialityDisciplineTopicVolume in SpecialityDisciplineTopicLectureVolumes)
                                        {
                                            if (specialityDisciplineTopicVolume.SpecialityDisciplineTopicId == specialityDisciplineTopicIdBeforeCommit)
                                            {
                                                lecturePlan.Volume = specialityDisciplineTopicVolume.Volume;
                                                break;
                                            }
                                        }
                                        LecturePlan lecturePlanFromDB = repositoryManager.GetLecturePlanRepository.Add(lecturePlan);
                                        if (null == lecturePlanFromDB)
                                        {
                                            // FIXME: can't add new practice plan
                                        }
                                    }
                                }
                                if (0 != specialityDisciplineTerm.PracticeVolume)
                                {
                                    IEnumerable<PracticePlan> practicePlans = repositoryManager.GetPracticePlanRepository.GetBySpecialityDisciplineTopicId(specialityDisciplineTopicFromDB.Id);
                                    if (null == practicePlans || practicePlans.Count() == 0)
                                    {
                                        PracticePlan practicePlan = new PracticePlan();
                                        practicePlan.Date = null;
                                        practicePlan.SpecialityDisciplineId = specialityDisciplineFromDB.Id;
                                        practicePlan.SpecialityDisciplineTopicId = specialityDisciplineTopicFromDB.Id;
                                        practicePlan.Volume = 0;
                                        foreach (SpecialityDisciplineTopicVolume specialityDisciplineTopicVolume in SpecialityDisciplineTopicPracticeVolumes)
                                        {
                                            if (specialityDisciplineTopicVolume.SpecialityDisciplineTopicId == specialityDisciplineTopicIdBeforeCommit)
                                            {
                                                practicePlan.Volume = specialityDisciplineTopicVolume.Volume;
                                                break;
                                            }
                                        }
                                        practicePlan.GroupId = null;
                                        PracticePlan practicePlanFromDB = repositoryManager.GetPracticePlanRepository.Add(practicePlan);
                                        if (null == practicePlanFromDB)
                                        {
                                            // FIXME: can't add new practice plan
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public class SpecialityDisciplineTopicStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public SpecialityDisciplineTopicStructure() { }

        public List<SpecialityDisciplineTopicStructureObj> FromFile(string filePath)
        {
            List<SpecialityDisciplineTopicStructureObj> specialityDisciplineTopicStructureList = null;
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);

            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);
                specialityDisciplineTopicStructureList = new List<SpecialityDisciplineTopicStructureObj>();
                SpecialityDisciplineTopicStructureObj specialityDisciplineTopicStructureObj = null;
                SpecialityDiscipline specialityDiscipline = null;
                List<SpecialityDisciplineTopic> specialityDisciplineTopics = null;
                List<SpecialityDisciplineTopicVolume> specialityDisciplineTopicLectureVolumes = null;
                List<SpecialityDisciplineTopicVolume> specialityDisciplineTopicPracticeVolumes = null;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 1000; // excelParser.GetMaxRowCount();
                long specialityDisciplineColumnIndex = -1;
                long lastSpecialityDisciplineId = 0;
                long specialityDisciplineTopicColumnIndex = -1;
                long lastSpecialityDisciplineTopicId = 0;
                long specialityDisciplineTopicLectureVolumeColumnIndex = -1;
                long specialityDisciplineTopicPracticeVolumeColumnIndex = -1;


                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    switch (currentReadedValue.Trim())
                    {
                        case "Дисциплина":
                            {
                                specialityDisciplineColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Тема":
                            {
                                specialityDisciplineTopicColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Количество часов лекций":
                            {
                                specialityDisciplineTopicLectureVolumeColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Количество часов практики":
                            {
                                specialityDisciplineTopicPracticeVolumeColumnIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                    }

                    if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (specialityDisciplineColumnIndex == columnIndex)
                        {
                            if (null != specialityDisciplineTopicStructureObj)
                            {
                                specialityDisciplineTopicStructureObj.SpecialityDiscipline = specialityDiscipline;
                                specialityDisciplineTopicStructureObj.SpecialityDisciplineTopics = specialityDisciplineTopics;
                                specialityDisciplineTopicStructureObj.SpecialityDisciplineTopicLectureVolumes = specialityDisciplineTopicLectureVolumes;
                                specialityDisciplineTopicStructureObj.SpecialityDisciplineTopicPracticeVolumes = specialityDisciplineTopicPracticeVolumes;

                                specialityDisciplineTopicStructureList.Add(specialityDisciplineTopicStructureObj);
                            }

                            specialityDisciplineTopicStructureObj = new SpecialityDisciplineTopicStructureObj();
                            specialityDisciplineTopics = new List<SpecialityDisciplineTopic>();
                            specialityDisciplineTopicLectureVolumes = new List<SpecialityDisciplineTopicVolume>();
                            specialityDisciplineTopicPracticeVolumes = new List<SpecialityDisciplineTopicVolume>();

                            specialityDiscipline = new SpecialityDiscipline();
                            specialityDiscipline.Id = ++lastSpecialityDisciplineId;
                            specialityDiscipline.Title = currentReadedValue;
                        }

                        if (specialityDisciplineTopicColumnIndex == columnIndex)
                        {
                            SpecialityDisciplineTopic specialityDisciplineTopic = new SpecialityDisciplineTopic();
                            specialityDisciplineTopic.Id = ++lastSpecialityDisciplineTopicId;
                            specialityDisciplineTopic.Title = currentReadedValue;
                            specialityDisciplineTopic.SpecialityDisciplineId = lastSpecialityDisciplineId;
                            specialityDisciplineTopics.Add(specialityDisciplineTopic);
                        }

                        if (specialityDisciplineTopicLectureVolumeColumnIndex == columnIndex)
                        {
                            SpecialityDisciplineTopicVolume specialityDisciplineTopicVolume = new SpecialityDisciplineTopicVolume();
                            specialityDisciplineTopicVolume.SpecialityDisciplineTopicId = lastSpecialityDisciplineTopicId;
                            try
                            {
                                specialityDisciplineTopicVolume.Volume = Convert.ToInt16(currentReadedValue);
                            }
                            catch (Exception ex)
                            {
                                specialityDisciplineTopicVolume.Volume = 0;
                                Utility.WriteToLog("SpecialityDisciplineTopicStructure.FromFile.ParseLectureVolume: can't convert lectureVolume to short", ex);
                            }
                            specialityDisciplineTopicLectureVolumes.Add(specialityDisciplineTopicVolume);
                        }

                        if (specialityDisciplineTopicPracticeVolumeColumnIndex == columnIndex)
                        {
                            SpecialityDisciplineTopicVolume specialityDisciplineTopicVolume = new SpecialityDisciplineTopicVolume();
                            specialityDisciplineTopicVolume.SpecialityDisciplineTopicId = lastSpecialityDisciplineTopicId;
                            try
                            {
                                specialityDisciplineTopicVolume.Volume = Convert.ToInt16(currentReadedValue);
                            }
                            catch (Exception ex)
                            {
                                specialityDisciplineTopicVolume.Volume = 0;
                                Utility.WriteToLog("SpecialityDisciplineTopicStructure.FromFile.ParseLectureVolume: can't convert lectureVolume to short", ex);
                            }
                            specialityDisciplineTopicPracticeVolumes.Add(specialityDisciplineTopicVolume);
                        }
                    }

                    if (columnIndex < maxColumnIndex)
                    {
                        columnIndex++;
                        continue;
                    }
                    else if (rowIndex < maxRowIndex)
                    {
                        columnIndex = 1;
                        rowIndex++;
                        continue;
                    }
                    else
                    {
                        if (null != specialityDisciplineTopicStructureObj)
                        {
                            specialityDisciplineTopicStructureObj.SpecialityDiscipline = specialityDiscipline;
                            specialityDisciplineTopicStructureObj.SpecialityDisciplineTopics = specialityDisciplineTopics;
                            specialityDisciplineTopicStructureObj.SpecialityDisciplineTopicLectureVolumes = specialityDisciplineTopicLectureVolumes;
                            specialityDisciplineTopicStructureObj.SpecialityDisciplineTopicPracticeVolumes = specialityDisciplineTopicPracticeVolumes;

                            specialityDisciplineTopicStructureList.Add(specialityDisciplineTopicStructureObj);
                        }
                        break;
                    }
                }
            }

            excelParser.Close();
            return specialityDisciplineTopicStructureList;
        }
    }
}
