class Teclado extends DispositivoEntrada
{
    static contador = 0;

    constructor(tipoMarca, marca)
    {
        super(tipoMarca, marca);
        this._id = ++Teclado.contador;
    }

    get id()
    {
        return this._id;
    }
}