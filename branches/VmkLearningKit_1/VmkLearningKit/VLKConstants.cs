using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit
{
    public static class VLKConstants
    {
        public const byte   QUESTION_NOT_DELETED        = 0;
        public const byte   QUESTION_DELETED            = 1;
        public const byte   QUESTION_CAN_NOT_COMMENTED  = 0;
        public const byte   QUESTION_CAN_COMMENTED      = 1;
        public const int    QUESTION_TYPE_SIMPLE        = 0;
        public const int    QUESTION_TYPE_ALTERNATIVE   = 1;
        public const int    QUESTION_TYPE_DISTRIBUTIVE  = 2;
        public const int    QUESTION_TYPE_FORMULA       = 3;
        public const string DIV_ANSWERS_BLOCK_ID        = "AnswersBlock";
        public const string DIV_QUESTIONS_BLOCK_ID      = "QuestionsBlock";
        public const string VARIANT_ANSWER_TEXT         = "VariantAnswerText";
        public const string VARIANT_ANSWER_SCORE        = "VariantAnswerScore";
        public const string NEW_VARIANT_ANSWER_TEXT     = "NewVariantAnswerText";
        public const string NEW_VARIANT_ANSWER_SCORE    = "NewVariantAnswerScore";
        public const int    MINIMNUM_ANSWERS_NUMBER     = 2;
        public const int    FAKE_VALUE                  = -1;
        public const string TITLE_DEFAULT               = "Вопрос из Word-документа";
        public const string QUESTION_GROUP_DOUBLE       = "Double";
        public const string QUESTION_GROUP_EXCLUSION    = "Exclusion";
        public const string FIELD_EMPTY                 = "Отсутствует";

        // состояние тестового варианта, когда он только был назначен и еще не выполнялся
        public const int    TEST_VARIANT_STATE_NEW          = 1;
        // состояние тестового варианта, когда он находится в процессе выполнения
        public const int    TEST_VARIANT_STATE_IN_PROGRESS  = 2;
        // состояние тестового варианта, когда он был выполнен студентом
        public const int    TEST_VARIANT_STATE_DONE         = 3;
        // состояние тестового варианта, когда он был проверен преподавателем
        public const int    TEST_VARIANT_STATE_CHECKED      = 4;
        // как долго отображать выполненные тесты студентом (втечение 14 дней по-умолчанию)
        public const int    HOW_LONG_SHOW_DONE_TEST     = 14;
        // как долго отображать проверенные тесты студента (втечение 14 дней по-умолчанию)
        public const int    HOW_LONG_SHOW_CHECKED_TEST  = 14;

        // указание в расписании по каким неделям идут занятия
        public const string UP_WEEK                     = "Верхняя";
        public const string DOWN_WEEK                   = "Нижняя";
        public const string EVERY_WEEK                  = "Каждая";
        // идентификатор пакета по-умолчанию для таблицы AssignedTestVariants
        // данный идентификатор обновляется плеером после добавления теста в его БД
        public const int    PACKAGE_DEFAULT_ID          = 0;

        public const long   VMK_DEPARTMENT_ID           = 1;

        public const string XML_UPLOAD_ALIAS_CHAIRS         = "Chairs";
        public const string XML_UPLOAD_ALIAS_TEACHERS       = "Teachers";
        public const string XML_UPLOAD_ALIAS_SPECIALITIES   = "Specialities";
        public const string XML_UPLOAD_ALIAS_GROUPS         = "Groups";
        public const string XML_UPLOAD_ALIAS_STUDENTS       = "Students";

        public const int PASSWORD_DEFAULT_LENGTH        = 7;
    }
}
