////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// глюк при вставке вместо выделенного учаска текста и последующей вставки в "новый" код ////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function DisplayMath(element, math) {
    if (typeof (element) == 'string')
        element = document.getElementById(element);


    html = '\\[' + math + '  \\]';

    element.innerHTML = html;

   MathJax.Extension.tex2jax.PreProcess(element);
   //MathJax.Hub.Process(element);


}

// отрисовывает формулу под ответом после закрытия редактора
function DisplayAnsverFormula() {
    var form_input_name = $("#formula_editor").prev().attr('name');
    var eqnmathjs = document.getElementById('img_formula_' + form_input_name);
    var formula;
    if (window.ActiveXObject) { formula = document.getElementById('formula_' + form_input_name).innerHTML; }
    else { formula = document.getElementById('formula_' + form_input_name).textContent; }

    DisplayMath(eqnmathjs, formula);
	//MathJax.Hub.Typeset(eqnmathjs);
	MathJax.Hub.Process(eqnmathjs);
}




//////////////////////////////////////////////////////////////////////////////////////////////////

function GeneratePallete(obj) {
    // создание кнопок
    // парсим текст вопроса
    var form_input_name = $("#formula_editor").prev().attr('name');
    var note = $('[name=' + form_input_name + ']').parent().parent().prev().find(".QText").html();
   
    note = /Палитра для ответа: \[.*\]/.exec(note);
    if (note) {
        note = note[0].replace(/Палитра для ответа: \[/, "");
        note = note.replace(/\]/, "");
        note = note.replace(/^\s/, "");
        note = note.replace(/\s$/, "");
    
    
        var paletteMas = note.split(" ; ");
        //alert(paletteMas);
        // добавляем кнопки
        for (var key in paletteMas) {
            // Создание доп. полей
            var text = paletteMas[key];
            
            if (!($('.btn_pallete[name=' + text + ']')[0])) {
                var el = $('<button class="btn_pallete" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
                $(el).appendTo($('#formula_palette')[0]);
                $(el)[0].onclick = InsertTextFormul;
                //var el = $('.btn_pallete[name=' + text + ']')[0];
                DisplayMath($(el)[0], text);
                
            }
        }
        //MathJax.Hub.Process($("#formula_editor")[0]);
        }
    



    // отрисовка формул на кнопках
    $('.btn_pallete').each(function() {
        // вставка формулы в textarea
        this.onclick = InsertTextFormul;

        var formula = this.name;
        DisplayMath(this, formula);

    });
	MathJax.Hub.Process($("#formula_editor")[0]);
     
}


function GenerateFormulaEditor() {
    // непосредственно генерация html-кода редактора
    var el = ('<div id="formula_editor" style="" >');

    el += ('Палитра:<br>');
    el += ('<div id="formula_palette">');

    el += ('</div>');

    el += ('Формула в LaTeX:<br>');
    el += ('<div id="div_formula_edit" ><textarea name="formula_edit" id="formula_edit" rows="3" cols="60" onselect="StoreCaret(this)" onclick="StoreCaret(this)" onkeyup="StoreCaret(this)" ></textarea></div>');
    el += ('<br>');
    el += ('Предварительный просмотр:<br>');
    el += ('<div id="formula_display"></div>');

    el += ('<button id="editor_input" onclick=" InputAndHideFormulaEditor(this); return false ">Ввести</button>');
    el += ('<button id="editor_exit" onclick=" HideFormulaEditor(this); return false ">Закрыть</button>');
    el += ('</div>');
    $(el).appendTo($('form[name="frmPage"]')[0]);

    document.getElementById('formula_edit').onblur = RunEdit;
    document.getElementById('editor_input').onclick = InputAndHideFormulaEditor;
    document.getElementById('editor_exit').onclick = HideFormulaEditor;
};

function DisplayFormulaEditor(ev) {
    var obj = ev.target;
    // генерация кода редактора
    if ($("#formula_editor")[0]) {
        // сворачивание редактора в другом месте(если есть)
        $("#formula_editor").css({ display: "none" });
        QuickHideFormulaEditor();
    }
    else {
        GenerateFormulaEditor();
    }

    // Создание доп. полей			
    if (!document.getElementById('img_formula_' + $(obj).attr('name'))) {
        $('<p id="formula_' + $(obj).attr('name') + '" style="display:none;" ></p>').insertAfter(obj);
        $('<p class="math"  id="img_formula_' + $(obj).attr('name') + '"></p>').insertAfter(obj);
    }

    // Собственно редактор
    ClearFormEdit();
    $("#formula_editor").insertAfter(obj);
    $("#formula_editor").find("textarea[name=formula_edit]").text($(obj).attr('value'));
    $(obj).hide();
    $("#formula_editor").show("slow");
    

    // установка фокуса на поле ввода и смещение каретки в конец текста в IE
    var el = $("#formula_edit")[0];
    el.focus();
    if (document.selection && document.selection.createRange)
        el.caretPos = document.selection.createRange().duplicate().collapse(false);

    // Генерация палитры
    GeneratePallete(obj);


}

function ClearFormEdit() {
    // очистка полей редактора
    $("#formula_editor").find("textarea[name=formula_edit]").text("");
    $("#formula_editor").find("div#formula_display").text("");
    // очистка палитры
    $('#formula_palette')[0].innerHTML = "";
   // alert("qwerty");
}

// Закрывает редактор формул с сохранением результатов
function InputAndHideFormulaEditor(obj) {
    // заполнение поля ответа
    var form_input_name = $("#formula_editor").prev().attr('name');
    var tmp = $('textarea[name=formula_edit]').val();
    $('[id=formula_' + form_input_name + ']').text($('textarea[name=formula_edit]').val());
    $('[name=' + form_input_name + ']').val($('textarea[name=formula_edit]').val());
               
    // отрисовка формулы под ответом
    DisplayAnsverFormula();
   // $('#formula_palette')[0].innerHTML = "";
   // ClearFormEdit();
    // сворачивание редактора
    $("#formula_editor").prev().show("slow");
    $("#formula_editor").prev().animate({ height: "20px" }, 400);
    $("#formula_editor").hide("slow");
    //window.setTimeout('$("#formula_editor").insertAfter($(".content")[0])',400);
    return false;

}

function HideFormulaEditor() {
   // ClearFormEdit();
   // $("#formula_editor").prev().animate({ height: "20px" }, 400);
    $("#formula_editor").prev().show("slow");
    $("#formula_editor").hide("slow");
    return false;
}
function QuickHideFormulaEditor() {
   // ClearFormEdit();
    $("#formula_editor").css({ display: "none" });
    $("#formula_editor").prev().show("fast");
    $("#formula_editor").prev().css({ height: "20px" });
}

// Вставка текста из палитры 
function StoreCaret(element) {
    var el = $("#formula_edit")[0];
    if (document.selection && document.selection.createRange)
        el.caretPos = document.selection.createRange().duplicate();
}

function InsertTextFormul() {
    var text = this.name;
    var element = $("#formula_edit")[0];
    if (element && element.caretPos) {
        element.caretPos.text = text;
       // var element = $("#formula_edit")[0];
       // element.focus();
       // element.caretPos = document.selection.createRange().duplicate().collapse(false);
    }
    else if (element && element.selectionStart + 1 && element.selectionEnd + 1)
        element.value = element.value.substring(0, element.selectionStart) + text + element.value.substring(element.selectionEnd, element.value.length);
    else if (element)
        element.value += text;

    return false;
}


// отрисовка TeX'а в человеческом виде.
function RunEdit() { 
    var eqnmathjs = document.getElementById('formula_display');
    var formula;
    formula = document.getElementById('formula_edit').value;

    DisplayMath(eqnmathjs, formula);
	//MathJax.Hub.Typeset(eqnmathjs);
	MathJax.Hub.Process(eqnmathjs);
}


$(document).ready(function () {
    // блок исключительно для плеера:
    arr = $("table.QTable:contains('Палитра для ответа:')").get();
    for (var key in arr) {
        $(arr[key]).find("input").addClass("formula_input");
    }
    //////////////////

    $(".formula_input").bind("click", DisplayFormulaEditor);
});
