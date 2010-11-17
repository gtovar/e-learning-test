
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

var indexForNewAnswerField = 0;

function InsertAnswerField(withDeleteButton, divBlockId, nameText, nameScore) {

    var newAnswerField  = document.createElement('div');

    var insertNameText  = nameText  + indexForNewAnswerField;
    var insertNameScore = nameScore + indexForNewAnswerField;

    var newText = '<p><textarea id="' + insertNameText + '" name="' + insertNameText + '" />\n';

    var newScore = '<label for="' + insertNameScore + '">Количество баллов: </label>' +
                   '<input id="' + insertNameScore + '" name="' + insertNameScore + '" type="text" /></p>\n';
    
    var newRemoveButton = '<p><input type="button" value="Удалить вариант ответа" onclick="DeleteAnswerField(\'' + divBlockId + '\', this.parentNode.parentNode)" /></p>\n';

    if (withDeleteButton == 0) {
        newAnswerField.innerHTML = newText + newScore;
    }
    else {
        newAnswerField.innerHTML = newText + newScore + newRemoveButton;
    }

    document.getElementById(divBlockId).appendChild(newAnswerField);

    ++indexForNewAnswerField;
}

function DeleteAnswerField(divBlockId, obj) {
    document.getElementById(divBlockId).removeChild(obj);
}

