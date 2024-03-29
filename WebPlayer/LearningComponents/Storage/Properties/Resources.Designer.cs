﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.LearningComponents.Storage {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Microsoft.LearningComponents.Storage.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Attachment exceeds maximum size of {0} bytes..
        /// </summary>
        internal static string AttachmentTooLarge {
            get {
                return ResourceManager.GetString("AttachmentTooLarge", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The requested operation cannot be performed because the session has been abandoned..
        /// </summary>
        internal static string AttemptAbandoned {
            get {
                return ResourceManager.GetString("AttemptAbandoned", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The requested operation cannot be performed because the session has been completed..
        /// </summary>
        internal static string AttemptComplete {
            get {
                return ResourceManager.GetString("AttemptComplete", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The requested operation cannot be performed because the session is not complete..
        /// </summary>
        internal static string AttemptHasNotEnded {
            get {
                return ResourceManager.GetString("AttemptHasNotEnded", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This operation is only valid during auto-grading..
        /// </summary>
        internal static string AutoGradingModeNotBegun {
            get {
                return ResourceManager.GetString("AutoGradingModeNotBegun", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Global Objective database contains non-unique entries..
        /// </summary>
        internal static string GlobalObjectiveDatabaseStateNotValid {
            get {
                return ResourceManager.GetString("GlobalObjectiveDatabaseStateNotValid", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The requested activity cannot be found within the session..
        /// </summary>
        internal static string InvalidActivity {
            get {
                return ResourceManager.GetString("InvalidActivity", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The attempt could not be accessed. You may not have access to it, the attempt may have been deleted or does not exist..
        /// </summary>
        internal static string InvalidAttemptId {
            get {
                return ResourceManager.GetString("InvalidAttemptId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The LearnerId could not be accessed. Either it does not exist or you do not have permission to access it..
        /// </summary>
        internal static string InvalidLearnerId {
            get {
                return ResourceManager.GetString("InvalidLearnerId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The root activity id could not be accessed. Either it does not exist or you do not have permission to access it..
        /// </summary>
        internal static string InvalidRootActivityId {
            get {
                return ResourceManager.GetString("InvalidRootActivityId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to A current activity is required for this operation..
        /// </summary>
        internal static string NoCurrentActivity {
            get {
                return ResourceManager.GetString("NoCurrentActivity", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This operation cannot be performed in Execute view..
        /// </summary>
        internal static string NotAllowedInExecuteMode {
            get {
                return ResourceManager.GetString("NotAllowedInExecuteMode", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This operation cannot be performed in Review view..
        /// </summary>
        internal static string NotAllowedInReviewMode {
            get {
                return ResourceManager.GetString("NotAllowedInReviewMode", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This operation cannot be performed during the auto-grading process..
        /// </summary>
        internal static string NotAllowedWhileInAutoGradingMode {
            get {
                return ResourceManager.GetString("NotAllowedWhileInAutoGradingMode", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This operation cannot be performed on a session with an AttemptStatus of Active..
        /// </summary>
        internal static string SLS_SessionCannotBeActive {
            get {
                return ResourceManager.GetString("SLS_SessionCannotBeActive", resourceCulture);
            }
        }
    }
}
