document.querySelector('.menu-btn').addEventListener('click', () =>{
    document.querySelector('.nav-menu').classList.toggle('show')

    let search = document.getElementById(srchbr);
})

function guardarPersona() {
	var Persona = {
		nombre: document.getElementById('name').value,
		apellido: document.getElementById('last').value,
		email: document.getElementById('email').value,
		mensaje: document.getElementById('message').value

	};
	console.log(Persona);
}
