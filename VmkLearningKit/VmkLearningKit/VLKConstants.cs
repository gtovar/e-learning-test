using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit
{
    public static class VLKConstants
    {
        public const byte QUESTION_NOT_DELETED       = 0;
        public const byte QUESTION_DELETED           = 1;
        public const byte QUESTION_CAN_NOT_COMMENTED = 0;
        public const byte QUESTION_CAN_COMMENTED     = 1;
        public const int QUESTION_TYPE_SIMPLE        = 0;
        public const int QUESTION_TYPE_ALTERNATIVE   = 1;
        public const int QUESTION_TYPE_DISTRIBUTIVE  = 2;
        public const int QUESTION_TYPE_FORMULA       = 3;
    }
}
