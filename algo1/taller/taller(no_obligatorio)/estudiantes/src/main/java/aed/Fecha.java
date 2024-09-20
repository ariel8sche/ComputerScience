package aed;

public class Fecha {
    public Fecha(int dia, int mes) {
        _dia = dia;
        _mes = mes;
    }

    public Fecha(Fecha fecha) {
        this._dia = fecha.dia();
        this._mes = fecha.mes();
    }

    public Integer dia() {
        return _dia;
    }

    public Integer mes() {
        return _mes;
    }

    public String toString() {
        StringBuffer sBuffer = new StringBuffer();
        sBuffer.append(this._dia);        
        sBuffer.append("/");        
        sBuffer.append(this._mes);        
        return sBuffer.toString();
    }

    @Override
    public boolean equals(Object otra) {
        boolean oen = (otra == null);
        boolean cd = otra.getClass() != this.getClass();
        
        if (oen || cd) {
            return false;
        }

        Fecha otraFecha = (Fecha) otra;

        return this._dia == otraFecha._dia && this._mes == otraFecha._mes;
    }

    public void incrementarDia() {
        if (_mes == 12) {
            if (_dia == 31) {
                _dia = 1;
                _mes = 1;
            }
        } else if (_dia < diasEnMes(_mes)) {
            _dia += 1;
        } else {
            _dia = 1;
            _mes += 1;
        }
    }

    private int diasEnMes(int mes) {
        int dias[] = {
                // ene, feb, mar, abr, may, jun
                31, 28, 31, 30, 31, 30,
                // jul, ago, sep, oct, nov, dic
                31, 31, 30, 31, 30, 31
        };
        return dias[mes - 1];
    }

    private int _dia;

    private int _mes;

}
