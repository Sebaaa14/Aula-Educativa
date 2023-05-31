$(document).ready(function() {

	const expresiones = {
	  rut: /^[0-9]+[-]{1}[0-9kK]{1}$/,
	  password: /^.{6,10}$/
	};
  
	const campos = {
	  password: false,
	  rut: false
	};
  
	function validarCampo(expresion, input, campo) {
	  if (expresion.test(input.val())) {
		$(`#grupo_${campo}`).removeClass('formulario_grupo-incorrecto');
		$(`#grupo_${campo}`).addClass('formulario_grupo-correcto');
		$(`#grupo_${campo} i`).addClass('fa-check-circle');
		$(`#grupo_${campo} i`).removeClass('fa-times-circle');
		$(`#grupo_${campo} .formulario_input-error`).removeClass('formulario_input-error-activo');
		campos[campo] = true;
	  } else {
		$(`#grupo_${campo}`).addClass('formulario_grupo-incorrecto');
		$(`#grupo_${campo}`).removeClass('formulario_grupo-correcto');
		$(`#grupo_${campo} i`).addClass('fa-times-circle');
		$(`#grupo_${campo} i`).removeClass('fa-check-circle');
		$(`#grupo_${campo} .formulario_input-error`).addClass('formulario_input-error-activo');
		campos[campo] = false;
	  }
	}
  
	$('#formulario input').on('keyup blur', function(e) {
	  switch (e.target.name) {
		case "password":
		  validarCampo(expresiones.password, $(this), 'password');
		  validarPassword2();
		  break;
		case "rut":
		  validarCampo(expresiones.rut, $(this), 'rut');
		  break;
	  }
	});
  
	$('#formulario').on('submit', function(e) {
	  e.preventDefault();
	  if (campos.password && campos.rut) {
		formulario.reset();
		document.location.href = "mainpage.html";
	  } else {
		$('#formulario_mensaje').addClass('formulario_mensaje-activo');
	  }
	});
  
  });
  