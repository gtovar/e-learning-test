		 
		 function DisplayMath(element,math) {
			if (typeof(element) == 'string')
			var element = document.getElementById(element);

			//var html = '<SCRI';
			//html += 'PT TYPE="math/tex; mode=display">';
			//html += math;
			//html += '</SCR';
			//html +='IPT>';
			
			html = '\\[' +math+'  \\]';

			element.innerHTML=html;

			MathJax.Extension.tex2jax.PreProcess(element);
			MathJax.Hub.Process(element);

			}
		function Run(){
				var form_input_name = $("#formula_editor").prev().attr('name');
				var eqnmathjs=document.getElementById('img_formula_'+form_input_name);
				var formula;
				//formula = document.getElementById('formula').text;
				if(window.ActiveXObject) { formula = document.getElementById('formula_'+form_input_name).innerHTML; }
					else { formula = document.getElementById('formula_'+form_input_name).textContent; }
	
				DisplayMath(eqnmathjs, formula);
		}
		function RunTMP(obj){
				
			var formula = obj.name;
				
				html = '\\[' +formula+'  \\]';

				obj.innerHTML=html;

				MathJax.Extension.tex2jax.PreProcess(obj);
				MathJax.Hub.Process(obj);
		}
		
		function RunEdit(){
				var eqnmathjs=document.getElementById('formula_display');
				var formula;
				formula = document.getElementById('formula_edit').value;

				DisplayMath(eqnmathjs, formula);
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////
		
		function generate_pallete(obj){
			// создание кнопок
			
			
		
		
			// отрисовка формул на кнопках
			$('.btn_pallete').each( function(){
				// вставка формулы в textarea
				this.onclick = insertTextFormul;
				//$(this).bind("click", insertTextFormul);
				
				var formula = this.name;
				DisplayMath(this, formula);
				//this.innerHTML=formula;
				
			//	html = '\\[' +formula+'  \\]';

			//	this.innerHTML=html;

			//	MathJax.Extension.tex2jax.PreProcess(this);
			//	MathJax.Hub.Process(this);
			});
			
			//// попробовать доработать!!!! ///////
		//	var i = $('.btn_pallete').length;
		//	var qqq=$('.btn_pallete');
		//	for( var j=0; j<i; j++)
		//	{
		//		//eee = $('.btn_pallete')[j];
		//		//window.setTimeout("RunTMP(qqq[j]);",0);
		///		var r= qqq[j];
		//		RunTMP(qqq[j
		//	}
			
			
		//	var element=document.getElementById('1');
			//element.innerHTML=element.name;
			//MathJax.Extension.tex2jax.PreProcess(element);
		//	element.innerHTML = '<span class="MathJax_Preview"> \int_34^4 </span>'
		//	MathJax.Hub.Process(element);

			//RunTMP()
		}
		
		function display_formula_editor(ev){
			var obj = ev.target;
			// сворачивание редактора в другом месте(если есть)
			$("#formula_editor").css( { display:"none"} );
			quick_hide_formula_editor();
			
			
			// Создание доп. полей			
			if(!document.getElementById('img_formula_'+$(obj).attr('name')) ){
				$('<p id="formula_'+$(obj).attr('name')+'" style="display:none;" ></p>').insertAfter(obj);
				$('<p class="math"  id="img_formula_'+$(obj).attr('name')+'"></p>').insertAfter(obj);
			}
			
			// Собственно редктор
			$("#formula_editor").insertAfter(obj);
			$("#formula_editor").find("textarea[name=formula_edit]").text($(obj).attr('value'));
			//$("#formula_editor").css({display:""});
			$(obj).animate( { height:"0px"}, 400 );
			$("#formula_editor").show("slow");
			//$("#formula_editor").animate( { height:"270px"}, 400 );  // устанавливаем высоту редактора
			//window.setTimeout('$("#formula_editor").css({height:"auto"})',425);
			
			// Генерация палитры 
			generate_pallete(obj);
			

		}
		
		function input_and_hide_formula_editor(obj){
			var form_input_name = $("#formula_editor").prev().attr('name');
			var tmp = $('textarea[name=formula_edit]').val();
			$('[id=formula_'+form_input_name+']').text($('textarea[name=formula_edit]').val()); 
			$('[name='+form_input_name+']').val($('textarea[name=formula_edit]').val());

			Run(); 
			$("#formula_editor").find("textarea[name=formula_edit]").text("");
			$("#formula_editor").find("div#formula_display").text("");
			
			//$("#formula_editor").animate( { height:"0px"}, 350 );
			$("#formula_editor").prev().animate( { height:"20px"}, 400 );
			//window.setTimeout('$("#formula_editor").css({display:"none"})', 351);
			//window.setTimeout('$("#formula_editor").css({display:"none"})', 402);
			$("#formula_editor").hide("slow");
			return false;
			
		}
		
		function hide_formula_editor(){
			$("#formula_editor").find("textarea[name=formula_edit]").text("");
			$("#formula_editor").find("div#formula_display").text("");
			//$("#formula_editor").animate( { height:"0px"}, 350 );
			$("#formula_editor").prev().animate( { height:"20px"}, 400 );
			//window.setTimeout('$("#formula_editor").css({display:"none"})', 351);
			//window.setTimeout('$("#formula_editor").css({display:"none"})', 401);
			$("#formula_editor").hide("slow");
			return false;
		}
		function quick_hide_formula_editor(){
			$("#formula_editor").find("textarea[name=formula_edit]").text("");
			$("#formula_editor").find("div#formula_display").text("");
			$("#formula_editor").css( { display:"none"} );
			$("#formula_editor").prev().css( { height:"20px"} );	
		}
		
		// Вставка текста из палитры 
		   function storeCaret(element)  
		   {  
					var el = $("#formula_edit")[0];
				   if (document.selection && document.selection.createRange)  
						   el.caretPos=document.selection.createRange().duplicate();  
		   }  
		 
		   function insertTextFormul()  
		   {  
					var text = this.name;
					var element = $("#formula_edit")[0];
				   if (element && element.caretPos)  
						   element.caretPos.text=text;  
				   else if (element && element.selectionStart+1 && element.selectionEnd+1)  
						   element.value=element.value.substring(0,element.selectionStart)+text+element.value.substring(element.selectionEnd,element.value.length);  
				   else if (element)
				       element.value += text;

				   return false;
		   }  
		
		
		$(document).ready(function(){
			$(".formula_input").bind("click", display_formula_editor);
			document.getElementById('formula_edit').onblur = RunEdit;
			document.getElementById('editor_input').onclick = input_and_hide_formula_editor;
			document.getElementById('editor_exit').onclick = hide_formula_editor;
			//generate_pallete(this);
		});
		