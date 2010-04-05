
function ConfirmDialog(message, url) {
    if (confirm(message)) {
        document.location = url;
    }
}

function ReloadPage(dropDownListId, url) {
    var dropDownList = document.getElementById(dropDownListId);
    var alias = dropDownList.options[dropDownList.selectedIndex].value
}

function SubmitPage(formId) {
    document.forms[0].submit();
}