const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	apoderado: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, 
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/,
	rut: /^[0-9]+[-]{1}[0-9kK]{1}$/,
	rutApoderado: /^[0-9]+[-]{1}[0-9kK]{1}$/,
	password: /^.{6,10}$/, 
	curso: /^[1-8]+[º]{1}/,
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{9}$/ 
}

const campos = {
	apoderado: false,
	nombre: false,
	password: false,
	correo: false,
	telefono: false,
	rutApoderado:false,
	curso: false,
	rut: false
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "apoderado":
			validarCampo(expresiones.apoderado, e.target, 'apoderado');
		break;
		case "rutApoderado":
			validarCampo(expresiones.rutApoderado, e.target, 'rutApoderado');
		break;
		case "nombre":
			validarCampo(expresiones.nombre, e.target, 'nombre');
		break;
		case "curso":
			validarCampo(expresiones.curso, e.target, 'curso');
		break;
		case "password":
			validarCampo(expresiones.password, e.target, 'password');
			validarPassword2();
		break;
		case "password2":
			validarPassword2();
		break;
		case "correo":
			validarCampo(expresiones.correo, e.target, 'correo');
		break;
		case "telefono":
			validarCampo(expresiones.telefono, e.target, 'telefono');
		break;
		case "rut":
			validarCampo(expresiones.rut, e.target, 'rut');
		break;
	}
}

const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`grupo_${campo}`).classList.remove('formulario_grupo-incorrecto');
		document.getElementById(`grupo_${campo}`).classList.add('formulario_grupo-correcto');
		document.querySelector(`#grupo_${campo} i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo_${campo} i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo_${campo} .formulario_input-error`).classList.remove('formulario_input-error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo_${campo}`).classList.add('formulario_grupo-incorrecto');
		document.getElementById(`grupo_${campo}`).classList.remove('formulario_grupo-correcto');
		document.querySelector(`#grupo_${campo} i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo_${campo} i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo_${campo} .formulario_input-error`).classList.add('formulario_input-error-activo');
		campos[campo] = false;
	}
}

const validarPassword2 = () => {
	const inputPassword1 = document.getElementById('password');
	const inputPassword2 = document.getElementById('password2');

	if(inputPassword1.value !== inputPassword2.value){
		document.getElementById(`grupo_password2`).classList.add('formulario_grupo-incorrecto');
		document.getElementById(`grupo_password2`).classList.remove('formulario_grupo-correcto');
		document.querySelector(`#grupo_password2 i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo_password2 i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo_password2 .formulario_input-error`).classList.add('formulario_input-error-activo');
		campos['password'] = false;
	} else {
		document.getElementById(`grupo_password2`).classList.remove('formulario_grupo-incorrecto');
		document.getElementById(`grupo_password2`).classList.add('formulario_grupo-correcto');
		document.querySelector(`#grupo_password2 i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo_password2 i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo_password2 .formulario_input-error`).classList.remove('formulario_input-error-activo');
		campos['password'] = true;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});

formulario.addEventListener('submit', (e) => {
	e.preventDefault();

	const terminos = document.getElementById('terminos');
	if(campos.apoderado && campos.rutApoderado && campos.nombre && campos.curso && campos.password && campos.correo && campos.telefono && campos.rut ){
		formulario.reset();
		document.location.href = "index.html";
	} else {
		document.getElementById('formulario_mensaje').classList.add('formulario_mensaje-activo');
	}
});