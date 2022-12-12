let monitoresArrayS = JSON.parse(localStorage.getItem('monitores'));
let tecladosArrayS = JSON.parse(localStorage.getItem('teclados'));
let ratonesArrayS = JSON.parse(localStorage.getItem('ratones'));

let computadorasStorage = JSON.parse(localStorage.getItem('computadoras'));
let computadoras = [];

let monitoresArray = [];
let tecladosArray = [];
let ratonesArray = [];

const cargarAppComputadoras = () =>
{
    cargarDatos();
    if(computadorasStorage === null)
    {
        computadoras = 
        [
            new Computadora('HP', monitoresArray[0], ratonesArray[0], tecladosArray[0]),
            new Computadora('HP', monitoresArray[1], ratonesArray[1], tecladosArray[1]),
        ]
        localStorage.setItem('computadoras', JSON.stringify(computadoras));
    }
    else
    {
        let data = JSON.parse(localStorage.getItem('computadoras'));
        for(let computadora of data)
        {
            computadoras.push(new Computadora(computadora._marca, computadora._monitor, computadora._raton, computadora._teclado))
        }
     }
     cargarComputadoras();
}

const cargarDatos = () =>
{
    for(let monitor of monitoresArrayS)
    {
        monitoresArray.push({id:monitor._id, marca:monitor._marca, tamano:monitor._tamano})
    }

    for(let teclado of tecladosArrayS)
    {
        tecladosArray.push({id:teclado._id, tipoEntrada:teclado._tipoEntrada, marca:teclado._marca})
    }

    for(let raton of ratonesArrayS)
    {
        ratonesArray.push({id:raton._id, tipoEntrada:raton._tipoEntrada, marca:raton._marca})
    }

}

const dataSelects = () =>
{
    let optionsMonitor = '';
    let optionsTeclado = '';
    let optionsRatones = '';

    for(let monitor of monitoresArray)
    {
        optionsMonitor += cargarSelectMonitores(monitor);
    }

    for(let raton of ratonesArray)
    {
        optionsRatones += cargarSelecRatones(raton);
    }

    for(let teclado of tecladosArray)
    {
        optionsTeclado += cargarSelecTeclados(teclado);
    }


    document.getElementById('select-monitor').innerHTML = `
        <option selected>Monitor</option>
        ${optionsMonitor}
    `

    document.getElementById('select-mouse').innerHTML = `
        <option selected>Mouse</option>
        ${optionsRatones}
    `

    document.getElementById('select-keyboard').innerHTML = `
        <option selected>Teclado</option>
        ${optionsTeclado}
    `
}


const cargarComputadoras = () =>
{
    let tablaComputadoras = ''

    for(let computadora of computadoras)
    {
        tablaComputadoras += cargarTablaComputadoras(computadora);
    }

    document.getElementById('table-computers').innerHTML = tablaComputadoras;
    localStorage.setItem('computadoras', JSON.stringify(computadoras));
}


const cargarTablaComputadoras = (computadora) =>
{
    let datosTabla = `
        <tr>
            <td class="align-middle">${computadora.id}</td>
            <td class="align-middle">${computadora._marca}</td>
            <td class="align-middle">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Tamaño</th>
                        </tr>
                    </thead>
                    <tbody id="table-computers">
                        <tr scope="row">
                            <td>${computadora._monitor.id}</td>
                            <td>${computadora._monitor.marca}</td>
                            <td>${computadora._monitor.tamano}</td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td class="align-middle">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Tipo Entrada</th>
                            <th scope="col">Marca</th>
                        </tr>
                    </thead>
                    <tbody id="table-computers">
                        <tr scope="row">
                            <td>${computadora._raton.id}</td>
                            <td>${computadora._raton.tipoEntrada}</td>
                            <td>${computadora._raton.marca}</td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Tipo Entrada</th>
                            <th scope="col">Marca</th>
                        </tr>
                    </thead>
                    <tbody id="table-computers">
                        <tr scope="row">
                            <td class="align-middle">${computadora._teclado.id}</td>
                            <td class="align-middle">${computadora._teclado.tipoEntrada}</td>
                            <td class="align-middle">${computadora._teclado.marca}</td>
                        </tr>
                    </tbody>
                </table>
            </td>

            <td class="align-middle">
                <button onclick="eliminarMonitor(${computadora.id})" class="btn btn-danger">
                    <i class="fas fa-trash"></i>
                </button>
                <button type="button" data-bs-toggle="offcanvas" data-bs-target="#editMonitor" aria-controls="editMonitor" onclick="buscarMonitor(${computadora.id})" class="btn btn-warning">
                    <i class="fas fa-pencil"></i>
                </button>
            </td>
        </tr>
    `;

    return datosTabla;
}


const cargarSelectMonitores = (monitor) =>
{
    let selectHTML =
    `
        <option value="${monitor.id}">${monitor.id}. | ${monitor.marca} ${monitor.tamano} </option>
    `
        return selectHTML;
}

const cargarSelecRatones = (raton) =>
{
    let selectHTML =
    `
        <option value="${raton.id}">${raton.id}. | ${raton.marca} ${raton.tipoEntrada} </option>
    `
        return selectHTML;
}


const cargarSelecTeclados = (teclado) =>
{
    let selectHTML =
    `
        <option value="${teclado.id}">${teclado.id}. | ${teclado.marca} ${teclado.tipoEntrada} </option>
    `
        return selectHTML;
}


const agregarDato = () =>
{
    event.preventDefault();

    let form = document.forms['form-add'];
    let monitorI = form['select-monitor'].selectedIndex;
    let tecladoOI = form['select-keyboard'].selectedIndex;
    let ratonI = form['select-mouse'].selectedIndex;
    let marca = form['marca'];


    if(monitorI !== 0 && tecladoOI !== 0 && ratonI !== 0 && marca.value !== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Computadora Agregado Exitosamente',
            showConfirmButton: false,
            timer: 1000
        });

        let monitor = monitoresArray.find(monitor => monitor.id === monitorI);
        let teclado = tecladosArray.find(teclado => teclado.id === tecladoOI);
        let raton = ratonesArray.find(raton => raton.id === ratonI);
        console.log(raton)
        computadoras.push(new Computadora(marca.value, monitor, raton, teclado));
        cargarComputadoras();

        marca.value = '';
    }
    else
    {
        Swal.fire({
            position: 'center',
            icon: 'error',
            title: 'Debe Ingresar Datos',
            showConfirmButton: false,
            timer: 1000
            });
    }
}