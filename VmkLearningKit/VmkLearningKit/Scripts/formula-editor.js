
$(document).ready(function () {
    var fmlEditor = new FmlEditor($(".formula_input"), "formula_editor");  // do not use 'var' or fix it
    fmlEditor.Init();
    
});

function FmlEditor(formulaInput, editorId) {
    this.formulaInput = formulaInput;
    this.editorId = '#' + editorId;

    this.fullPalleteformuls = { "pallete": [
            { "groupName": "\\le \\ne \\approx", "groupTitle": "Символы отношений", "groupItems": [">", "<", "=", "\\ge", "\\le", "\\ne", "\\sim", "\\simeq", "\\approx", "\\equiv", "\\ll", "\\gg"] },
            { "groupName": "\\to \\leftrightarrow \\downarrow", "groupTitle": "Стрелки", "groupItems": ["\\to", "\\gets", "\\leftrightarrow", "\\uparrow", "\\downarrow", "\\updownarrow", "\\Leftarrow", "\\Rightarrow", "\\Leftrightarrow", "\\Uparrow", "\\Downarrow", "\\Updownarrow"] },
            { "groupName": "\\notin \\cap \\subset", "groupTitle": "Символы теории множеств", "groupItems": ["\\notin", "\\in", "\\cap", "\\cup", "\\subset", "\\supset", "\\subseteq", "\\supseteq", "\\not\\supset", "\\not\\subset", "\\not\\supseteq", "\\not\\subseteq"] },
            { "groupName": "\\lambda \\omega \\theta", "groupTitle": "Греческие буквы(строчные)", "groupItems": ["\\alpha", "\\beta", "\\gamma", "\\delta", "\\varepsilon", "\\theta", "\\lambda", "\\mu", "\\phi", "\\varphi", "\\psi", "\\omega"] },
            { "groupName": "\\Lambda \\Omega \\Theta", "groupTitle": "Греческие буквы(прописные)", "groupItems": ["\\Gamma", "\\Delta", "\\Theta", "\\Lambda", "\\Xi", "\\Pi", "\\Sigma", "\\Upsilon", "\\Phi", "\\Psi", "\\Omega","E"] },
            { "groupName": " \\{\\} \\langle\\rangle", "groupTitle": "Скобки", "groupItems": ["(", ")", "[", "]", "\\{", "\\}", "\\lceil", "\\rceil", "\\lfloor", "\\rfloor", "\\langle", "\\rangle"] },
            { "groupName": " \\sum_{*}^{*}", "groupTitle": "Суммы, произведения, ...", "groupItems": ["\\sum_{*}^{*}", "\\prod_{*}^{*}", "\\oint_{a}^{b}", "\\int_{*}^{*}", "\\iint_{*}", "\\iiint_{*}", "\\bigcap_{*}^{*}", "\\bigcup_{*}^{*}", "\\coprod_{*}^{*}", "\\bigodot_{*}^{*}", "\\bigvee_{*}^{*}", "\\bigwedge_{*}^{*}"] },
            { "groupName": " \\sin_{*}^{*}{*} \\renewcommand{\\cot}{ctg} \\renewcommand{\\tan}{tg} ", "groupTitle": "Тригонометрия", "groupItems": ["\\sin_{*}^{*}{*}", "\\cos_{*}^{*}{*}", "\\tan", "\\cot", "\\sec", "\\csc", "\\arcsin", "\\arccos", "\\arctan"] },
            { "groupName": " \\infty", "groupTitle": "Разное", "groupItems": ["\\log_{*}^{*}{*}", "\\lim_{{*}\\to{*}}{*}^{*}", "\\sqrt{*}", "\\varepsilon", "\\exists{*}", "\\forall{*}", "{*}^{*}", "\\frac{*}{*}", "\\infty", "\\times", "\\oplus", "\\circ"] }
        ]
    };
     
    var self = this;

    this.Init = function() {
        self.formulaInput.bind("click", DisplayFormulaEditor);
        if ($(self.editorId)[0]) {
            
            $(self.editorId + ' #formula_edit').blur(function () { RunEdit(); return false; });
            $(self.editorId + ' #editor_input').click(function () { InputAndHideFormulaEditor(); return false; });
            $(self.editorId + ' #editor_exit').click(function () { HideFormulaEditor(); return false; });
        }
    };




    function DisplayMath(element, math) {
        if (typeof(element) == 'string')
            element = document.getElementById(element);


        var html = '\\[' + math + '  \\]';

        element.innerHTML = html;

        window.MathJax.Extension.tex2jax.PreProcess(element);
        //MathJax.Hub.Process(element);


    }

    // отрисовывает формулу под ответом после закрытия редактора
    function DisplayAnsverFormula() {
        var formInputName = $(self.editorId).prev().attr('name');
        var eqnmathjs = document.getElementById('img_formula_' + formInputName);
        var formula;
        if (window.ActiveXObject) { formula = document.getElementById('formula_' + formInputName).innerHTML; }
        else { formula = document.getElementById('formula_' + formInputName).textContent; }

        DisplayMath(eqnmathjs, formula);
        //MathJax.Hub.Typeset(eqnmathjs);
        window.MathJax.Hub.Process(eqnmathjs);
    }




    //////////////////////////////////////////////////////////////////////////////////////////////////

    function GeneratePallete(obj) {
        // создание кнопок
        // парсим текст вопроса
        var formInputName = $(self.editorId).prev().attr('name');
        var note = $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html();

        note = /Палитра для ответа: \[.*\]/ .exec(note);
        if (note) {
            note = note[0].replace( /Палитра для ответа: \[/ , "");
            note = note.replace( /\]/ , "");
            note = note.replace( /^\s/ , "");
            note = note.replace( /\s$/ , "");


            var paletteMas = note.split(" ; ");
            //alert(paletteMas);
            // добавляем кнопки
            for (var key in paletteMas) {
                // Создание доп. полей
                var text = paletteMas[key];

                if (!($('#formula_palette .btn_pallete[name=' + text + ']')[0])) {
                    var el = $('<button class="btn_pallete fmlMath" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
                    $(el).appendTo($('#formula_palette')[0]);
                    $(el)[0].onclick = InsertTextFormul;
                    //var el = $('.btn_pallete[name=' + text + ']')[0];
                    DisplayMath($(el)[0], text);

                }
            }
        }




        // отрисовка формул на кнопках
        $('.btn_pallete.fmlMath').each(function () {
            // вставка формулы в textarea
            this.onclick = InsertTextFormul;

            var formula = this.name;
            DisplayMath(this, formula);

        });
        window.MathJax.Hub.Process($(self.editorId)[0]);
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
        $('.fmlEditorMenuTitle.fmlMath').each(function () {
            var formula = $(this).attr("name");
            DisplayMath(this, formula);
        });
        
        $('.btn_big_palette.fmlMath').each(function () {
            // вставка формулы в textarea
            this.onclick = function () {
                if ($(this).parent().hasClass("expanded"))
                 AddToPalette(this);
            };

        });


        /* для fmlEditorMenu*/

        (function () {

            // Добавялем кнопку закрытия каждому блоку
            $('.fmlEditorMenu .fmlEditorMenuContent').append('<span class="close">x</span>');
            // Выводим окно
            function showContent(elem) {
                hideContent();
                elem.find('.fmlEditorMenuContent').addClass('expanded');
                elem.addClass('cover');
            }
            // Сбрасываем все
            function hideContent() {
                $('.fmlEditorMenu .fmlEditorMenuContent').removeClass('expanded');
                $('.fmlEditorMenu li').removeClass('cover');
            }

            // Когда элемент li нажат, выводим окно с его содержанием и позиционируем поверх всего
            $('.fmlEditorMenu li').click(function () {
                var menuItem = this;
                if ($(this).find(".fmlEditorMenuContent").hasClass("expanded"))
                    {return false;}
                $(menuItem).find('.btn_big_palette.fmlMath').each(function () {
                    var btnFormula = $(this).attr("name");
                    DisplayMath(this, btnFormula);
                    window.MathJax.Hub.Process($(menuItem)[0]);
                    //$(this).removeClass("fmlMath");
                });
                showContent($(this));
                return false;
            });
            // Содержание будет также выводиться с помощью нажатия клавиши ENTER
            $('.fmlEditorMenu li').keypress(function (e) {
                if (e.keyCode == 13) {
                    showContent($(this));
                    return false;
                }
            });

            // Когда нажат верхний правый элемент, сбрасываем все
            $('.fmlEditorMenu .close').click(function (e) {
                e.stopPropagation();
                hideContent();
            });
            // Также сброс происходит по нахатию клавиши ESC
            $(document).keyup(function (e) {
                if (e.keyCode == 27) {
                    hideContent();
                }
            });

        })();
    }


    // добавление функций в палитру студента
    function AddToPalette(obj) {
        var element;
        if (obj)
            { element = obj; }
        else 
            { element = this; }
        var text = element.name;
        // Создание доп. полей
        if (!($('#formula_palette .btn_pallete.fmlMath[name$="'+text+'"]')[0])) {
            var el = $('<button class="btn_pallete fmlMath" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
            $(el).appendTo($('#formula_palette')[0]);
            $(el)[0].onclick = InsertTextFormul;
            //var el = $('.btn_pallete[name=' + text + ']')[0];
            DisplayMath($(el)[0], text);
            window.MathJax.Hub.Process($(self.editorId)[0]);
        }
        return false;
    }

    // добавление Произвольной функции в палитру студента
    this.AddNewToPalette = function(obj) {
        var text = obj.value;
        if (!($('.btn_pallete[name=' + text + ']')[0]) && $.trim(text) != "") {
            var el = $('<button class="btn_pallete fmlMath" name="' + text + '" onclick="InsertTextFormul(); return false">  </button>');
            $(el).appendTo($('#formula_palette')[0]);
            $(el)[0].onclick = InsertTextFormul;
            
            DisplayMath($(el)[0], text);
            window.MathJax.Hub.Process($(self.editorId)[0]);
        }
        return false;
    };

    // Очистка палитры студента
    this.ClearStudentPalette = function() {
        $(self.editorId + ' #formula_palette')[0].innerHTML = "";
    };

    function DisplayFormulaEditor(ev) {
        var obj = ev.target;
        // генерация кода редактора
        var el;
        if ($(self.editorId)[0]) {
            // сворачивание редактора в другом месте(если есть)
            $(self.editorId).css({ display: "none" });
            QuickHideFormulaEditor();
        }
        else {
            // непосредственно генерация html-кода редактора
            el = ('<div id="' + self.editorId.replace('#', '') + '" class="formula_editor" style="" >');
            el += ('<div id="formula_teacher_palette" style="" > <div class="fullPaletteButtonsContainer">');
            el += ('Полная палитра:<br>');
            el += ('<ul class="fmlEditorMenu">');
            $.each(self.fullPalleteformuls["pallete"], function (index, value) {
                //el += ('<button class="btn_big_palette" name="' + value + '"></button>'); 
                el += ('<li tabindex="' + index + '">');
                el += ('<span class="fmlEditorMenuTitle fmlMath" name="' +  value["groupName"] + '"></span>');
                el += ('<div class="fmlEditorMenuContent">');
                    $.each(value["groupItems"], function (btnIndex, btnValue) { 
                        /*el += ('qwer');*/
                        el += ('<button class="btn_big_palette fmlMath" name="' + btnValue + '"></button>');
                    });
                    el += ('</div>');
                el += ('</li>');
            });
            el += ('</ul>');
            el += ('</div><br /> <div class ="addNewFormulaContainer">');
            el += ('<span>Произвольный символ/формула в TeX:</span><br />');
            el += ('<input id="newPaletteFormula"/>');
            el += ('<input type="image" class="addNewSymbolToPalette"  src="/Content/Images/add.png" width="24px"/>');
            el += ('<br />');
            el += ('<div id="new_pallete_formula_display"></div></div>');
            el += ('<button class="fe_button fe_clearStudentPalette"> Очистить палитру студента </button>');
            el += ('</div>');
            el += ('Палитра:<br>');
            el += ('<div id="formula_palette">');

            el += ('</div>');

            el += ('<br/>Формула в LaTeX:<br>');
            el += ('<div id="div_formula_edit" ><textarea name="formula_edit" id="formula_edit" rows="3" cols="60"></textarea></div>');
            el += ('<br>');
            el += ('Предварительный просмотр:<br>');
            el += ('<div id="formula_display"></div>');

            el += ('<button class="fe_button" o id="editor_input">Ввести</button>');
            el += ('<button class="fe_button" o id="editor_exit">Закрыть</button>');
            el += ('</div>');
            $(el).appendTo($('.content')[0]);

            $(self.editorId + ' #newPaletteFormula').change(function () { PreviewNewPaletteFormula(); return false; });
            $(self.editorId + ' #newPaletteFormula').keypress(function (event) {
                if (event.keyCode == '13') {
                    $(self.editorId + ' .addNewSymbolToPalette').click();
                    event.preventDefault();
                }
            });

            $(self.editorId + ' .addNewSymbolToPalette').click(function () { self.AddNewToPalette($('#newPaletteFormula')[0]); return false; });
            $(self.editorId + ' .fe_clearStudentPalette').click(function () { self.ClearStudentPalette(); return false; });
            $(self.editorId + ' #formula_edit').select(function () { StoreCaret(); return false; });
            $(self.editorId + ' #formula_edit').click(function () { StoreCaret(); return false; });
            $(self.editorId + ' #formula_edit').keyup(function () { StoreCaret(); return false; });
           
            $(self.editorId + ' #formula_edit').blur(function () { RunEdit(); return false; });
            $(self.editorId + ' #editor_input').click(function () { InputAndHideFormulaEditor(); return false; });
            $(self.editorId + ' #editor_exit').click(function () { HideFormulaEditor(); return false; });
        }

        // Создание доп. полей			
        if (!document.getElementById('img_formula_' + $(obj).attr('name'))) {
            $('<p id="formula_' + $(obj).attr('name') + '" style="display:none;" ></p>').insertAfter(obj);
            $('<p class="math"  id="img_formula_' + $(obj).attr('name') + '"></p>').insertAfter(obj);
        }

        // Собственно редактор
        ClearFormEdit();
        $(self.editorId).insertAfter(obj);
        $(self.editorId).find("textarea[name=formula_edit]").text($(obj).attr('value'));
        $(obj).hide();
        $(self.editorId).show("slow");


        // установка фокуса на поле ввода и смещение каретки в конец текста
        el = $("#formula_edit")[0];
        el.focus();
        if (document.selection && document.selection.createRange)
            el.caretPos = document.selection.createRange().collapse(false);

        // Генерация палитры
        GenerateBigPalette(obj);
        GeneratePallete(obj);

        

    }

    function ClearFormEdit() {
        // очистка полей редактора
        $(self.editorId).find("textarea[name=formula_edit]").text("");
        $(self.editorId).find("div#formula_display").text("");
        self.ClearStudentPalette();
    }

    // Закрывает редактор формул с сохранением результатов
    function InputAndHideFormulaEditor() {
        // заполнение поля ответа
        var formInputName = $(self.editorId).prev().attr('name');
        var tmp = $('textarea[name=formula_edit]').val();
        $('[id=formula_' + formInputName + ']').text($('textarea[name=formula_edit]').val());
        $('[name=' + formInputName + ']').val($('textarea[name=formula_edit]').val());

        // Удаление старой палитры
        var note = $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html();
        if (note != 0) {
            note = note.replace( /Палитра для ответа: \[.*\]/ , "");
            note = note.replace( /\&lt;/g , "<");
            note = note.replace( /\&gt;/g , ">");
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html("");
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').html(note);
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea textarea").html("");
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea textarea").val(note);
        }

        //Добавление палитры в текст вопроса
        var paletteCode;
        var paletteMas;
        paletteMas = $('#formula_palette').find('button').map(function() { return $(this).attr("name"); }).get();
        if (paletteMas.length != 0) {
            paletteCode = 'Палитра для ответа: [';
            for (var key in paletteMas) {
                paletteCode = paletteCode + paletteMas[key] + ' ; ';
            }
            paletteCode = paletteCode.substring(0, paletteCode.length - 3);
            paletteCode = paletteCode + ']';
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea iframe").contents().find('body').append("<br\>" + paletteCode);
            $('[name=' + formInputName + ']').parent().parent().parent().find(".jHtmlArea textarea").val(note + "<br\>" + paletteCode);
        }

        // отрисовка формулы под ответом
        DisplayAnsverFormula();

        ClearFormEdit();
        // сворачивание редактора
        $(self.editorId).prev().animate({ height: "20px" }, 400);
        $(self.editorId).hide("slow");
        //window.setTimeout('$(self.editorId).insertAfter($(".content")[0])',400);
        return false;
    }

    function HideFormulaEditor() {
        ClearFormEdit();
        $(self.editorId).prev().animate({ height: "20px" }, 400);
        $(self.editorId).hide("slow");
        self.ClearStudentPalette();
        // window.setTimeout('$(self.editorId).insertAfter($(".content")[0])', 400);
        return false;
    }
    function QuickHideFormulaEditor() {
        ClearFormEdit();
        $(self.editorId).css({ display: "none" });
        $(self.editorId).prev().css({ height: "20px" });
        self.ClearStudentPalette();
        //$("#formula_editor").insertAfter($(".content")[0]);
    }

    // Вставка текста из палитры
    function StoreCaret() {
        var el = $("#formula_edit")[0];
        if (document.selection && document.selection.createRange)
            el.caretPos = document.selection.createRange().duplicate();
    };

    function InsertTextFormul() {
        var text = this.name;
        var element = $("#formula_edit")[0];
        if (element && element.caretPos)
            element.caretPos.text = text;
        else if (element && element.selectionStart + 1 && element.selectionEnd + 1)
            element.value = element.value.substring(0, element.selectionStart) + text + element.value.substring(element.selectionEnd, element.value.length);
        else if (element)
            element.value += text;

        RunEdit();
        
        return false;
    }

    function PreviewNewPaletteFormula() {
        var eqnmathjs = document.getElementById('new_pallete_formula_display');
        var formula;
        formula = document.getElementById('newPaletteFormula').value;

        DisplayMath(eqnmathjs, formula);
        //MathJax.Hub.Typeset(eqnmathjs);
        window.MathJax.Hub.Process(eqnmathjs);
    }

    function RunEdit() {
        var eqnmathjs = document.getElementById('formula_display');
        var formula;
        formula = document.getElementById('formula_edit').value;

        DisplayMath(eqnmathjs, formula);
        //MathJax.Hub.Typeset(eqnmathjs);
        window.MathJax.Hub.Process(eqnmathjs);
    }


    
    
}