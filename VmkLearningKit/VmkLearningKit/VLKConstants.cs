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
        public const string TITLE_IS_ABSENT             = "Краткое название отсутствует (документ старого образца)";
    }
}
