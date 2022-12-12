class Computadora 
{
    static contador = 0;

    constructor(marca, monitor, raton, teclado)
    {
        this._id = ++Computadora.contador;
        this._marca = marca;
        this._monitor = monitor;
        this._raton = raton;
        this._teclado = teclado;
    }

    get id()
    {
        return this._id;
    }
}