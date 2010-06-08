
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
    var note = $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html();
   
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
        //$(this).bind("click", InsertTextFormul);

        var formula = this.name;
        DisplayMath(this, formula);

    });
	//MathJax.Hub.Typeset($("#formula_editor")[0]);
	MathJax.Hub.Process($("#formula_editor")[0]);
    //// попробовать доработать!!!! ///////
    //	var i = $('.btn_pallete').length;
    //	var qqq=$('.btn_pallete');
    //	for( var j=0; j<i; j++)
    //	{
    //		//eee = $('.btn_pallete')[j];
    //		//window.setTimeout("RunTMP(qqq[j]);",0);
    //		var r= qqq[j];
    //		RunTMP(qqq[j
    //	}


    //	var element=document.getElementById('1');
    //element.innerHTML=element.name;
    //MathJax.Extension.tex2jax.PreProcess(element);
    //	element.innerHTML = '<span class="MathJax_Preview"> \int_34^4 </span>'
    //	MathJax.Hub.Process(element);

    //RunTMP()
}

function GenerateBigPalette(obj) {
    // создание кнопок


    // отрисовка формул на кнопках
    $('.btn_big_palette').each(function() {
        // вставка формулы в textarea
        this.onclick = AddToPalette;
        var formula = this.name;
        DisplayMath(this, formula);

    });

}


// добавление функций в палитру студента
function AddToPalette(){
    var text = this.name;
    // Создание доп. полей
    if (!($('.btn_pallete[name=' + text + ']')[0])) {
        var el = $('<button class="btn_pallete" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
        $(el).appendTo($('#formula_palette')[0]);
        $(el)[0].onclick = InsertTextFormul;
        //var el = $('.btn_pallete[name=' + text + ']')[0];
        DisplayMath($(el)[0], text);
        MathJax.Hub.Process($("#formula_editor")[0]);
    }
    return false
}

// добавление Произвольной функции в палитру студента
function AddNewToPalette(obj) {
    var text = obj.value;
    if (!($('.btn_pallete[name=' + text + ']')[0])) {
        var el = $('<button class="btn_pallete" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
        $(el).appendTo($('#formula_palette')[0]);
        $(el)[0].onclick = InsertTextFormul;
        //var el = $('.btn_pallete[name=' + text + ']')[0];
        DisplayMath($(el)[0], text);
        MathJax.Hub.Process($("#formula_editor")[0]);
    }
    return false
}

// Очистка палитры студента
function ClearStudentPalette() {
    $('#formula_palette')[0].innerHTML="";
}

function DisplayFormulaEditor(ev) {
    var obj = ev.target;
    // сворачивание редактора в другом месте(если есть)
    $("#formula_editor").css({ display: "none" });
    QuickHideFormulaEditor();


    // Создание доп. полей			
    if (!document.getElementById('img_formula_' + $(obj).attr('name'))) {
        $('<p id="formula_' + $(obj).attr('name') + '" style="display:none;" ></p>').insertAfter(obj);
        $('<p class="math"  id="img_formula_' + $(obj).attr('name') + '"></p>').insertAfter(obj);
    }

    // Собственно редктор
    $("#formula_editor").insertAfter(obj);
    $("#formula_editor").find("textarea[name=formula_edit]").text($(obj).attr('value'));
    $(obj).animate({ height: "0px" }, 400);
    $("#formula_editor").show("slow");


    // Генерация палитры
    GenerateBigPalette(obj);
    GeneratePallete(obj);


}


// Закрывает редактор формул с сохранением результатов
function InputAndHideFormulaEditor(obj) {
    // заполнение поля ответа
    var form_input_name = $("#formula_editor").prev().attr('name');
    var tmp = $('textarea[name=formula_edit]').val();
    $('[id=formula_' + form_input_name + ']').text($('textarea[name=formula_edit]').val());
    $('[name=' + form_input_name + ']').val($('textarea[name=formula_edit]').val());

    // Удаление старой палитры
    var note = $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html();
    if (note != 0) {
        note = note.replace(/Палитра для ответа: \[.*\]/, "");
        note = note.replace(/\&lt;/g, "<");
        note = note.replace(/\&gt;/g, ">");
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html("");
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html(note);
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea textarea").html("");
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea textarea").val(note);
    } 
    
    //Добавление палитры в текст вопроса
    var paletteCode;
    var paletteMas;
    paletteMas = $('#formula_palette').find('button').map(function() { return $(this).attr("name") }).get();
    if (paletteMas.length != 0) {
        paletteCode = 'Палитра для ответа: [';
        for (var key in paletteMas) {
            paletteCode = paletteCode + paletteMas[key] + ' ; ';
        }
        paletteCode = paletteCode.substring(0, paletteCode.length - 3);
        paletteCode = paletteCode + ']';
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').append("<br\>" + paletteCode);
        $('[name=' + form_input_name + ']').parent().parent().parent().find(".jHtmlArea textarea").val(note + "<br\>" + paletteCode);
    }   
    
    // отрисовка формулы под ответом
    DisplayAnsverFormula();
    
    // очистка полей редактора
    $("#formula_editor").find("textarea[name=formula_edit]").text("");
    $("#formula_editor").find("div#formula_display").text("");
    // сворачивание редактора
    $("#formula_editor").prev().animate({ height: "20px" }, 400);
    $("#formula_editor").hide("slow");
    //window.setTimeout('$("#formula_editor").insertAfter($(".content")[0])',400);
    return false;

}

function HideFormulaEditor() {
    $("#formula_editor").find("textarea[name=formula_edit]").text("");
    $("#formula_editor").find("div#formula_display").text("");
    $("#formula_editor").prev().animate({ height: "20px" }, 400);
    $("#formula_editor").hide("slow");

   // window.setTimeout('$("#formula_editor").insertAfter($(".content")[0])', 400);
    return false;
}
function QuickHideFormulaEditor() {
    $("#formula_editor").find("textarea[name=formula_edit]").text("");
    $("#formula_editor").find("div#formula_display").text("");
    $("#formula_editor").css({ display: "none" });
    $("#formula_editor").prev().css({ height: "20px" });

    //$("#formula_editor").insertAfter($(".content")[0]);
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
    if (element && element.caretPos)
        element.caretPos.text = text;
    else if (element && element.selectionStart + 1 && element.selectionEnd + 1)
        element.value = element.value.substring(0, element.selectionStart) + text + element.value.substring(element.selectionEnd, element.value.length);
    else if (element)
        element.value += text;

    return false;
}


$(document).ready(function() {
    $(".formula_input").bind("click", DisplayFormulaEditor);
    document.getElementById('formula_edit').onblur = RunEdit;
    document.getElementById('editor_input').onclick = InputAndHideFormulaEditor;
    document.getElementById('editor_exit').onclick = HideFormulaEditor;
    //GeneratePallete(this);
});

function RunEdit() {
    var eqnmathjs = document.getElementById('formula_display');
    var formula;
    formula = document.getElementById('formula_edit').value;

    DisplayMath(eqnmathjs, formula);
	//MathJax.Hub.Typeset(eqnmathjs);
	MathJax.Hub.Process(eqnmathjs);
}